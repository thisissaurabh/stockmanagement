import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spyco_shop_management/constants/shared_prefs.dart';
import 'package:spyco_shop_management/constants/urls.dart';

Future<dynamic> addCustomerSupplierApi({
  required String supplierId,
  required String purchaseInvoiceNo,
  required String challanNo,
  required String invoiceDate,
  required String codingType,
  required String remarks,
  required String itemName,
  required String designName,
  required String hsnCode,
  required String quantity,
  required String unit,
  required String purchasePrice,
  required String sellMrp,
  required String totalAmount,
  required String discount,
  required String color,
  required String size,
  required String photo,
}) async {

  var prefs = await SharedPreferences.getInstance();
  var v = prefs.getString(Keys().token);


  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer $v'
  };
  var request = http.MultipartRequest(
      'POST', Uri.parse('$baseUrl/store-item'));
  request.fields.addAll({
    'suppliers_id': supplierId,
    'purchase_invoice_no': purchaseInvoiceNo,
    'challan_no': challanNo,
    'invoice_date': invoiceDate,
    'coding_type': codingType,
    'description': remarks,
    'name': itemName,
    'design_name': designName,
    'hsn_code': hsnCode,
    'quantity': quantity,
    'unit': unit,
    'purchase_price': purchasePrice,
    'sell_mrp': sellMrp,
    'total': totalAmount,
    'discount': discount,
    'color': color,
    'size': size});
  request.files.add(await http.MultipartFile.fromPath('item_image',photo));
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

