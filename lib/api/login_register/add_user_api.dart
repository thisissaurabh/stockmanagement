import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spyco_shop_management/constants/shared_prefs.dart';
import 'package:spyco_shop_management/constants/urls.dart';

Future<dynamic> addUserApi({
  required String name,
  required String email,
  required String username,
  required String companyLocation,
  required String role,
  required String phNo,
  required String password,
  required String confirmPassword,

}) async {
  var prefs = await SharedPreferences.getInstance();
  var v = prefs.getString(Keys().token);
  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer $v'
  };
  var request = http.MultipartRequest(
      'POST', Uri.parse('$baseUrl/user-addbyadmin'));
  request.fields.addAll({
    'name': name,
    'email':email,
    'phone': phNo,
    'user_name': username,
    'password': password,
    'password_confirmation': confirmPassword,
    'company_name': companyLocation,
    'role': role
  });
  request.headers.addAll(headers);
  print(headers);
  print(request.fields);
  http.StreamedResponse response = await request.send();
  var resp = jsonDecode(await response.stream.bytesToString());
  if (response.statusCode == 200) {
    print(resp);
    return resp;
  } else {
    print(resp);
    print(response.statusCode);
    print(response.reasonPhrase);
    return resp;
  }
}



Future<dynamic> getUsersApi() async {
  var prefs = await SharedPreferences.getInstance();
  var v = prefs.getString(Keys().token);
  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer $v' };
  var request = http.Request('GET', Uri.parse('$baseUrl/get-admin-user'));
  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();
  var resp = jsonDecode(await response.stream.bytesToString());
  if (response.statusCode == 200) {
    print(resp);
    return resp;
  } else {
    print(resp);
    print(response.statusCode);
    print(response.reasonPhrase);
    return resp;
  }
}