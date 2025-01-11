import 'package:flutter/material.dart';

class MiniLogoBox extends StatelessWidget {
  const MiniLogoBox({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 50,
      height: 50,
      child: Image(
        image: AssetImage('assets/images/logo2.png'),
        fit: BoxFit.contain,
      ),
    );
  }
}
