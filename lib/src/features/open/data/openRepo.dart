// ignore_for_file: file_names

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../utils/api_urls.dart';

class OpenRepository {
  Future<void> _fetchOpenbug() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    var uri = Uri.parse(openList);

    var request = http.MultipartRequest('POST', uri);

    
  }
}
