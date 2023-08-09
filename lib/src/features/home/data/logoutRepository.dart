// ignore_for_file: file_names

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../utils/api_urls.dart';

class LogoutVendorRepository {
  Future<void> logoutVendor() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    var uri = Uri.parse(logOutUrl);

    var request = http.MultipartRequest('POST', uri);

    request.headers.addAll(
        {'Authorization': 'Bearer ${sharedPreferences.getString('token')}'});

    var response = await request.send();

    if (response.statusCode == 200) {
      print('response: $response');
      print('success');
    } else {
      print('failure');
      throw Exception('Could not logout');
    }
  }
}

final logoutVendorRepositoryProvider = Provider<LogoutVendorRepository>((ref) {
  return LogoutVendorRepository();
});

final logoutVendorProvider = FutureProvider<void>((ref) async {
  final logoutVendorRepository = ref.watch(logoutVendorRepositoryProvider);
  return logoutVendorRepository.logoutVendor();
});
