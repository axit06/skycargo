import 'dart:convert';
import 'package:http/http.dart'as http;

import 'model/apimodel.dart';
import 'model/state_api.dart';

class ApiService {
  static const String baseUrl = 'http://13.127.41.199:4000/Api/Login';
 static Future<User> login(String email, String password,bool submit) async {
    User? user;
    const String apiUrl = baseUrl;
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    final Map body = {
      'email': email,
      'password': password,
    };
   print(body);
   print(apiUrl);
    final response = await http.post(Uri.parse(apiUrl), headers: headers, body: json.encode(body));

    if (response.statusCode == 200) {
      submit = true;
      print(submit);
      print("00000000000000000000000000000000000${response.body}");
      var result = json.decode(response.body);
      user = User.fromJson(result);
    }
    return user!;
  }
}
