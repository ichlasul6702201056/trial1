import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trial1/components/custom_drawer.dart';
import 'package:trial1/screens/book/book_home.dart';
import 'package:trial1/screens/book/book_grid_view_more.dart';
import 'package:trial1/screens/book/book_search.dart';
import 'package:trial1/screens/common/login.dart';
import 'package:trial1/screens/setting.dart';
import 'package:trial1/screens/vid/vid_home.dart';
import 'package:trial1/themes/color.dart';
import 'package:trial1/themes/typo.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
            return Login();
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
