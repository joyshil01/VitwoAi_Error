import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Complete_Screen extends StatefulWidget {
  const Complete_Screen({super.key});

  @override
  State<Complete_Screen> createState() => _Complete_ScreenState();
}

class _Complete_ScreenState extends State<Complete_Screen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        'assets/json/chat.json',
      ),
    );
  }
}
