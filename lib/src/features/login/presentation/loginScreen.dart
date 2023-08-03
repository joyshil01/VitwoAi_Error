import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../widget/animation/animatedWidget.dart';
import '../../../widget/animation/fadeAnimationModel.dart';
import '../../../widget/animation/fadeController.dart';
import 'loginForm.dart';
import 'loginText.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    // final controller = Get.put(FadeController());
    // controller.startAnimation();
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(30),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Lottie.asset(
                    'assets/json/vitwoAi.json',
                    height: height * 0.4,
                  ),
                  const LoginText(),
                  const SizedBox(height: 25),
                  const LoginForm(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
