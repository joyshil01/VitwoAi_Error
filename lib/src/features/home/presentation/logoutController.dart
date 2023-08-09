// ignore_for_file: file_names

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/logoutRepository.dart';

class LogoutVendorController extends StateNotifier<AsyncValue> {
  final LogoutVendorRepository logoutVendorRepository;

  LogoutVendorController({required this.logoutVendorRepository})
      : super(const AsyncValue<void>.data(null));

  Future<bool> logoutVendor() async {
    try {
      state = const AsyncValue.loading();
      await logoutVendorRepository.logoutVendor();
      state = const AsyncValue.data(null);
      print('success from controller');
      return true;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      print('failure from controller');
      return false;
    }
  }
}

final logoutVendorControllerProvider =
    StateNotifierProvider<LogoutVendorController, AsyncValue>((ref) {
  final logoutVendorRepository = ref.watch(logoutVendorRepositoryProvider);
  return LogoutVendorController(logoutVendorRepository: logoutVendorRepository);
});
