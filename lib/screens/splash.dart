import 'package:flutter/material.dart';
import 'package:trial1/themes/color.dart';
import 'package:trial1/themes/typo.dart';
import 'package:go_router/go_router.dart';
import 'dart:async';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      context.replace('/home');
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
          ),
        ],
      ),
    );
  }
}
