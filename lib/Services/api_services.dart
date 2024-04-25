import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class ApiManager {
  static final client = http.Client();
  static const String baseUrl = 'https://asapapi.srvinfotech.com/';
  static const String accessToken =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NWU1NjIyYjhhOTExMjcxMGZkZGE5ZjYiLCJpYXQiOjE3MTM4NDUyODUsImV4cCI6MTcxNTU3MzI4NX0.9Je7bJl4tnR18tc0k7pT7kQ38jB1PZDsIZHoI6ltv2I';
  static Future fetchData({
    String? api,
  }) async {
    try {
      print(baseUrl + api!);
      var responses = await client.get(Uri.parse('${baseUrl}$api'),
          headers: {'x-access-token': accessToken});
      if (responses.statusCode == 200) {
        var jsonResponse = jsonDecode(responses.body);
        print(jsonResponse);
        return jsonResponse;
      } else {
        throw Exception('Please check your connection settings');
      }
    } catch (e) {
      // SnackbarServices.errorSnackbar(e.toString());
      return null;
    }
  }
}
