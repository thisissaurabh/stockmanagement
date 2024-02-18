

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ionicons/ionicons.dart';
import 'package:spyco_shop_management/pos/credit_bill_dialog.dart';
import 'package:spyco_shop_management/src/widgets/common_widgets.dart';

import '../constants/size_box.dart';
import '../constants/textfield_decoration.dart';
import '../src/utiils/colors.dart';
import '../src/utiils/strings.dart';
import '../src/utiils/textfields.dart';
import '../src/utiils/textstyles.dart';
import '../src/widgets/custom_app_bar.dart';
import '../src/widgets/custom_dropdown.dart';
import '../src/widgets/sizebox.dart';
import '../stock/add_stock_item.dart';
import '../widgets/custom_check_box.dart';
import '../widgets/global_widgets.dart';


class Invoice extends StatefulWidget {
  const Invoice({
    super.key,
  });

  @override
  State<Invoice> createState() => _InvoiceState();
}

class _InvoiceState extends State<Invoice> {

  final invoiceModeController = TextEditingController();
  final salesPersonController = TextEditingController();
  final salesPersonController2 = TextEditingController();
  final customerNameController = TextEditingController();
  final customerEmailController = TextEditingController();
  final customerContactNoController = TextEditingController();
  final customerDateController = TextEditingController();
  final invoiceTypeController = TextEditingController();
  final List<String> invoiceModeList = [
    '1',
    '2',
    'Comme2rcial',
    'Private',
  ];
  final List<String> salesPersonList = [
    '1',
    '2',
    'Comme2rcial',
    'Private',
  ];
  final List<String> salesPersonList2 = [
    '1',
    '2',
    'Comme2rcial',
    'Private',
  ];
  final List<String> invoiceTypeList = [
    'Barcode',
    'Manual',
  ];
  String? _selectedValue;
  List<String> listOfValue = ['1', '2', '3', '4', '5'];

  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
    'Item6',
    'Item7',
    'Item8',
  ];

  String? selectedValue;
  String? invoiceModeValue;
  String? salesPerson1Value;
  String? salesPerson2Value;

  final cash = TextEditingController();

  final List<String> paymentMethod = [
    'Cash',
    'Upi',
    'Bank',
  ];

  String? paymentVal;
  final paymentMode = TextEditingController();
  String? paymentVal2;
  final paymentMode2 = TextEditingController();

  bool add = false;

  bool _switchValue = false;
  bool shipping = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Billing', widget: [
        SizedBox(width: 15,),
        MouseHover(
          child: Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: Row(
              children: [
                Icon(Icons.assignment_return,color: Colors.black,),
                Text("Sale Return",style:  const TextStyle(
                  fontSize: 10,
                  color: Colors.black,
                ),),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 24.0),
          child: GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return CreditBillrDialog(
                    title: 'Dialog Title',
                    content: 'This is the content of the dialog.',
                  );
                },
              );
            },
            child: MouseHover(
              child: Row(
                children: [
                  Icon(Icons.library_books,color: Colors.black,),
                  Text("Credit bills",style:  const TextStyle(
                    fontSize: 10,
                    color: Colors.black,
                  ),),
                ],
              ),
            ),
          ),
        ),
        MouseHover(
          child: Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: Row(
              children: [
                Icon(Icons.front_hand,color: Colors.black,),
                Text("Hold bill",style:  const TextStyle(
                  fontSize: 10,
                  color: Colors.black,
                ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Row(
            children: [
              Text("Barcode",style:  const TextStyle(
                fontSize: 10,
                color: Colors.black,
              ),),

              CupertinoSwitch(
                value: _switchValue,
                onChanged: (value) {
                  setState(() {
                    _switchValue = value;
                  });
                },
              ),
              Text("Manual",style:  const TextStyle(
                fontSize: 10,
                color: Colors.black,
              ),),
            ],
          ),
        ),
      ],),
      bottomNavigationBar: buildBottomBar(context),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  color: colorGreyBackGround,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Invoice Information",
                        style: styleInterSemiBold(
                            size: 14,
                            color: Colors.black),
                      ),
                      sizeHeight16(),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('*Invoice Mode',
                                  style: styleInterThin(
                                      size: 10,
                                      color: Colors.black),
                                ),
                                SizedBox(height: 3,),
                                DropdownButtonFormField(
                                  value: invoiceModeValue,
                                  decoration: DropDownFieldDecoration(hint: '').decoration(),
                                  hint: Text(
                                    'choose one',
                                    style:  const TextStyle(
                                      fontSize: 10,
                                      color: Colors.black,
                                    ),
                                  ),
                                  isExpanded: true,
                                  onChanged: (value) {
                                    setState(() {
                                      invoiceModeValue = value;
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
                              ],
                            ),
                          ),
                          sizeWidthBox40(),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('*Sales person 1',
                                  style: styleInterThin(
                                      size: 10,
                                      color: Colors.black),
                                ),
                                SizedBox(height: 3,),
                                DropdownButtonFormField(
                                  value: salesPerson1Value,
                                  decoration: DropDownFieldDecoration(hint: '').decoration(),
                                  hint: Text(
                                    'choose one',
                                    style:  const TextStyle(
                                        fontSize: 10,
                                        color: Colors.black,
                                      ),
                                  ),
                                  isExpanded: true,
                                  onChanged: (value) {
                                    setState(() {
                                      salesPerson1Value = value;
                                    });
                                  },
                                  items: salesPersonList
                                      .map((String val) {
                                    return DropdownMenuItem(
                                      value: val,
                                      child: Text(
                                        val,
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                          ),
                          sizeWidthBox40(),
                          Expanded(
                            child:  textBox(
                              context: context,
                              label: 'Customer Name',
                              controller: customerNameController,
                              hint: 'Customer Name',
                              length: null,
                              validator: (val) {
                                return null;
                              }, title: '*Customer Name'),),
                          sizeWidthBox40(),
                          Expanded(
                            child:  textBox(
                              context: context,
                              label: 'Contact No',
                              controller: customerContactNoController,
                              hint: 'Contact No',
                              length: null,
                              validator: (val) {
                                return null;
                              }, title: '*Contact No'),),
                          sizeWidthBox40(),
                          Expanded(
                            child:  textBox(
                                context: context,
                                label: 'Item Name',
                                controller: customerContactNoController,
                                hint: 'Item Name',
                                length: null,
                                validator: (val) {
                                  return null;
                                }, title: '*Item Name'),),
                        ],
                      ),
                      sizeHeight8(),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('*Billing Type',
                                  style: styleInterThin(
                                      size: 10,
                                      color: Colors.black),
                                ),
                                SizedBox(height: 3,),
                                DropdownButtonFormField(
                                  value: invoiceModeValue,
                                  decoration: DropDownFieldDecoration(hint: '').decoration(),
                                  hint: Text(
                                    'choose one',
                                     style:  const TextStyle(
                                    fontSize: 10,
                                    color: Colors.black,
                                  ),
                                  ),
                                  isExpanded: true,
                                  onChanged: (value) {
                                    setState(() {
                                      invoiceModeValue = value;
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
                              ],
                            ),
                          ),
                          sizeWidthBox40(),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('*Sales Person 2',
                                  style: styleInterThin(
                                      size: 10,
                                      color: Colors.black),
                                ),
                                SizedBox(height: 3,),
                                DropdownButtonFormField(
                                  value: salesPerson2Value,
                                  decoration: DropDownFieldDecoration(hint: '').decoration(),
                                  hint: Text(
                                    'choose one',
                                    style:  const TextStyle(
                                      fontSize: 10,
                                      color: Colors.black,
                                    ),
                                  ),
                                  isExpanded: true,
                                  onChanged: (value) {
                                    setState(() {
                                      salesPerson2Value = value;
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
                              ],
                            ),
                          ),
                          sizeWidthBox40(),
                          Expanded(
                            child:  textBox(
                                context: context,
                                label: 'Customer Email',
                                controller: customerEmailController,
                                hint: 'Customer Email',
                                length: null,
                                validator: (val) {
                                  return null;
                                }, title: '*Customer Email'),),
                          sizeWidthBox40(),
                          Expanded(
                            child:  textBox(
                                context: context,
                                label: 'Customer Email',
                                controller: customerEmailController,
                                hint: 'Customer Email',
                                length: null,
                                validator: (val) {
                                  return null;
                                }, title: '*Customer Email'),),
                          sizeWidthBox40(),
                          Expanded(
                            child:  textBox(
                                context: context,
                                label: 'Date',
                                controller: customerContactNoController,
                                hint: 'Date',
                                length: null,
                                validator: (val) {
                                  return null;
                                }, title: '*Date'),),
                        ],
                      ),
                    ],
                  ),
                ),
                sizeHeight16(),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: InvoiceBoxField(
                            title: '#',
                          )),
                      Expanded(
                          flex: 4,
                          child: InvoiceBoxField(
                            title: 'Item',
                          )),
                      Expanded(
                          child: InvoiceBoxField(
                            title: 'Quantity',
                          )),
                      Expanded(
                          child: InvoiceBoxField(
                            title: 'Unit',
                          )),
                      Expanded(
                          child: InvoiceBoxField(
                            title: 'Unit Price',
                          )),
                      Expanded(
                          flex: 2,
                          child: InvoiceBoxField(
                            title: 'Discount',
                          )),
                      Expanded(
                          flex: 2,
                          child: InvoiceBoxField(
                            title: 'Tax',
                          )),
                      Expanded(
                          child: InvoiceBoxField(
                            title: 'Total',
                          )),
                    ],
                  ),
                ),
                Container(
                  color: Colors.grey.withOpacity(0.10),
                  child: Row(
                    children: [
                      Expanded(
                          child: ItemRowBilling(
                            title: '1',
                            color: Colors.transparent,
                          )),
                      Expanded(
                          flex: 4,
                          child: ItemRowBilling(
                              title: 'Item',
                              color: Colors.transparent)),
                      Expanded(
                          child: ItemRowBilling(
                              title: 'Quntity', color: Colors.transparent)),
                      Expanded(
                          child: ItemRowBilling(
                              title: 'Unit', color: Colors.transparent)),
                      Expanded(
                          child: ItemRowBilling(
                              title: 'Unit Price', color: Colors.transparent)),
                      Expanded(
                          flex: 2,
                          child: ItemRowBilling(
                              title: 'Disocunt', color: Colors.transparent)),
                      Expanded(
                          flex: 2,
                          child: ItemRowBilling(
                              title: 'Tax', color: Colors.transparent)),
                      Expanded(
                          child: ItemRowBilling(
                              title: 'Total', color: Colors.transparent)),
                    ],
                  ),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }

  SingleChildScrollView buildBottomBar(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: colorGreyBackGround,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      CustomRowWidget(
                        title: 'Add Discount',
                        initialCheckedValue: false,
                        onChange: (bool isChecked) {
                          // Handle the onChange logic here
                        },
                        child: Expanded(
                          child: DropdownButtonFormField(
                            value: _selectedValue,
                            decoration: DropDownFieldDecoration(hint: '').decoration(),
                            hint: Text(
                              'choose one',
                              style:  const TextStyle(
                                fontSize: 10,
                                color: Colors.black,
                              ),
                            ),
                            isExpanded: true,
                            onChanged: (value) {
                              setState(() {
                                _selectedValue = value;
                              });
                            },
                            items: listOfValue
                                .map((String val) {
                              return DropdownMenuItem(
                                value: val,
                                child: Text(
                                  val,
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      CustomRowWidget(
                        title: 'Add Shipping',
                        initialCheckedValue: true,
                        onChange: (bool isChecked) {
                          // Handle the onChange logic here
                        },
                      ),

                    ],
                  ),
                ),
                sizeWidthBox40(),
                Expanded(
                  child: Column(
                    crossAxisAlignment : CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Remarks",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.w900),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        width: MediaQuery.sizeOf(context).width * 0.30,
                        color: Colors.white,
                        child: TextFormField(
                          maxLines: 2,
                          cursorColor: Colors.black,
                          decoration: CustomDataField(
                            label: '',
                          ).dataFieldDecoration(),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        "Add Document",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.w900),
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                  width: 0.2,
                                  color: Colors.black
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    "assets/icon/document-add-svgrepo-com.svg",
                                    color: Colors.grey,
                                    height: 24,
                                    width: 24,),
                                  SizedBox(width: 5,),
                                  Text("Add Document"),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),],),
                ),
                sizeWidthBox40(),
                Expanded(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Payments",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          add = !add;

                                        });
                                      },
                                      child: MouseHover(
                                        child: Text(
                                          add ?
                                          "Close Payment Mode":
                                          "Add Another Mode +",
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 11,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(

                                  "Payment Mode",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: AddItemField(
                                        control: cash,
                                        label: 'Amount',
                                      ),
                                    ),
                                    SizedBox(width: 14,),
                                    Expanded(
                                      child:SizedBox(
                                        height: 30,
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton2<String>(
                                            isExpanded: true,
                                            hint: const Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    'Mode',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.black,
                                                    ),
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            items: paymentMethod
                                                .map((String item) => DropdownMenuItem<String>(
                                              value: item,
                                              child: Text(
                                                item,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  // fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ))
                                                .toList(),
                                            value: paymentVal,
                                            onChanged: (String? value) {
                                              setState(() {
                                                paymentVal = value;
                                                paymentMode.text = value!;
                                              });
                                            },
                                            buttonStyleData: ButtonStyleData(
                                              // height: 50,
                                              width: 100,
                                              // width: 160,
                                              padding: const EdgeInsets.only(left: 14, right: 14),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.black.withOpacity(0.50),
                                                  width: 0.5,
                                                ),
                                                // color: Colors.white,
                                              ),
                                              elevation: 0,
                                            ),
                                            iconStyleData: const IconStyleData(
                                              icon: Icon(
                                                Icons.arrow_forward_ios_outlined,
                                              ),
                                              iconSize: 14,
                                              iconEnabledColor: Colors.black,
                                              iconDisabledColor: Colors.black,
                                            ),
                                            dropdownStyleData: DropdownStyleData(
                                              // maxHeight: 200,
                                              width: 276,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(14),
                                                color: Colors.white,
                                              ),
                                              offset: const Offset(0, 0),
                                              scrollbarTheme: ScrollbarThemeData(
                                                radius: const Radius.circular(6),
                                                thickness: MaterialStateProperty.all<double>(6),
                                                thumbVisibility: MaterialStateProperty.all<bool>(true),
                                              ),
                                            ),
                                            menuItemStyleData: const MenuItemStyleData(
                                              height: 40,
                                              padding: EdgeInsets.only(left: 14, right: 14),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                add ?
                                Row(
                                  children: [
                                    Expanded(
                                      child: AddItemField(
                                        control: cash,
                                        label: 'Amount',
                                      ),
                                    ),
                                    SizedBox(width: 14,),
                                    Expanded(
                                      child:SizedBox(
                                        height: 30,
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton2<String>(
                                            isExpanded: true,
                                            hint: const Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    'Mode',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.black,
                                                    ),
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            items: paymentMethod
                                                .map((String item) => DropdownMenuItem<String>(
                                              value: item,
                                              child: Text(
                                                item,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  // fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ))
                                                .toList(),
                                            value: paymentVal2,
                                            onChanged: (String? value) {
                                              setState(() {
                                                paymentVal2 = value;
                                                paymentMode2.text = value!;
                                              });
                                            },
                                            buttonStyleData: ButtonStyleData(
                                              // height: 50,
                                              width: 100,
                                              // width: 160,
                                              padding: const EdgeInsets.only(left: 14, right: 14),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.black.withOpacity(0.50),
                                                  width: 0.5,
                                                ),
                                                // color: Colors.white,
                                              ),
                                              elevation: 0,
                                            ),
                                            iconStyleData: const IconStyleData(
                                              icon: Icon(
                                                Icons.arrow_forward_ios_outlined,
                                              ),
                                              iconSize: 14,
                                              iconEnabledColor: Colors.black,
                                              iconDisabledColor: Colors.black,
                                            ),
                                            dropdownStyleData: DropdownStyleData(
                                              // maxHeight: 200,
                                              width: 276,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(14),
                                                color: Colors.white,
                                              ),
                                              offset: const Offset(0, 0),
                                              scrollbarTheme: ScrollbarThemeData(
                                                radius: const Radius.circular(6),
                                                thickness: MaterialStateProperty.all<double>(6),
                                                thumbVisibility: MaterialStateProperty.all<bool>(true),
                                              ),
                                            ),
                                            menuItemStyleData: const MenuItemStyleData(
                                              height: 40,
                                              padding: EdgeInsets.only(left: 14, right: 14),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),

                                  ],
                                ) :
                                SizedBox(),
                                SizedBox(
                                  height: 12,
                                ),
                                AddItemField(
                                  control: cash,
                                  label: 'Total',
                                ),


                                SizedBox(
                                  height: 8,
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                sizeWidthBox40(),
                Expanded(
                  child: outlineContainer(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("Sub Total : 904.6",
                        style: styleInterBold(
                          size: 20,
                          color: Colors.black
                        ),),
                        Text("Add CGST : 55.5",
                        style: styleInterBold(
                            size: 16,
                            color: Colors.black
                        ),),
                        Text("Add SGST : 55.5",
                        style: styleInterBold(
                            size: 16,
                            color: Colors.black
                        ),),
                        Text("Add IGST : 00.0",
                        style: styleInterBold(
                            size: 16,
                            color: Colors.black
                        ),),
                        Text("Discount : 00.0",
                          style: styleInterBold(
                              size: 16,
                              color: Colors.black
                          ),),
                        CustomHorizontalLine(),
                        Text("Total : 2904.6",
                          style: styleInterBold(
                              size: 20,
                              color: Colors.black
                          ),),
                      ],
                    ),
                  ),
                ),
              ],
            ),





          ],
        ) ,
      ),
    );
  }

  Padding buildRow(
      BuildContext context,
      String title,
      bool isChecked,
      Function(bool) onChange) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      width: 300,
                      child: Row(
                        children: [
                          Expanded(
                            child: CustomCheckButton(
                              title: title,
                              isChecked: false,
                              activeColor: colorSelectedGreen,
                              onChanged: (bool isChecked) {
                                setState(() {
                                  shipping = !shipping;
                                  onChange(isChecked); // Call the onChange function
                                });
                              },
                            ),
                          ),
                          shipping ?
                          Expanded(
                            child: SizedBox(
                              height: 24,
                              child: Row(
                                children: [
                                  Container(
                                    width:40,
                                    color: colorSelectedGreen,
                                    child: Image.asset(ic_rupee,
                                    color: Colors.white,),
                                  ),
                                  SizedBox(
                                    width: 100,
                                    child: whiteTextBox(
                                      context: context,
                                      label: 'Amount',
                                      controller: customerNameController,
                                      hint: 'Amount',
                                      length: null,
                                      validator: (val) {
                                        return null;
                                      },
                                    ),
                                  )
                                ],
                              ),
                            )
                          ) :
                              SizedBox()
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                      child: Container(color: Colors.red,))

                ],
              ),
    );
  }
}




class CustomRowWidget extends StatefulWidget {
  final String title;
  final bool initialCheckedValue;
  final Function(bool) onChange;
  final Widget? child;


  CustomRowWidget({
    required this.title,
    required this.initialCheckedValue,
    required this.onChange,
    this.child,
  });

  @override
  _CustomRowWidgetState createState() => _CustomRowWidgetState();
}

class _CustomRowWidgetState extends State<CustomRowWidget> {
  bool isChecked = false;
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    isChecked = widget.initialCheckedValue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              // width: 300,
              child: Row(
                children: [
                  Expanded(
                    child: CustomCheckButton(
                      title: widget.title,
                      isChecked: isChecked,
                      activeColor: colorSelectedGreen,
                      onChanged: (bool isChecked) {
                        setState(() {
                          this.isChecked = isChecked;
                          widget.onChange(isChecked);
                        });
                      },
                    ),
                  ),

                  isChecked
                      ?
                  widget.child ??
                  Expanded(
                    child: SizedBox(
                      height: 24,
                      child: Row(
                        children: [
                          Container(
                            width: 40,
                            color: colorSelectedGreen,
                            child: Image.asset(ic_rupee, color: Colors.white),
                          ),
                          SizedBox(
                            width: 100,
                            child: whiteTextBox(
                              context: context,
                              label: 'Amount',
                              controller: controller,
                              hint: 'Amount',
                              length: null,
                              validator: (val) {
                                return null;
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                      : SizedBox(),


                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}



class DropdownFormField<T> extends StatefulWidget {
  final String hintText;
  final List<T> options;
  final T value;
  final void Function(T) onChanged;
  final void Function(T)? onSaved; // Use T? to handle nullable types

  DropdownFormField({
    required this.hintText,
    required this.options,
    required this.value,
    required this.onChanged,
    this.onSaved,
  });

  @override
  _DropdownFormFieldState<T> createState() => _DropdownFormFieldState<T>();
}

class _DropdownFormFieldState<T> extends State<DropdownFormField<T>> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: widget.value,
      hint: Text(widget.hintText),
      isExpanded: true,
      onChanged: (T? value) {
        if (value != null) {
          setState(() {
            widget.onChanged(value);
          });
        }
      },
      onSaved: widget.onSaved != null
          ? (T? value) {
        if (value != null) {
          setState(() {
            widget.onSaved!(value);
          });
        }
      }
          : null,
      items: widget.options.map((T val) {
        return DropdownMenuItem<T>(
          value: val,
          child: Text(val.toString()), // Convert value to string if needed
        );
      }).toList(),
    );
  }
}
