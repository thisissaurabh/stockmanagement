import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spyco_shop_management/constants/shared_prefs.dart';
import 'package:spyco_shop_management/constants/urls.dart';

Future<dynamic> logoutApi() async {
  var prefs = await SharedPreferences.getInstance();
  var v = prefs.getString(Keys().token);
  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer $v',
    // 'Cookie': 'spycotech_session=m0RqjeZFZAi9wDXxjA0A26VAad0godXu8jQUWZkK'
  };
  var request = http.MultipartRequest('GET', Uri.parse('$baseUrl/logout'));
  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();
  var resp = jsonDecode(await response.stream.bytesToString());
  print(resp);
  if (response.statusCode == 200) {
    return resp;
  } else {
    print(resp);
    print(response.reasonPhrase);
    print(response.statusCode);
    return resp;
  }

}