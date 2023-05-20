import 'dart:async';

import 'package:flutter/material.dart';

import 'MyRoutes.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {

  void changeScreen() {
    Timer.periodic(const Duration(milliseconds: 50), (timer) {
      setState(() {
      });
    });

    Timer.periodic(
      const Duration(seconds: 3),
          (tick) {
        Navigator.of(context).pushReplacementNamed(MyRoutes.homepage);
        tick.cancel();
      },
    );
  }

  @override
  void initState() {
    super.initState();
    changeScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Spacer(
              flex: 3,
            ),
            Image.asset("assets/images/contact1.png"),
            const Spacer(),
            const Spacer(),
            CircularProgressIndicator(
              backgroundColor: Colors.red.shade200,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}