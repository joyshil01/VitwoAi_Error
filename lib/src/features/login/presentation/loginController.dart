// ignore_for_file: file_names

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/auth_repository.dart';

class LoginController extends StateNotifier<AsyncValue> {
  LoginController({required this.authRepository})
      : super(const AsyncValue<void>.data(null));

  final AuthRepository authRepository;

  Future<bool> signInWithEmailAndPassword(
      String email, String passWord, String? fcm) async {
    try {
      state = const AsyncValue.loading();
      await authRepository.signInWithEmailAndPassword(email, passWord, fcm);
      state = const AsyncValue.data(null);
      print('state: $state');
      print('success from controller');
      return true;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      print('failure from controller');
      return false;
    }
  }
}

final loginScreenControllerProvider =
    StateNotifierProvider<LoginController, AsyncValue>(
  (ref) {
    final authRepository = ref.watch(authRepositoryProvider);
    return LoginController(authRepository: authRepository);
  },
);
