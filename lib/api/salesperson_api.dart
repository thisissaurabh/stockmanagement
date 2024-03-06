import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spyco_shop_management/constants/shared_prefs.dart';
import 'package:spyco_shop_management/constants/urls.dart';

Future<dynamic> getSalesPersonApi() async {
  var prefs = await SharedPreferences.getInstance();
  var v = prefs.getString(Keys().token);
  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer $v' };
  var request = http.Request('GET', Uri.parse('$baseUrl/salespersons'));
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


Future<dynamic> addSalesPersonApi({
  required String name,
  required String email,
  required String phone,
  required String photo,

}) async {
  var prefs = await SharedPreferences.getInstance();
  var v = prefs.getString(Keys().token);
  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer $v'
  };
  var request = http.MultipartRequest(
      'POST', Uri.parse('$baseUrl/store-salespersons'));
  request.fields.addAll({
    'name': name,
    'email': email,
    'phone': phone
  });
  request.files.add(await http.MultipartFile.fromPath('photo', photo));
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

