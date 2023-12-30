import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:spyco_shop_management/api_models/login_model.dart';
import 'package:spyco_shop_management/constants/urls.dart';

Future<dynamic> loginApi({
  required String username,
  required String password,
}) async {
  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYjM3MDQ2YTAzNDljZDc1NzZkN2RjZjMzYzgxZWQ5ZDU1Zjg3NWNmZmRiYzUwMjVhMWExYmJmZmJhMjlkNGY4Y2RlYTJjNjJmNGNlMWYwNWMiLCJpYXQiOjE3MDM2MTQ4ODguMzc4MTgsIm5iZiI6MTcwMzYxNDg4OC4zNzgxODEsImV4cCI6MTcxOTQyNjA4OC4zNzQ4MDcsInN1YiI6IjEiLCJzY29wZXMiOltdfQ.CQYKxMGrpHxQbF1lnR0qr4kGf45PYCN1Ktl1-nRLnNJ_dELNq9-W8W_psgLsbDfBMJSxJoJ8W9VzONQCYXM6n_-hKj1OPGPtsxpmP5te-sBdI8Bee6eS0n2LXBjMNrutBB86OjCkEn1YP1SH7tLamqYCBfI5tEHLQ-wyK83mBPrqWXCaRCtRRDWZmR_m1n4W2oI6z_TTW2aBG9b_3cG_-5W8suHCPk831vVEg60vcVHmA4DQfHaiJhlhmHPSK_U05ejzk97gnx-21P-V956CfzayTO5jUb-E9rEJDeRcAA5kQPjglQFfInUTP2DKm3LYjhWnQPpX51p5cFDfhFhI5qL-pbw0j051idtgmXC7fm0-4S-g4wvU87I-ARe07a4heANrxzS5IQ7vSGBOZEi_fNtcdRQRhDjOW5_7p7bl7cLVLjZfRh_FNEw4I1bXUQbuD2le6lqFupAAOn859jtfXSKHMW4RepcwcJmhqcQfE8zULzAm6K7SJ-snnQlCx2cSNer_-szgvlkJkGTplExL-RSS-AxJ6LheJaCyfMWikJ3GWmSTLgpd_o0mq54VD5s_CU9LV9dfto5vGNs2_4ZnsFXJ6S1X6cwvhIvNWpwG3W0nEHzmK2HpMdORkZPhvZvILOwKn_06IRun20lFNfIiBzB3mKJEug6orAaTSqvEmfY',
    'Cookie': 'spycotech_session=awdRNPo2crklpF9lCQypMMIKeducFb68ptpkVI5I'
  };
  var request = http.MultipartRequest('POST', Uri.parse('$baseUrl/user-login'));
  request.fields.addAll({
    'emailorusername': username,
    'password': password,
  });
  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();
  var resp = jsonDecode(await response.stream.bytesToString());
  if(response.statusCode == 200) {
    if(resp['status'] == 1){
      print(resp);
      return LoginResponse.fromJson(resp);
    }
  } else {
    print(resp);
    print(response.statusCode);
    print(response.reasonPhrase);
    return false;
  }
}