
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spyco_shop_management/constants/shared_prefs.dart';
import 'package:spyco_shop_management/constants/urls.dart';
Future<dynamic> getSupplierNameApi() async {
  var prefs = await SharedPreferences.getInstance();
  var v = prefs.getString(Keys().token);
  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer $v' };
  var request = http.Request('GET', Uri.parse('$baseUrl/get-all-sipplier/'));
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