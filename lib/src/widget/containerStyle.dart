import 'package:flutter/material.dart';

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
