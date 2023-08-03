// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/api_urls.dart';
import '../../../utils/in_memory_store.dart';
import '../domain/app_user.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  final _authState = InMemoryStore<AppUser?>(null);
  Stream<AppUser?> authStateChanges() => _authState.stream;
  AppUser? get currentUser => _authState.value;

  Future<void> signInWithEmailAndPassword(
      String email, String passWord, String? fcm) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    var uri = Uri.parse(loginUrl);
    var request = http.MultipartRequest('POST', uri);

    request.fields['fldAdminEmail'] = email;
    request.fields['pass'] = passWord;
    request.fields['fcm'] = fcm!;

    var response = await request.send();
    if (response.statusCode == 200) {
      var response2 = await http.Response.fromStream(response);
      var responseDecoded = json.decode(response2.body);
      print('success');
      if (responseDecoded['status'] == "success") {
        var token = responseDecoded['token'];
        var userId = responseDecoded['data']['user_id'];
        var userType = responseDecoded['data']['user_type'];
        var userImage = responseDecoded['data']['user_profile'];
        var userName = responseDecoded['data']['user_name'];

        sharedPreferences.setString('token', token);
        sharedPreferences.setString('userId', userId);
        sharedPreferences.setString('userType', userType);
        sharedPreferences.setString('userImage', userImage);
        sharedPreferences.setString('userName', userName);
        print('token: ${sharedPreferences.getString('token')}');
      } else {
        print('failure');
        throw Exception(responseDecoded['message']);
      }
    } else {
      print('failure');
      throw Exception("Invalid credentials, please try again!");
    }
  }

  Future<void> signOut() async {
    _authState.value = null; //setting the latest value in the stream to be null
  }

  void dispose() => _authState.close();
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final auth = AuthRepository();
  ref.onDispose(() => auth.dispose());
  return auth;
});

final authStateChangesProvider = StreamProvider<AppUser?>((ref) {
  final authRepository = AuthRepository();
  return authRepository.authStateChanges();
});
