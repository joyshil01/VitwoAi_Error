import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import '../../login/presentation/loginScreen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 1500,
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      splash: Center(
        child: Container(
          child: Image.asset(
            'assets/vitwo-ai-loader.gif',
            fit: BoxFit.cover,
          ),
        ),
      ),
      nextScreen: const LoginScreen(),
    );
  }
}
