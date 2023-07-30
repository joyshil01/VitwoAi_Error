// ignore_for_file: file_names

import 'package:error/src/widget/navBottom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final email = TextEditingController();
    final password = TextEditingController();
    return Column(
      children: [
        TextField(
          controller: email,
          cursorColor: Colors.black,
          textInputAction: TextInputAction.next,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16),
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: const Icon(
              Icons.person_2_outlined,
              color: Colors.black,
            ),
            hintText: 'E-Mail',
            hintStyle: Theme.of(context).textTheme.bodyMedium,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
                width: 1,
              ),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
                width: 1.8,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        TextField(
          controller: password,
          cursorColor: Colors.black,
          textInputAction: TextInputAction.next,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16),
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: const Icon(
              Icons.lock_outline,
              color: Colors.black,
            ),
            hintText: 'Password',
            hintStyle: Theme.of(context).textTheme.bodyMedium,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
                width: 1,
              ),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
                width: 1.8,
              ),
            ),
          ),
        ),
        const SizedBox(height: 45),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              foregroundColor: Colors.black,
              side: const BorderSide(color: Colors.black),
              padding: const EdgeInsets.symmetric(vertical: 15),
            ),
            onPressed: () {
              Get.to(() => const MainPage());
            },
            child: Text(
              'login'.toUpperCase(),
            ),
          ),
        ),
      ],
    );
  }
}
