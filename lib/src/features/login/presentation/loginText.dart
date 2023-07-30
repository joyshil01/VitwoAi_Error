// ignore_for_file: file_names

import 'package:flutter/material.dart';

class LoginText extends StatelessWidget {
  const LoginText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Welcome Back',
          style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 32),
        ),
        Text(
          'Vitwo ai error handling...',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 20),
        ),
      ],
    );
  }
}
