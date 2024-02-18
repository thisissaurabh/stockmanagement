import 'package:flutter/material.dart';
import 'package:spyco_shop_management/constants/size_box.dart';
import 'package:spyco_shop_management/widgets/add_person_row_holder.dart';
import 'package:spyco_shop_management/widgets/snackbar.dart';

import '../constants/colors.dart';
import '../constants/responsive.dart';
import '../constants/text_styles.dart';
import 'package:spyco_shop_management/api/login_register/add_supplier_api.dart';

import '../src/utiils/textfields.dart';
import '../src/utiils/textstyles.dart';
import '../src/widgets/common_widgets.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/intraction_buttons.dart';
import '../widgets/main_button.dart';

class CreditBillrDialog extends StatefulWidget {
  final String title;
  final String content;

  CreditBillrDialog({required this.title, required this.content});

  @override
  State<CreditBillrDialog> createState() => _CreditBillrDialogState();
}

class _CreditBillrDialogState extends State<CreditBillrDialog> {
  final usernameController = TextEditingController();

  // int selectedOption = 1;

  // int selectedOption = 1;
  String? selectedOption;
  final GlobalKey<FormState>_formKey =  GlobalKey<FormState>();
  bool isLoading = false;
  final businessType = TextEditingController();
  final firstName = TextEditingController();
  final secondName = TextEditingController();
  final companyName = TextEditingController();
  final mail = TextEditingController();
  final mobileNo = TextEditingController();
  final workNo = TextEditingController();
  final gstNO = TextEditingController();
  final address = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final pinCodeController = TextEditingController();
  final List<String> stateList = [
    'Andhra Pradesh',
    'Arunachal Pradesh',
    'Assam',
    'Bihar',
    'Chhattisgarh',
    'Goa',
    'Gujarat',
    'Haryana',
    'Himachal Pradesh',
    'Jharkhand',
    'Karnataka',
    'Kerala',
    'Madhya Pradesh',
    'Maharashtra',
    'Manipur',
    'Meghalaya',
    'Mizoram',
    'Nagaland',
    'Odisha',
    'Punjab',
    'Rajasthan',
    'Sikkim',
    'Tamil Nadu',
    'Telangana',
    'Tripura',
    'Uttar Pradesh',
    'Uttarakhand',
    'West Bengal',
    'Andaman and\n Nicobar Islands',
    'Chandigarh',
    'Dadra and Nagar\n Haveli and Daman and Diu',
    'Lakshadweep',
    'Delhi',
    'Puducherry',
  ];

  String? invoiceModeValue;

  String? stateValue;
  final List<String> invoiceModeList = [
    '1',
    '2',
    'Comme2rcial',
    'Private',
  ];
  bool listView = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: Container(
        width: 600,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/images/762836_78 150p-01.jpg",
                    ),
                        fit: BoxFit.cover)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text("Credit Bill",
                    style: pageTitle,),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                padding: EdgeInsets.all(20),
                child:SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('*Add Customer No',
                            style: styleInterThin(
                                size: 10,
                                color: Colors.black),
                          ),
                          SizedBox(height: 3,),
                          DropdownButtonFormField(
                            value: invoiceModeValue,
                            decoration: DropDownFieldDecoration(hint: '').decoration(),
                            hint: Text(
                              'Add Customer no',
                              style:  const TextStyle(
                                fontSize: 10,
                                color: Colors.black,
                              ),
                            ),
                            isExpanded: true,
                            onChanged: (value) {
                              setState(() {
                                invoiceModeValue = value;
                                listView = !listView;
                              });
                            },
                            items: invoiceModeList
                                .map((String val) {
                              return DropdownMenuItem(
                                value: val,
                                child: Text(
                                  val,
                                ),
                              );
                            }).toList(),
                          ),
                          sizeHeight16(),
                          listView ?
                          Column(
                            children: [

                             Row(
                               children: [
                                 Expanded(
                                     child: InvoiceBoxField(
                                       title: 'S.no',
                                     )),
                                 Expanded(
                                     child: InvoiceBoxField(
                                       title: 'Item',
                                     )),
                                 Expanded(
                                     child: InvoiceBoxField(
                                       title: 'Credit Amount',
                                     )),
                               ],
                             ),
                              ListView.builder(
                                itemCount: 3,
                                shrinkWrap: true,
                                  itemBuilder: (_,i) {
                                return Container(
                                  child: Row(
                                    children: [
                                      Expanded(

                                          child: ItemRowBilling(
                                              title: '1', color: Colors.transparent)),
                                      Expanded(

                                          child: ItemRowBilling(
                                              title: 'Item', color: Colors.transparent)),
                                      Expanded(

                                          child: ItemRowBilling(
                                              title: 'Amount', color: Colors.transparent)),


                                    ],
                                  ),

                                );
                              }),
                            ],
                          ) :
                              SizedBox(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
