import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:spyco_shop_management/constants/urls.dart';

Future registerApi({
  required String email,

}) async{
  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMmMyNGFkMTEyNzllZGViMjVlODg2NjBiYWZmYzI1ZDMwOTBjNjcxNzBmMTkzYzgyYTgzM2M1MGU4YmE2ODZjZjFlNDNhNDk2MWI1OTliNzgiLCJpYXQiOjE3MDM0MTQzMjAuMzk0NTQyLCJuYmYiOjE3MDM0MTQzMjAuMzk0NTQ0LCJleHAiOjE3MTkyMjU1MjAuMzkzNzUyLCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.B60bt6VZGZ8wmC8hYczWZTKpUFUgUFVQM6KBL9wrK9JK_-cZ_LsoJp2C1okV6OUmLlsNU7cf2nqt6ilEjj0BIAsYZRzSDOqxH5xJBuDdNnsl8y0Dqr4Yg5E4EUqxp9CIFrSOxO2tGGnj6X8wq_P7WvPGD7HcqqT-2Y8uWomtCgr3hHZO80Bmt5-ubb08uxs6uCpOyqAMorcRKjvUDd14-JkhYTVQwDHYpZwClpisnrBf0h5PgJ92UjMU3DEsh6na6_J0yX8BeHBTBvksMWuEVTOnTerzMuXzac1-e02bcb_EFBp-nK2d25yTQxo_FVQBwkBwnXM4GZEMjyYm0c1i0HldZwFNJ0xm2vENnvs-XG5DBzuEzbBuoZBvTCLj1KgR5P0uO21YpX7dKSqwo_5acqJybX9peDKZeMWVjimNAfrhCg_mdHKzvVVgBejERtXC95Pqrod36Zk7csD7YWIhZuw5e8ACuyjEsPm04VWGwUNdbG95AmQTCqzxxaEYFT_lf3UaNK7QWIR_79aOaUp6o3QJDy-rn8pYGSx5X6gVvaNMB9nWsEVp8KpgkTtvXaYSHn0AsKRsnqvItyKrV78Up-sc2LvplsTWGThgizBeW1xycO9Hs3Rjd-qd3M4QJ44E8y_QeIahLbH3oI8SdcMIKN4CyqFjeTWrPSQjS9Gbb2o',
    'Cookie': 'spycotech_session=BuWZdWHc2TtmESxWIW01qWTO6ptbH3YCarj6l2ej'
  };
  var request = http.MultipartRequest('POST', Uri.parse('$baseUrl/send-email-otp'));
  request.fields.addAll({
    'email': email,
  });

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


Future<dynamic> enterOtpApi({
  required String otp,
}) async{
  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMmMyNGFkMTEyNzllZGViMjVlODg2NjBiYWZmYzI1ZDMwOTBjNjcxNzBmMTkzYzgyYTgzM2M1MGU4YmE2ODZjZjFlNDNhNDk2MWI1OTliNzgiLCJpYXQiOjE3MDM0MTQzMjAuMzk0NTQyLCJuYmYiOjE3MDM0MTQzMjAuMzk0NTQ0LCJleHAiOjE3MTkyMjU1MjAuMzkzNzUyLCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.B60bt6VZGZ8wmC8hYczWZTKpUFUgUFVQM6KBL9wrK9JK_-cZ_LsoJp2C1okV6OUmLlsNU7cf2nqt6ilEjj0BIAsYZRzSDOqxH5xJBuDdNnsl8y0Dqr4Yg5E4EUqxp9CIFrSOxO2tGGnj6X8wq_P7WvPGD7HcqqT-2Y8uWomtCgr3hHZO80Bmt5-ubb08uxs6uCpOyqAMorcRKjvUDd14-JkhYTVQwDHYpZwClpisnrBf0h5PgJ92UjMU3DEsh6na6_J0yX8BeHBTBvksMWuEVTOnTerzMuXzac1-e02bcb_EFBp-nK2d25yTQxo_FVQBwkBwnXM4GZEMjyYm0c1i0HldZwFNJ0xm2vENnvs-XG5DBzuEzbBuoZBvTCLj1KgR5P0uO21YpX7dKSqwo_5acqJybX9peDKZeMWVjimNAfrhCg_mdHKzvVVgBejERtXC95Pqrod36Zk7csD7YWIhZuw5e8ACuyjEsPm04VWGwUNdbG95AmQTCqzxxaEYFT_lf3UaNK7QWIR_79aOaUp6o3QJDy-rn8pYGSx5X6gVvaNMB9nWsEVp8KpgkTtvXaYSHn0AsKRsnqvItyKrV78Up-sc2LvplsTWGThgizBeW1xycO9Hs3Rjd-qd3M4QJ44E8y_QeIahLbH3oI8SdcMIKN4CyqFjeTWrPSQjS9Gbb2o',
    'Cookie': 'spycotech_session=BuWZdWHc2TtmESxWIW01qWTO6ptbH3YCarj6l2ej'
  };
  var request = http.MultipartRequest('POST', Uri.parse('$baseUrl/verify-Otp'));
  request.fields.addAll({
    'otp': otp,
  });

  request.headers.addAll(headers);
  print(request.fields);

  http.StreamedResponse response = await request.send();
  var resp = jsonDecode(await response.stream.bytesToString());
  if (response.statusCode == 200) {
    print(resp);
    return resp;
  } else {
    print(resp);
    print(response.reasonPhrase);
    print(response.statusCode);
    return resp;
  }
}


Future<dynamic> companyRegister({
  required String name,
  required String companyName,
  required String userName,
  required String gstNo,
  required String address,
  required String zipCode,
  required String city,
  required String state,
  required String photo,
}) async {
  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMmMyNGFkMTEyNzllZGViMjVlODg2NjBiYWZmYzI1ZDMwOTBjNjcxNzBmMTkzYzgyYTgzM2M1MGU4YmE2ODZjZjFlNDNhNDk2MWI1OTliNzgiLCJpYXQiOjE3MDM0MTQzMjAuMzk0NTQyLCJuYmYiOjE3MDM0MTQzMjAuMzk0NTQ0LCJleHAiOjE3MTkyMjU1MjAuMzkzNzUyLCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.B60bt6VZGZ8wmC8hYczWZTKpUFUgUFVQM6KBL9wrK9JK_-cZ_LsoJp2C1okV6OUmLlsNU7cf2nqt6ilEjj0BIAsYZRzSDOqxH5xJBuDdNnsl8y0Dqr4Yg5E4EUqxp9CIFrSOxO2tGGnj6X8wq_P7WvPGD7HcqqT-2Y8uWomtCgr3hHZO80Bmt5-ubb08uxs6uCpOyqAMorcRKjvUDd14-JkhYTVQwDHYpZwClpisnrBf0h5PgJ92UjMU3DEsh6na6_J0yX8BeHBTBvksMWuEVTOnTerzMuXzac1-e02bcb_EFBp-nK2d25yTQxo_FVQBwkBwnXM4GZEMjyYm0c1i0HldZwFNJ0xm2vENnvs-XG5DBzuEzbBuoZBvTCLj1KgR5P0uO21YpX7dKSqwo_5acqJybX9peDKZeMWVjimNAfrhCg_mdHKzvVVgBejERtXC95Pqrod36Zk7csD7YWIhZuw5e8ACuyjEsPm04VWGwUNdbG95AmQTCqzxxaEYFT_lf3UaNK7QWIR_79aOaUp6o3QJDy-rn8pYGSx5X6gVvaNMB9nWsEVp8KpgkTtvXaYSHn0AsKRsnqvItyKrV78Up-sc2LvplsTWGThgizBeW1xycO9Hs3Rjd-qd3M4QJ44E8y_QeIahLbH3oI8SdcMIKN4CyqFjeTWrPSQjS9Gbb2o',
    'Cookie': 'spycotech_session=BuWZdWHc2TtmESxWIW01qWTO6ptbH3YCarj6l2ej'
  };
  var request = http.MultipartRequest('POST', Uri.parse('$baseUrl/user-register'));
  request.fields.addAll({
    'name': name,
    'copanyName': companyName,
    'userName': userName,
    'gstNumber': gstNo,
    'address': address,
    'zip_code': zipCode,
    'city': city,
    'state': state,
  });
  request.files.add(await http.MultipartFile.fromPath(
      'image_url', photo));
  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();
  var resp = jsonDecode(await response.stream.bytesToString());
  if (response.statusCode == 200) {
    print(resp);
    return resp;
  } else {
    print(resp);
    print(response.reasonPhrase);
    print(response.statusCode);
    return resp;
  }
}



Future<dynamic> passwordApi({
  required String password,
  required String confirmPassword,
}) async {
  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMmMyNGFkMTEyNzllZGViMjVlODg2NjBiYWZmYzI1ZDMwOTBjNjcxNzBmMTkzYzgyYTgzM2M1MGU4YmE2ODZjZjFlNDNhNDk2MWI1OTliNzgiLCJpYXQiOjE3MDM0MTQzMjAuMzk0NTQyLCJuYmYiOjE3MDM0MTQzMjAuMzk0NTQ0LCJleHAiOjE3MTkyMjU1MjAuMzkzNzUyLCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.B60bt6VZGZ8wmC8hYczWZTKpUFUgUFVQM6KBL9wrK9JK_-cZ_LsoJp2C1okV6OUmLlsNU7cf2nqt6ilEjj0BIAsYZRzSDOqxH5xJBuDdNnsl8y0Dqr4Yg5E4EUqxp9CIFrSOxO2tGGnj6X8wq_P7WvPGD7HcqqT-2Y8uWomtCgr3hHZO80Bmt5-ubb08uxs6uCpOyqAMorcRKjvUDd14-JkhYTVQwDHYpZwClpisnrBf0h5PgJ92UjMU3DEsh6na6_J0yX8BeHBTBvksMWuEVTOnTerzMuXzac1-e02bcb_EFBp-nK2d25yTQxo_FVQBwkBwnXM4GZEMjyYm0c1i0HldZwFNJ0xm2vENnvs-XG5DBzuEzbBuoZBvTCLj1KgR5P0uO21YpX7dKSqwo_5acqJybX9peDKZeMWVjimNAfrhCg_mdHKzvVVgBejERtXC95Pqrod36Zk7csD7YWIhZuw5e8ACuyjEsPm04VWGwUNdbG95AmQTCqzxxaEYFT_lf3UaNK7QWIR_79aOaUp6o3QJDy-rn8pYGSx5X6gVvaNMB9nWsEVp8KpgkTtvXaYSHn0AsKRsnqvItyKrV78Up-sc2LvplsTWGThgizBeW1xycO9Hs3Rjd-qd3M4QJ44E8y_QeIahLbH3oI8SdcMIKN4CyqFjeTWrPSQjS9Gbb2o',
    'Cookie': 'spycotech_session=BuWZdWHc2TtmESxWIW01qWTO6ptbH3YCarj6l2ej'
  };
  var request = http.MultipartRequest('POST', Uri.parse('$baseUrl/password-add'));
  request.fields.addAll({
    'password': password,
    'password_confirmation': confirmPassword
  });
  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();
  var resp = jsonDecode(await response.stream.bytesToString());
  if (response.statusCode == 200) {
    print(resp);
    return resp;
  } else {
    print(resp);
    print(response.reasonPhrase);
    print(response.statusCode);
    return resp;
  }
}