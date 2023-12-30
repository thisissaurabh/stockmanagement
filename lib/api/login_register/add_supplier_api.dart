import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spyco_shop_management/constants/shared_prefs.dart';
import 'package:spyco_shop_management/constants/urls.dart';

Future<dynamic> addCustomerSupplierApi({
  required String businessType,
  required String userType,
  required String firstName,
  required String secondName,
  required String companyName,
  required String mail,
  required String phoneNo,
  required String workNo,
  required String otherDetails,
  required String gstNo,
  required String companyAddress,
  required String city,
  required String state,
}) async {

  var prefs = await SharedPreferences.getInstance();
  var v = prefs.getString(Keys().token);


  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer $v'
  };
  var request = http.MultipartRequest(
      'POST', Uri.parse('$baseUrl/user-customers-add'));
  request.fields.addAll({
    'business_type': businessType,
    'user_customer_type': userType,
    'first_name': firstName,
    'second_name': secondName,
    'company_name': companyName,
    'mail': mail,
    'phone': phoneNo,
    'work': workNo,
    'other_details': otherDetails,
    'gst_no': gstNo,
    'company_address': companyAddress,
    'city': city,
    'state': state
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
