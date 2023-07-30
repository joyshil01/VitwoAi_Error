// ignore_for_file: file_names

import 'package:get/get.dart';

class FadeController extends GetxController {
  static FadeController get find => Get.find();

  RxBool animate = false.obs;
  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    animate.value = true;
  }
}
