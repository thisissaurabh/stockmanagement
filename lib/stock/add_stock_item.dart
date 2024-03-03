
import 'dart:io';
import 'dart:math';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:spyco_shop_management/constants/colors.dart';
import 'package:spyco_shop_management/constants/responsive.dart';
import 'package:spyco_shop_management/constants/text_styles.dart';
import 'package:spyco_shop_management/constants/textfield_decoration.dart';
import 'package:spyco_shop_management/constants/textstyle.dart';
import 'package:spyco_shop_management/controllers/MenuAppController.dart';
import 'package:spyco_shop_management/screens/dashboard/components/header.dart';
import 'package:spyco_shop_management/screens/main/components/side_menu.dart';
import 'package:spyco_shop_management/widgets/cards.dart';
import 'package:spyco_shop_management/widgets/global_widgets.dart';
import 'package:spyco_shop_management/widgets/globals.dart';
import '../api/login_register/add_item_api.dart';
import '../api/stock_apis/group_apis.dart';
import '../api_models/group_model.dart';
import '../pos/invoice.dart';
import '../widgets/add_person_row_holder.dart';
import '../widgets/custom_dialog.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/main_button.dart';
import '../widgets/snackbar.dart';
import 'add_group.dart';
import 'add_stock_dialog.dart';
import 'components/items_model.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
class AddStockItems extends StatefulWidget {
  final String date;
  final String supplierId;
  final String purchaseInvoiceNo;
  final String challanNo;
  final String supplierName;
  final String supplierBusinessName;
  final String gstNo;


  const AddStockItems({super.key, required this.date,
    required this.supplierId,
    required this.purchaseInvoiceNo,
    required this.challanNo,
    required this.supplierName,
    required this.supplierBusinessName,
    required this.gstNo});

  @override
  State<AddStockItems> createState() => _AddStockItemsState();
}

class _AddStockItemsState extends State<AddStockItems> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,

      // drawer: SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            // if (Responsive.isDesktop(context))
            //   Expanded(
            //     // default flex = 1
            //     // and it takes 1/6 part of the screen
            //     child: SideMenu(),
            //   ),
            Expanded(
              // It takes 5/6 part of the screen
              // flex: 5,
              child: AddStockItemWindow(
                supplierId: widget.supplierId,
                purchaseInvoiceNo: widget.purchaseInvoiceNo,
                challanNo: widget.challanNo,
                supplierName: widget.supplierName,
                supplierBusinessName: widget.supplierBusinessName,
                gstNo: widget.gstNo,),
            ),
          ],
        ),
      ),
    );
  }
}




class AddStockItemWindow extends StatefulWidget {
  final String supplierId;
  final String purchaseInvoiceNo;
  final String challanNo;
  final String supplierName;
  final String supplierBusinessName;
  final String gstNo;


  const AddStockItemWindow({
    super.key,
    required this.supplierId,
    required this.purchaseInvoiceNo,
    required this.challanNo,
    required this.supplierName,
    required this.supplierBusinessName,
    required this.gstNo});

  @override
  State<AddStockItemWindow> createState() => _AddStockItemWindowState();
}

class _AddStockItemWindowState extends State<AddStockItemWindow> {
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

  ///---------------------------------------------------------------------------
  final groupController = TextEditingController();
  final brandController = TextEditingController();
  TextEditingController sno = TextEditingController();
  TextEditingController itemCode = TextEditingController();
  TextEditingController itemName = TextEditingController();
  final designName = TextEditingController();
  final color = TextEditingController();
  final size = TextEditingController();
  final hsnCode = TextEditingController();
  final unit = TextEditingController();
  final quantity = TextEditingController();
  final purchasePrice = TextEditingController();
  final gstController = TextEditingController();
  final discount = TextEditingController();
  final taxPercent = TextEditingController();
  final setMrp = TextEditingController();
  final totalAmount = TextEditingController();
  final barcodeType = TextEditingController();
  final remarksController = TextEditingController();
  final groupIdController = TextEditingController();
  double quantityP = 0;
  double purchasePriceP = 0;
  double discountP = 0;
  double gstP = 0;

  void calculateTotalAmount() {
    double discountAmount = (quantityP * purchasePriceP) * (discountP / 100);
    double total = (quantityP * purchasePriceP) - discountAmount;

    if (gstVal != null) {
      double gstPercent = double.parse(gstVal!);
      double gstAmount = (total * gstPercent) / 100;
      total += gstAmount;
    }
    setState(() {
      totalAmount.text = total.toStringAsFixed(2); // Assuming total amount is a double value
    });
  }


  List<Contact> contacts = List.empty(growable: true);

  int selectedIndex = -1;

  final List<String> units = [
    'pcs',
    'box',
    'metre',
    'Kg'
  ];
  final List<String> barcodeTypeList = [
    'Fixed',
    'lot',
  ];
  String? barcodeVal;

  String? unitVal;

  final List<String> gst = [
    '3',
    '5',
    '12',
    '18',
  ];

  String? gstVal;

  DateTime selectedDate = DateTime.now();

  File pickedImage = File("");
  final ImagePicker _imgPicker = ImagePicker();


  final GlobalKey<FormState>_formKey =  GlobalKey<FormState>();
  final GlobalKey<FormState> formKey =  GlobalKey<FormState>();

  String dateFormat = '';


  @override
  void initState() {
    // TODO: implement initState
    getGroup();
    super.initState();
    selectedDate = DateTime.now();

    dateFormat = DateFormat(
        'dd-MM-yyyy'
    )
        .format(
        selectedDate);
  }




  bool isLoading =  false;
  List<GroupModel> group = [];
  getGroup() {
    isLoading = true;
    var resp = getGroupApi();
    resp.then((value) {
      if (value['status'] == 1) {
        for(var v in value['data']) {
          group.add(GroupModel.fromJson(v));
        }
        print(group.length);
        setState(() {
          isLoading = false;
        });
      } else {
        isLoading = false;
      }
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      bottomNavigationBar: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 22),
          color: Colors.white,
          child: Column(
            children: [
              Row(
                children: [
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

                            // validator: (v) {
                            //   if (v!.isEmpty || !v.contains('@')) {
                            //     return 'Please enter a valid email!';
                            //   }
                            //   return null;
                            // },
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
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment : CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Payments",
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

                            // validator: (v) {
                            //   if (v!.isEmpty || !v.contains('@')) {
                            //     return 'Please enter a valid email!';
                            //   }
                            //   return null;
                            // },

                            cursorColor: Colors.black,
                            decoration: CustomDataField(
                              label: '',
                            ).dataFieldDecoration(),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          "Payments",
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
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 200,
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
                                          // control: cash,
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
                                          // control: cash,
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
                                    // control: cash,
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
                  SizedBox(width: 10,),
                  Expanded(
                    child: Container(
                      height: 200,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                color: Colors.grey.withOpacity(0.10),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "Total Amount",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w900),
                                      ),
                                      Text(
                                        "200000",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 36,
                                            fontWeight: FontWeight.w900),
                                      ),
                                      Spacer(),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [

                                          MainButton(
                                            title: 'Exit',
                                            press: () {
                                              // Navigator.push(
                                              //   context,
                                              //   MaterialPageRoute(builder: (context) =>  InvoiceWidget()),
                                              // );
                                            },
                                            sizeHorizontal: 50,
                                            sizeVerticle: 10,
                                            radius: 8,
                                            color: selectedGreenColor,
                                            titleColor: Colors.white,
                                          ),
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
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      ///-----------------------------------------------------------------------
      ///
      ///
      ///
      ///
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/chevron-back-svgrepo-com.svg",
                        color: Colors.black,
                        height: 32,
                        width: 32,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Add Stock",
                        style: pageTitle,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          AddItemField(
                            label: widget.supplierName,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          AddItemField(
                            label: widget.supplierBusinessName,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          AddItemField(
                            label: widget.gstNo,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          AddItemField(
                            label: widget.challanNo,
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      width: 30,
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              width: 300,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Puchase Invoice No",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ),
                                  Expanded(
                                    child: AddItemField(
                                      label: widget.purchaseInvoiceNo,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 300,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Date",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ),

                                  Expanded(
                                    child: AddItemField(
                                      tap: () async {
                                        final DateTime? picked = await showDatePicker(
                                          context: context,
                                          initialDate: selectedDate,
                                          firstDate: DateTime(2000), // Set your desired starting date
                                          lastDate: DateTime(2101),  // Set your desired ending date
                                        );
                                        if (picked != null && picked != selectedDate) {
                                          setState(() {
                                            selectedDate = picked;

                                            dateFormat = DateFormat(
                                                'dd-MM-yyyy'
                                            )
                                                .format(
                                                selectedDate);

                                          });
                                        }
                                        String formattedDate = DateFormat('dd/MM/yyyy').format(selectedDate!);
                                      },
                                      read: true,
                                      label: selectedDate.toString(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                MouseHover(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return buildAddStockDialog(context);
                            },
                          );
                        },
                        child : Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(2),

                          ),

                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0,
                                horizontal: 20),
                            child: Text("+ dnj",style: TextStyle(color: Colors.white),),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 16,),
                Row(
                  children: [
                    Expanded(
                        child: AddItemHeaderBox(title: '',)
                    ),
                    Expanded(
                        child: AddItemHeaderBox(title: 'Product Image',)
                    ),
                    Expanded(
                        child: AddItemHeaderBox(title: 'Item Name',)
                    ),
                    Expanded(
                        child: AddItemHeaderBox(title: 'Design Name',)
                    ),
                    Expanded(
                        child: AddItemHeaderBox(title: 'Color',)
                    ),
                    Expanded(
                        child: AddItemHeaderBox(title: 'Size',)
                    ),
                    Expanded(
                        child: AddItemHeaderBox(title: 'Hsn Code',)
                    ),
                    Expanded(
                        child: AddItemHeaderBox(title: 'Quantity',)
                    ),
                    Expanded(
                        child: AddItemHeaderBox(title: 'Unit',)
                    ),
                    Expanded(
                        child: AddItemHeaderBox(title: 'Barcode Type',)
                    ),
                    Expanded(
                        child: AddItemHeaderBox(title: 'Purchase Price',)
                    ),
                    Expanded(
                        child: AddItemHeaderBox(title: 'Discount %',)
                    ),
                    Expanded(
                        child: AddItemHeaderBox(title: 'Tax %',)
                    ),
                    Expanded(
                        child: AddItemHeaderBox(title: 'Set Mrp',)
                    ),
                    Expanded(
                        child: AddItemHeaderBox(title: 'Total',)
                    ),
                    SizedBox(width: 5,),
                    MouseHover(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(2),

                            ),

                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4.0,
                              horizontal: 20),
                              child: Text("+ Add",style: TextStyle(color: Colors.white),),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: AddItemField(control: sno, label: '',),
                        ),
                        ///------------------------------------------------
                        ///
                        ///
                        Expanded(
                          child: AddItemField(
                            read: true,
                              tap: () {
                              setState(() async {
                                XFile? v = await _imgPicker.pickImage(
                                    maxWidth: 90,
                                    maxHeight: 90,
                                    source: ImageSource.gallery);
                                if (v != null) {
                                  setState(
                                        () {
                                      pickedImage = File(v.path);
                                    },
                                  );
                                }
                              });
                              },
                              control: itemCode,
                              label: pickedImage == null
                              ?
                              'Product Image' :
                              pickedImage.toString(),
                              textAction :TextInputAction.next),
                        ),
                        Expanded(
                          child: AddItemField(control: itemName, label: 'Item Name',),
                        ),
                        Expanded(
                          child: AddItemField(control: designName, label: 'Design Name',),
                        ),
                        Expanded(
                          child: AddItemField(control: color, label: 'Color',),
                        ),
                        Expanded(
                          child: AddItemField(control: size, label: 'Size',),
                        ),
                        Expanded(
                          child: AddItemField(control: hsnCode, label: 'Hsn Code',),
                        ),
                        Expanded(
                          child:  SizedBox(
                            height: 30,
                            child: TextField(
                              cursorHeight: 22,
                              controller: quantity,
                              onChanged: (value) {
                                quantityP = double.tryParse(value) ?? 0;
                                calculateTotalAmount();
                              },
                              onSubmitted: (val) {
                                FocusScope.of(context).requestFocus(FocusNode());
                                FocusScope.of(context).nextFocus();
                              },
                              decoration: ItemDataField(
                                label: "quantity",
                              ).itemFieldDecoration(),
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 30,
                            child : DropdownButtonFormField<String>(
                              value: unitVal,
                              items: units.map<DropdownMenuItem<String>>((unit) {
                                return DropdownMenuItem<String>(
                                  value: unit,
                                  child: Text(unit),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                if (value != null) {
                                  setState(() {
                                    unitVal = value;
                                    unit.text = value;
                                  });

                                  // Add your logic here if needed
                                }
                              },
                              decoration: ItemDataField(
                                label: unitVal?.isEmpty ?? true ? "Select Unit" : unitVal!,
                              ).itemFieldDecoration(),
                            ),

                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 30,
                            child : DropdownButtonFormField<String>(
                              value: barcodeVal,
                              items: barcodeTypeList.map<DropdownMenuItem<String>>((unit) {
                                return DropdownMenuItem<String>(
                                  value: unit,
                                  child: Text(unit),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                if (value != null) {
                                  setState(() {
                                    barcodeVal = value;
                                    barcodeType.text = value;
                                  });

                                  // Add your logic here if needed
                                }
                              },
                              decoration: ItemDataField(
                                label: barcodeVal?.isEmpty ?? true ? "Barcode Type" : barcodeVal!,
                              ).itemFieldDecoration(),
                            ),

                          ),
                        ),
                        Expanded(
                          child:  SizedBox(
                            height: 30,
                            child: TextField(
                              cursorHeight: 22,
                              controller: purchasePrice,
                              textInputAction: TextInputAction.next,
                              onChanged: (value) {
                                purchasePriceP = double.tryParse(value) ?? 0;
                                calculateTotalAmount();

                              },
                              onSubmitted: (val) {
                                FocusScope.of(context).requestFocus(FocusNode());
                                FocusScope.of(context).nextFocus();
                              },
                              decoration: ItemDataField(
                                label: "purchase Price",
                              ).itemFieldDecoration(),
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 30,
                            child: TextField(
                              cursorHeight: 22,
                              controller: discount,
                              onChanged: (value) {
                                discountP = double.tryParse(value) ?? 0;
                                calculateTotalAmount();
                              },
                              onSubmitted: (val) {
                                FocusScope.of(context).requestFocus(FocusNode());
                                FocusScope.of(context).nextFocus();
                              },
                              decoration: ItemDataField(
                                label: "Discount",
                              ).itemFieldDecoration(),
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 30,
                            child : DropdownButtonFormField<String>(
                              value: gstVal,
                              items: gst.map<DropdownMenuItem<String>>((unit) {
                                return DropdownMenuItem<String>(
                                  value: unit,
                                  child: Text(unit),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                if (value != null) {
                                  setState(() {
                                    gstVal = value;
                                    gstController.text = value;
                                  });

                                  // Add your logic here if needed
                                }
                              },
                              decoration: ItemDataField(
                                label: gstVal?.isEmpty ?? true ? "Select Unit" : gstVal!,
                              ).itemFieldDecoration(),
                            ),

                          ),
                        ),

                        Expanded(
                          child: AddItemField(control: setMrp, label: 'Set Mrp',),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 30,
                            child: TextField(
                              cursorHeight: 22,
                              controller: totalAmount,
                              onChanged: (val) {

                              },
                              onSubmitted: (val) {
                                FocusScope.of(context).requestFocus(FocusNode());
                                FocusScope.of(context).nextFocus();
                              },
                              decoration: ItemDataField(
                                label: "Total amount",
                              ).itemFieldDecoration(),
                            ),
                          ),
                        ),
                        SizedBox(width: 5,),
                        GestureDetector(
                          onTap: () {
                            /*String imageN = pickedImage.toString().trim();
                            String itemN = itemName.text.trim();
                            String designN = designName.text.trim();
                            String colorN = color.text.trim();
                            String sizeN = size.text.trim();
                            String hsnN = hsnCode.text.trim();
                            String unitN = unit.text.trim();
                            String barcodeN = barcodeType.text.trim();
                            String quantityN = quantity.text.trim();
                            String purchaseN = purchasePrice.text.trim();
                            String gstN = gstController.text.trim();
                            String discountN = discount.text.trim();
                            // String taxPerN = gstController.text.trim();
                            String setN = setMrp.text.trim();
                            String totalN = totalAmount.text.trim();
                            if (
                            // itemC.isNotEmpty &&
                            imageN.isNotEmpty &&
                                itemN.isNotEmpty &&
                                designN.isNotEmpty &&
                                colorN.isNotEmpty &&
                                sizeN.isNotEmpty &&
                                hsnN.isNotEmpty &&
                                unitN.isNotEmpty &&
                                barcodeN.isNotEmpty &&
                                quantityN.isNotEmpty &&
                                purchaseN.isNotEmpty &&
                                discountN.isNotEmpty &&
                                setN.isNotEmpty &&
                                gstN.isNotEmpty &&
                                totalN.isNotEmpty
                            // taxPerN.isNotEmpty

                            ) {
                              setState(() {
                                // itemCode.text = '';
                                // itemName.text = '';
                                // designName.text = '';
                                // color.text = '';
                                // size.text = '';
                                // hsnCode.text = '';
                                // unit.text = '';
                                // barcodeType.text = '';
                                // quantity.text = '';
                                // purchasePrice.text = '';
                                // discount.text = '';
                                // gstController.text = '';
                                // setMrp.text = '';
                                // totalAmount.text = '';
                                contacts.add(
                                    Contact(
                                      // itemCode: itemC,
                                      image: imageN,
                                      itemName: itemN,
                                      designName: designN,
                                      color: colorN,
                                      size: sizeN,
                                      hsnCode: hsnN,
                                      unit: unitN,
                                      barcode: barcodeN,
                                      quantity: quantityN,
                                      purchasePrice: purchaseN,
                                      discount: discountN,
                                      mrp: setN,
                                      total: totalN,
                                      // taxPercent: taxPerN,
                                      gst: gstN,

                                    ));
                              });
                            }*/

                            setState(() {
                              if (_formKey.currentState!.validate()) {
                                addCustomerSupplierApi(
                                  supplierId: widget.supplierId,
                                  purchaseInvoiceNo: widget.purchaseInvoiceNo,
                                  challanNo: widget.purchaseInvoiceNo,
                                  invoiceDate:  dateFormat,
                                  codingType: barcodeType.text,
                                  remarks:remarksController.text,
                                  itemName: itemName.text,
                                  designName: designName.text,
                                  hsnCode: hsnCode.text,
                                  quantity: quantity.text,
                                  unit: unit.text,
                                  purchasePrice: purchasePrice.text,
                                  sellMrp: setMrp.text,
                                  totalAmount: totalAmount.text,
                                  discount: discount.text,
                                  color: color.text,
                                  size: size.text,
                                  photo: pickedImage.isAbsolute
                                      ? pickedImage.path
                                      : '',)
                                    .then((value) async {
                                  // isLoading = false;
                                  if (value['status'] == 1) {
                                    String imageN = pickedImage.toString().trim();
                                    String itemN = itemName.text.trim();
                                    String designN = designName.text.trim();
                                    String colorN = color.text.trim();
                                    String sizeN = size.text.trim();
                                    String hsnN = hsnCode.text.trim();
                                    String unitN = unit.text.trim();
                                    String barcodeN = barcodeType.text.trim();
                                    String quantityN = quantity.text.trim();
                                    String purchaseN = purchasePrice.text.trim();
                                    String gstN = gstController.text.trim();
                                    String discountN = discount.text.trim();
                                    // String taxPerN = gstController.text.trim();
                                    String setN = setMrp.text.trim();
                                    String totalN = totalAmount.text.trim();
                                    if (
                                    // itemC.isNotEmpty &&
                                    imageN.isNotEmpty &&
                                        itemN.isNotEmpty &&
                                        designN.isNotEmpty &&
                                        colorN.isNotEmpty &&
                                        sizeN.isNotEmpty &&
                                        hsnN.isNotEmpty &&
                                        unitN.isNotEmpty &&
                                        barcodeN.isNotEmpty &&
                                        quantityN.isNotEmpty &&
                                        purchaseN.isNotEmpty &&
                                        discountN.isNotEmpty &&
                                        setN.isNotEmpty &&
                                        gstN.isNotEmpty &&
                                        totalN.isNotEmpty
                                    // taxPerN.isNotEmpty

                                    ) {
                                      setState(() {
                                        contacts.add(
                                            Contact(
                                              // itemCode: itemC,
                                              image: imageN,
                                              itemName: itemN,
                                              designName: designN,
                                              color: colorN,
                                              size: sizeN,
                                              hsnCode: hsnN,
                                              unit: unitN,
                                              barcode: barcodeN,
                                              quantity: quantityN,
                                              purchasePrice: purchaseN,
                                              discount: discountN,
                                              mrp: setN,
                                              total: totalN,
                                              // taxPercent: taxPerN,
                                              gst: gstN,

                                            ));
                                      });
                                    }
                                    setState(() {
                                      // isLoading = false;
                                    });
                                    CustomSnackbar.show(
                                        context: context,
                                        label: 'Item Added',
                                        color: Colors.green,
                                        iconImage: "assets/icons/tick.svg");
                                  } else {
                                    setState(() {
                                      // isLoading = false;
                                    });
                                    CustomSnackbar.show(
                                        context: context,
                                        label: 'Failed',
                                        color: Colors.red,
                                        iconImage: "assets/icons/cross.svg");
                                    // print("no");
                                  }
                                });
                              } else {
                                CustomSnackbar.show(
                                  context: context,
                                  label: 'Failed',
                                  color: Colors.red,
                                  iconImage: "assets/icons/cross.svg",
                                );
                              }
                            });
                          },
                          child: MouseHover(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Material(
                                  elevation: 3,
                                  borderRadius: BorderRadius.circular(2),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(2),

                                    ),

                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 4.0,
                                          horizontal: 20),
                                      child: Text("+ Add",style: TextStyle(color: Colors.white),),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                  ],
                ),

                /// -------------------------------------------------------------
                ///
                ///
                const SizedBox(height: 10),

                const SizedBox(height: 10),
                SizedBox(
                  height: 500,
                  child: ListView.separated(
                    itemCount: contacts.length,
                    itemBuilder: (context, index) => getRow(index), separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(height: 10,),
                  ),
                ),


                ///-----------------------------



                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AlertDialog buildAddStockDialog(BuildContext context) {
    double quantityP = 0;
    double purchasePriceP = 0;
    double discountP = 0;
    double gstP = 0;

    void calculateTotalAmount() {
      double discountAmount = (quantityP * purchasePriceP) * (discountP / 100);
      double total = (quantityP * purchasePriceP) - discountAmount;

      if (gstVal != null) {
        double gstPercent = double.parse(gstVal!);
        double gstAmount = (total * gstPercent) / 100;
        total += gstAmount;
      }
      setState(() {
        totalAmount.text = total.toStringAsFixed(2); // Assuming total amount is a double value
      });
    }



    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Container(
            width: MediaQuery.sizeOf(context).width * 0.50,
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
                      child: Text("Add Stock",
                        style: pageTitle,),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child:SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 16,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                    child:AddPersonRowHolder(
                                      title: 'Group Name',
                                      textField: Row(
                                        children: [
                                          Expanded(
                                            flex: 3,
                                              child: TypeAheadField<GroupModel>(
                                                // decorationBuilder: ,
                                                suggestionsCallback: (search) => group.where((group) {
                                                  return group.groupName!.toLowerCase().contains(search.toLowerCase());
                                                }).toList(),
                                                builder: (context, controller, focusNode) {
                                                  return TextField(
                                                    controller: controller,
                                                    focusNode: focusNode,
                                                    autofocus: true,
                                                    decoration: MainFieldDecoration(label: 'Group Name').mainFieldDecoration(),
                                                    onChanged: (val) {
                                                      setState(() {
                                                        // groupNameController.text = controller.text;
                                                      });

                                                    },
                                                  );
                                                },
                                                itemBuilder: (context, group) {
                                                  return ListTile(
                                                    title: Text(group.groupName.toString()),
                                                  );
                                                },
                                                onSelected: (group) {
                                                  setState(() {
                                                    groupController.text = group.groupName.toString();
                                                  });



                                                },
                                              ),
                                              // child: CustomTextField(
                                              //   textInputAction: TextInputAction.next,
                                              //   controller: groupController,
                                              //   hintText: 'Group Name',
                                              //
                                              //   validation:
                                              //       (val) {
                                              //     if(val == null || val.isEmpty){
                                              //       return 'Enter a Group Name ';
                                              //     }
                                              //     return null;
                                              //   },
                                              // ),
                                          ),
                                          SizedBox(width: 6,),
                                          Expanded(
                                            child: customButton(
                                              horizontalPadding: 6,
                                              color: Colors.green,
                                              text: "Add",
                                              tap: () {
                                                showDialog(
                                                  context: context,
                                                  builder: (BuildContext context) {
                                                    return AddGroupDialog(
                                                      content: '',
                                                      title: '',
                                                      onPop: (val) {
                                                        groupController.text = val!;

                                                      }, onPopId: (val) {
                                                      groupIdController.text = val.toString();

                                                    },);
                                                  },
                                                );
                                              },
                                            ),
                                          )
                                        ],
                                      )
                                    ), ),
                                SizedBox(width: 12,),
                                Expanded(
                                  child: AddPersonRowHolder(
                                    title: 'Enter Brand Name',
                                    textField: CustomTextField(
                                      readOnly: true,
                                      tap: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return NameEditDialogWidget(
                                              title: 'Brand Name',
                                              addTextField: TextFormField(
                                                onChanged: (v) {
                                                  setState(() {});

                                                },
                                                controller: brandController,
                                                decoration: MainFieldDecoration(label: '').
                                                mainFieldDecoration(),
                                                //keyboardType: TextInputType.phone,
                                              ), buttons: Row(
                                              children: [
                                                MainButton(
                                                  radius: 4,
                                                  title: 'Add',
                                                  press: () {

                                                   /* if(groupNameController.text.isNotEmpty ) {
                                                      setState(() {
                                                        isLoading = true;
                                                        widget.onPop(groupNameController.text);
                                                      });

                                                      addGroupApi(
                                                          groupName: groupNameController.text,
                                                          hsnCode: hsnCodeController.text,
                                                          cgst: cgstController.text,
                                                          sgst: sgstController.text,
                                                          igst: igstController.text,
                                                          cess: cessController.text
                                                      ).then((value) async {

                                                        if (value['status'] == 1) {
                                                          setState(() {
                                                            isLoading = false;
                                                          });

                                                          Navigator.pop(context);
                                                          CustomMsgSnackbar.show(context: context,
                                                              label:"Group Added Succesfully",
                                                              color: Colors.green,
                                                              iconImage: icTick);

                                                          // Fluttertoast.showToast(
                                                          //   msg: 'Your OTP is ${value['otp']}',
                                                          // );
                                                          // Navigator.push(
                                                          //   context,
                                                          //   MaterialPageRoute(
                                                          //       builder: (context) => RegisterVerifyEmailScreen(
                                                          //         email: emailController.text,)),
                                                          // );
                                                        } else {
                                                          setState(() {
                                                            isLoading = false;
                                                          });
                                                          CustomMsgSnackbar.show(context: context,
                                                              label: value['message'],
                                                              color: Colors.red,
                                                              iconImage: "assets/icons/cross.svg");
                                                        }
                                                      });
                                                    }
                                                    // }
                                                    // else {
                                                    //   CustomMsgSnackbar.show(context: context,
                                                    //       label: 'Please Enter Valid Email',
                                                    //       color: Colors.red,
                                                    //       iconImage: "assets/icons/cross.svg");
                                                    // }*/
                                                  },

                                                  sizeHorizontal: 30,
                                                  sizeVerticle: 8,
                                                  color: selectedGreenColor,
                                                  titleColor: Colors.white,
                                                ),
                                                SizedBox(width: 5,),
                                                MainButton(
                                                  radius: 4,
                                                  title: 'Cancel',
                                                  press: () {
                                                    Navigator.pop(context);
                                                  },
                                                  sizeHorizontal: 18,
                                                  sizeVerticle: 8,
                                                  color: Colors.grey.withOpacity(0.10),
                                                  titleColor: Colors.black,
                                                ),
                                              ],
                                            ),
                                            );
                                          },
                                        );
                                      },
                                      textInputAction: TextInputAction.next,
                                      controller: brandController,
                                      hintText: 'Enter Brand Name',

                                      validation:
                                          (val) {
                                        if(val == null || val.isEmpty){
                                          return 'Enter Brand Name ';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(width: 12,),
                                Expanded(
                                  child: AddPersonRowHolder(
                                    title: 'Item Name',
                                    textField:   CustomTextField(
                                      textInputAction: TextInputAction.next,
                                      controller: itemName,
                                      hintText: 'Item Name',

                                      validation:
                                          (val) {
                                        if(val == null || val.isEmpty){
                                          return 'Enter a Item Name ';
                                        }
                                        return null;
                                      },

                                    ),),
                                ),
                              ],
                            ),
                            SizedBox(height: 16,),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: AddPersonRowHolder(
                                        title: 'Color',
                                        textField: CustomTextField(
                                          textInputAction: TextInputAction.next,
                                          controller: color,
                                          hintText: 'Color',
                                          validation:
                                              (val) {
                                            if(val == null || val.isEmpty){
                                              return 'Enter a Color Name ';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 12,),
                                    Expanded(
                                      child: AddPersonRowHolder(
                                        title: 'Size',
                                        textField:    CustomTextField(
                                          textInputAction: TextInputAction.next,
                                          controller: size,
                                          hintText: 'Size',
                                          validation:
                                              (val) {
                                            if(val == null || val.isEmpty){
                                              return 'Enter a Size';
                                            }
                                            return null;
                                          },

                                        ),),
                                    ),
                                    SizedBox(width: 12,),
                                    Expanded(
                                      child:
                                      AddPersonRowHolder(
                                        title: 'Design Name',
                                        textField:    CustomTextField(
                                          textInputAction: TextInputAction.next,
                                          controller: designName,
                                          hintText: 'Design Name',


                                          validation:
                                              (val) {
                                            if(val == null || val.isEmpty){
                                              return 'Enter a Design Name';
                                            }
                                            return null;
                                          },

                                        ),),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 16,),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: AddPersonRowHolder(
                                    title: 'Quantity',
                                    textField:    CustomTextField(
                                      textInputAction: TextInputAction.next,
                                      controller: quantity,
                                      hintText: 'Quantity',
                                      onChanged: (value) {
                                        quantityP = double.tryParse(value) ?? 0;
                                        calculateTotalAmount();
                                      },

                                      validation:
                                          (val) {
                                        if(val == null || val.isEmpty){
                                          return 'Enter a Quantity';
                                        }
                                        return null;
                                      },

                                    ),
                                  ),
                                ),
                                SizedBox(width: 12,),
                                Expanded(

                                  child: DropdownButtonFormField<String>(
                                    value: unitVal,
                                    items: units.map<DropdownMenuItem<String>>((unit) {
                                      return DropdownMenuItem<String>(
                                        value: unit,
                                        child: Text(unit),
                                      );
                                    }).toList(),
                                    onChanged: (String? value) {
                                      if (value != null) {
                                        setState(() {
                                          unitVal = value;
                                          unit.text = value;
                                        });

                                        // Add your logic here if needed
                                      }
                                    },
                                    decoration: ItemDataField(
                                      label: unitVal?.isEmpty ?? true ? "Select Unit" : unitVal!,
                                    ).itemFieldDecoration(),
                                  ),

                                ),
                                SizedBox(width: 12,),
                                Expanded(
                                  child: AddPersonRowHolder(
                                    title: 'Hsn Code',
                                    textField:    CustomTextField(
                                      textInputAction: TextInputAction.next,
                                      controller: hsnCode,
                                      hintText: 'Hsn Code',

                                      validation:
                                          (val) {
                                        if(val == null || val.isEmpty){
                                          return 'Enter a Hsn Code';
                                        }
                                        return null;
                                      },

                                    ),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 16,),
                            Row(
                              children: [
                                Expanded(
                                  child: AddPersonRowHolder(
                                    title: 'Purchase Price',
                                    textField:    CustomTextField(
                                      textInputAction: TextInputAction.next,
                                      controller: purchasePrice,
                                      hintText: 'Purchase Price',
                                      onChanged: (value) {
                                        purchasePriceP = double.tryParse(value) ?? 0;
                                        calculateTotalAmount();

                                      },

                                      validation:
                                          (val) {
                                        if(val == null || val.isEmpty){
                                          return 'Enter a Purchase Price';
                                        }
                                        return null;
                                      },

                                    ),
                                  ),
                                ),
                                SizedBox(width: 12,),
                                Expanded(

                                  child: AddPersonRowHolder(
                                    title: 'Discount %',
                                    textField:     CustomTextField(
                                      textInputAction: TextInputAction.next,
                                      controller: discount,
                                      hintText: 'Discount %',
                                      onChanged: (value) {
                                        discountP = double.tryParse(value) ?? 0;
                                        calculateTotalAmount();
                                      },

                                      validation:
                                          (val) {
                                        if(val == null || val.isEmpty){
                                          return 'Discount %';
                                        }
                                        return null;
                                      },

                                    ),),

                                ),
                                SizedBox(width: 12,),
                                Expanded(

                                  child: AddPersonRowHolder(
                                    title: 'Tax %',
                                    textField:     CustomTextField(
                                      textInputAction: TextInputAction.next,
                                      controller: taxPercent,
                                      hintText: 'Tax %',

                                      validation:
                                          (val) {
                                        if(val == null || val.isEmpty){
                                          return 'Tax %';
                                        }
                                        return null;
                                      },

                                    ),),

                                ),
                              ],
                            ),
                            SizedBox(height: 16,),
                            Row(
                              children: [
                                Expanded(
                                  child: AddPersonRowHolder(
                                    title: 'Set Mrp',
                                    textField:    CustomTextField(
                                      textInputAction: TextInputAction.next,
                                      controller: setMrp,
                                      hintText: 'Set Mrp',

                                      validation:
                                          (val) {
                                        if(val == null || val.isEmpty){
                                          return 'Set Mrp';
                                        }
                                        return null;
                                      },

                                    ),
                                  ),
                                ),
                                SizedBox(width: 12,),
                                Expanded(

                                  child: AddPersonRowHolder(
                                    title: 'Barcode Type',
                                    textField:     CustomTextField(
                                      textInputAction: TextInputAction.next,
                                      controller: barcodeType,
                                      hintText: 'barcode Type',

                                      validation:
                                          (val) {
                                        if(val == null || val.isEmpty){
                                          return 'Barcode';
                                        }
                                        return null;
                                      },

                                    ),),

                                ),
                                SizedBox(width: 12,),
                                Expanded(

                                  child: AddPersonRowHolder(
                                    title: 'Total',
                                    textField:     CustomTextField(
                                      textInputAction: TextInputAction.next,
                                      controller: totalAmount,
                                      hintText: 'Total',

                                      validation:
                                          (val) {
                                        if(val == null || val.isEmpty){
                                          return 'Total';
                                        }
                                        return null;
                                      },

                                    ),),

                                ),
                              ],
                            ),
                            SizedBox(height: 40,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                if (Responsive.isDesktop(context))
                                /* isLoading ?
                                                      LoadingButton():*/
                                  MainButton(
                                    radius: 4,
                                    title: 'Add',
                                    press: () {
                                      if (_formKey.currentState!.validate()) {
                                        setState(() {
                                          // isLoading = true;
                                        });

                                      } else {
                                        CustomSnackbar.show(
                                            context: context,
                                            label: 'Failed',
                                            color: Colors.red,
                                            iconImage: "assets/icons/cross.svg");
                                      }
                                    },

                                    sizeHorizontal: 30,
                                    sizeVerticle: 8,
                                    color: selectedGreenColor,
                                    titleColor: Colors.white,
                                  ),
                                SizedBox(width: 5,),
                                MainButton(
                                  radius: 4,
                                  title: 'Cancel',
                                  press: () {
                                    Navigator.pop(context);
                                  },
                                  sizeHorizontal: 18,
                                  sizeVerticle: 8,
                                  color: Colors.grey.withOpacity(0.10),
                                  titleColor: Colors.black,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
    },
                            ),);
  }


  Widget getRow(int index) {
    int serialNumber = index + 1;
    return Row(
      children: [

        // Expanded(child: AddItemDataBox(text:  contacts[index].itemCode,)),
        Expanded(child: Image.file(pickedImage,
        height:20,
        cacheWidth: 20,
        cacheHeight: 20,
        width: 30,)),
        Expanded(child: AddItemDataBox(text:  '$serialNumber')),
        // Expanded(child: AddItemDataBox(text:  contacts[index].image.substring( image.toString().length- 10),)),
        Expanded(child: AddItemDataBox(text:  contacts[index].itemName,)),
        Expanded(child: AddItemDataBox(text:  contacts[index].designName,)),
        Expanded(child: AddItemDataBox(text:  contacts[index].color,)),
        Expanded(child: AddItemDataBox(text:  contacts[index].size,)),
        Expanded(child: AddItemDataBox(text:  contacts[index].hsnCode,)),
        Expanded(child: AddItemDataBox(text:  contacts[index].quantity,)),
        Expanded(child: AddItemDataBox(text:  contacts[index].unit,)),
        Expanded(child: AddItemDataBox(text:  contacts[index].barcode,)),
        Expanded(child: AddItemDataBox(text:  contacts[index].purchasePrice,)),
        Expanded(child: AddItemDataBox(text:  contacts[index].discount,)),
        Expanded(child: AddItemDataBox(text:  contacts[index].gst,)),
        Expanded(child: AddItemDataBox(text:  contacts[index].mrp,)),
        Expanded(child: AddItemDataBox(text:  contacts[index].total,)),
        SizedBox(width: 5,),
        MouseHover(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(2),

                ),

                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0,
                      horizontal: 20),
                  child: Text("+ Add",style: TextStyle(color: Colors.white),),
                ),
              ),
            ],
          ),
        ),



      ],
    );

  }
}






class DataSpaceBetweenContainer extends StatelessWidget {
  final String title;
  final String date;
  const DataSpaceBetweenContainer({super.key, required this.title, required this.date});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
          style: k16_400_62696A.copyWith(fontSize: 14,fontWeight: FontWeight.w500),),
        Text(date,
          style: k16_400_62696A.copyWith(fontSize: 14,fontWeight: FontWeight.w600),)
      ],
    );
  }
}


class AddItemField extends StatelessWidget {
  final TextEditingController? control;
  final String label;
  final FocusNode? nextFocusNode;
  final TextInputAction? textAction;
  final bool ? read;
  final Function() ? tap;
  const AddItemField({super.key,
    this.control,
    required this.label,
    this.nextFocusNode, this.textAction, this.read,  this.tap,});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 30,
      // color: Colors.white,
      child: TextField(
        cursorHeight: 22,
        controller: control,
        textInputAction: textAction,
        readOnly: read == false,
        onTap: tap,

        onSubmitted: (val) {
          FocusScope.of(context).requestFocus(FocusNode());
          FocusScope.of(context).nextFocus();
        },
        decoration: ItemDataField(
          label: label,
        ).itemFieldDecoration(),
      ),
    );
  }
}


class AddItemHeaderBox extends StatelessWidget {
  final String title;
  const AddItemHeaderBox({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      decoration: BoxDecoration(
          color: selectedGreenColor,
          border: Border.all(
              width: 0.2,
              color: Colors.white
          ),
      ),
      child: Center(
          child: Text(
            title,
            style: TextStyle(
                color: Colors.white, fontSize: 13, fontWeight: FontWeight.w900),
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            maxLines: 2,)),
    );
  }
}


class AddItemDataBox extends StatelessWidget {
  final String text;
  const AddItemDataBox({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              width: 0.5,
              color: Colors.black.withOpacity(0.60)
          )
      ),
      child: Center(child: Text(text)),

    );
  }
}