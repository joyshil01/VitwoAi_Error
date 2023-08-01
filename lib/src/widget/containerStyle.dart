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
    return Card(
      color: Colors.white,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: child,
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
    return Card(
      color: Colors.white,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: child,
    );
  }
}
