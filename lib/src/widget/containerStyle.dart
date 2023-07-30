import 'dart:ui';
import 'package:flutter/material.dart';
import '../../constans.dart';

class ContainerStyle extends StatelessWidget {
  final Widget child;
  final double? width;

  ContainerStyle({
    // required this.height,
    required this.child,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return ClipRRect(
      borderRadius: BorderRadius.circular(width * 0.01),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: child,
      ),
    );
  }
}

class ContainerCopyStyle extends StatelessWidget {
  final Widget child;
  final double? width;

  const ContainerCopyStyle({
    required this.child,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return ClipRRect(
      borderRadius: BorderRadius.circular(width * 0.01),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: containerCopyStyle,
          borderRadius: BorderRadius.circular(20),
          // boxShadow: [
          //   BoxShadow(
          //     // color: Color.fromARGB(255, 184, 182, 182),
          //     offset: Offset(5, 5),
          //     blurRadius: 10,
          //     spreadRadius: 20
          //   ),
          // ],
        ),
        child: child,
      ),
    );
  }
}
