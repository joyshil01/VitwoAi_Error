// ignore_for_file: file_names

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../routing/app_router.dart';
import 'loginController.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  final email = TextEditingController();
  final passWord = TextEditingController();
  String? fcm;
  Future<void> fcmCodeGenerate() async {
    fcm = await FirebaseMessaging.instance.getToken();
    print('FCM CODE: $fcm');
  }

  @override
  void initState() {
    fcmCodeGenerate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue>(loginScreenControllerProvider,
        (previousState, state) {
      if (!state.isLoading && state.hasError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(state.error.toString()),
            backgroundColor: Colors.red.shade300,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        );
      }
    });
    final state = ref.watch(loginScreenControllerProvider);
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
          controller: passWord,
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
            onPressed: () async {
              if (email.text == null || email.text == '') {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Enter your email',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 16, color: Colors.white),
                    ),
                    elevation: 5,
                    backgroundColor: Colors.red.shade300,
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                );
              } else if (passWord.text == null || passWord.text == '') {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Enter your password',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 16, color: Colors.white),
                    ),
                    elevation: 5,
                    backgroundColor: Colors.red.shade300,
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                );
              } else {
                final success = await ref
                    .read(loginScreenControllerProvider.notifier)
                    .signInWithEmailAndPassword(
                      email.text,
                      passWord.text,
                      fcm,
                    );
                if (success) {
                  context.pushReplacementNamed(AppRoute.home.name);
                  
                }
              }
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
