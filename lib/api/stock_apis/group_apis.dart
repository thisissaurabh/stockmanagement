import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spyco_shop_management/constants/shared_prefs.dart';
import 'package:http/http.dart' as http;
import 'package:spyco_shop_management/constants/urls.dart';
import '../../api_models/add_group_model.dart';
import '../../api_models/group_model.dart';


Future <dynamic>addGroupApi({
  required String groupName,
  required String hsnCode,
  required String cgst,
  required String sgst,
  required String igst,
  required String cess,
}) async{
  var prefs = await SharedPreferences.getInstance();
  var v = prefs.getString(Keys().token);
  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer $v' };
  var request = http.MultipartRequest('POST', Uri.parse('$baseUrl/store-group'));
  request.fields.addAll({
    'group_name': groupName,
    'hsn_sac_code': hsnCode,
    'cgst': cgst,
    'sgst': sgst,
    'igst': igst,
    'cess': cess
  });
  request.headers.addAll(headers);
  print(request.fields);
  http.StreamedResponse response = await request.send();
  var resp = jsonDecode(await response.stream.bytesToString());
  print(resp);
  if (response.statusCode == 200) {
    print(resp);
    return resp;
  } else {
    print(resp);
    print(response.statusCode);
    print(response.reasonPhrase);
    return resp;
  }
  /*if (response.statusCode == 200) {
    if (resp['status'] == 1) {
      return AddGroupModel.fromJson(resp);
    }  else {
      print(resp);
      print(response.statusCode);
      print(response.reasonPhrase);
      return false;
    }
    }*/
    }





Future<dynamic> getGroupApi() async {
  var prefs = await SharedPreferences.getInstance();
  var v = prefs.getString(Keys().token);
  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer $v' };
  var request = http.Request('GET', Uri.parse('$baseUrl/get-group-data/'));
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

Future addBrandApi({
  required String id,
  required String brandName,

}) async{
  var prefs = await SharedPreferences.getInstance();
  var v = prefs.getString(Keys().token);
  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer $v' };
  var request = http.MultipartRequest('POST', Uri.parse('$baseUrl/group-brand'));
  request.fields.addAll({
    'group_id': id,
    'brand_name': brandName
  });

  request.headers.addAll(headers);
  print(request.fields);

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


Future<dynamic> getBrandApi({
  required String groupId,
}) async {
  var prefs = await SharedPreferences.getInstance();
  var v = prefs.getString(Keys().token);
  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer $v' };
  var request = http.Request('GET', Uri.parse('$baseUrl/group-brands/$groupId/'));
  request.headers.addAll(headers);
  print(request);
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

