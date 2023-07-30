// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'fadeAnimationModel.dart';
import 'fadeController.dart';

class SFadeINAnimation extends StatelessWidget {
  SFadeINAnimation({
    Key? key,
    required this.durationInMs,
    required this.child,
    this.animationPosition,
  }) : super(key: key);

  final controller = Get.put(FadeController());
  final int durationInMs;
  final SAnimationPosition? animationPosition;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedPositioned(
        duration: Duration(milliseconds: durationInMs),
        top: controller.animate.value
            ? animationPosition!.topAfter
            : animationPosition!.topBefore,
        left: controller.animate.value
            ? animationPosition!.leftAfter
            : animationPosition!.leftBefore,
        bottom: controller.animate.value
            ? animationPosition!.bottomAfter
            : animationPosition!.bottomBefore,
        right: controller.animate.value
            ? animationPosition!.rightAfter
            : animationPosition!.rightBefore,
        child: AnimatedOpacity(
          duration: Duration(milliseconds: durationInMs),
          opacity: controller.animate.value ? 1 : 0,
          child: child,
        ),
      ),
    );
  }
}
