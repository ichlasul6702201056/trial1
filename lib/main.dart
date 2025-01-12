import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:trial1/components/custom_drawer.dart';
import 'package:trial1/screens/book/book_home.dart';
import 'package:trial1/screens/book/book_grid_view_more.dart';
import 'package:trial1/screens/book/book_search.dart';
import 'package:trial1/screens/calculator/calc_home.dart';
import 'package:trial1/screens/chat/chat_home.dart';
import 'package:trial1/screens/common/login.dart';
import 'package:trial1/screens/contact/contact_home.dart';
import 'package:trial1/screens/login/login_main.dart';
import 'package:trial1/screens/setting.dart';
import 'package:trial1/screens/vid/vid_home.dart';
import 'package:trial1/themes/color.dart';
import 'package:trial1/themes/typo.dart';
import 'package:flutter/services.dart';
import 'package:trial1/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    print('Error initializing Firebase: $e');
  }

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.blueAccent,
    ),
  );
  runApp(const MainApp());
}

bool isFirstLaunch = true;

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        if (isFirstLaunch) {
          return const Splash();
        }
        return const BookHome();
      },
      routes: <RouteBase>[
        // common
        GoRoute(
          path: 'drawer',
          builder: (BuildContext context, GoRouterState state) {
            return CustomDrawer();
          },
        ),
        GoRoute(
          path: 'setting',
          builder: (BuildContext context, GoRouterState state) {
            return Setting();
          },
        ),
        GoRoute(
          path: 'login',
          builder: (BuildContext context, GoRouterState state) {
            return LoginMain();
          },
        ),

        // book
        GoRoute(
          path: 'book/home',
          builder: (BuildContext context, GoRouterState state) {
            return const BookHome();
          },
        ),
        GoRoute(
          path: 'book/see-more',
          builder: (BuildContext context, GoRouterState state) {
            final String title = state.extra as String;
            return GridViewMore(title: title);
          },
        ),
        GoRoute(
          path: 'book/search',
          builder: (BuildContext context, GoRouterState state) {
            return BookSearch();
          },
        ),

        // vid
        GoRoute(
          path: 'vid/home',
          builder: (BuildContext context, GoRouterState state) {
            return VidHome();
          },
        ),

        // calc
        GoRoute(
          path: 'calc',
          builder: (BuildContext context, GoRouterState state) {
            return CalcHome();
          },
        ),

        // contact
        GoRoute(
          path: 'contact',
          builder: (BuildContext context, GoRouterState state) {
            return ContactHome();
          },
        ),

        // chat
        GoRoute(
          path: 'chat',
          builder: (BuildContext context, GoRouterState state) {
            return ChatHome();
          },
        ),
      ],
    ),
  ],
);

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        isFirstLaunch = false;
      });
      context.replace('/book/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColorTheme.primary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage('assets/images/logo.png'),
          ),
          Text(
            'My Book',
            style: Typo.Splash,
          )
        ],
      ),
    );
  }
}
