
import 'dart:io';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:spyco_shop_management/constants/colors.dart';
import 'package:spyco_shop_management/constants/responsive.dart';
import 'package:spyco_shop_management/constants/textfield_decoration.dart';
import 'package:spyco_shop_management/constants/textstyle.dart';
import 'package:spyco_shop_management/controllers/MenuAppController.dart';
import 'package:spyco_shop_management/screens/dashboard/components/header.dart';
import 'package:spyco_shop_management/screens/main/components/side_menu.dart';
import 'package:spyco_shop_management/widgets/cards.dart';
import 'package:spyco_shop_management/widgets/global_widgets.dart';
import 'package:spyco_shop_management/widgets/globals.dart';
import 'components/items_model.dart';

class AddStockItems extends StatefulWidget {
  const AddStockItems({super.key});

  @override
  State<AddStockItems> createState() => _AddStockItemsState();
}

class _AddStockItemsState extends State<AddStockItems> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: context.read<MenuAppController>().scaffoldKey,
      drawer: SideMenu(),
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
              child: AddItemsContainer(
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class AddItemsContainer extends StatefulWidget {
  const AddItemsContainer({super.key});

  @override
  State<AddItemsContainer> createState() => _AddItemsContainerState();
}

class _AddItemsContainerState extends State<AddItemsContainer> {

  File pickedImage = File("");
  final ImagePicker _imgPicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);

              },
              child: Row(
                children: [
                  SvgPicture.asset("assets/icons/arrow-back-basic-svgrepo-com.svg",
                  height: 32,
                  width: 32,),
                  SizedBox(width: 8,),
                  Text("Add Items",
                  style: TextStyle(
                    fontSize: 16
                  ),)
                ],
              ),
            ),
            SizedBox(height: 5,),
            CustomHorizontalLine(),
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: SizedBox(
                    height: 500,
                      child: HomePage()),
                ),
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: ElevatedBgCard(
                        radius: 16,
                        child: SizedBox(
                          height: 500,
                          child:Column(
                            children: [
                              DataSpaceBetweenContainer(
                                title: 'Date',
                                date: '23/10/1996',),
                              DataSpaceBetweenContainer(
                                title: 'Supplier',
                                date: 'Gagan',),
                              SizedBox(height:16,),
                              Column(
                                children: [
                                  Container(
                                    height: 160,
                                    width: 160,
                                    clipBehavior: Clip.hardEdge,
                                    decoration : BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)
                              ),
                                    child: pickedImage.path.isEmpty ?
                                    SvgPicture.asset(
                                      "assets/images/productplaceholder.svg",
                                    ) :
                                    Image.file(
                                      pickedImage,

                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(height:13,),


                                  BorderContainer(
                                    onTap: () async {
                                      XFile? v = await _imgPicker.pickImage(
                                          // maxWidth: 90,
                                          // maxHeight: 90,
                                          source: ImageSource.gallery);
                                      if (v != null) {
                                        setState(
                                              () {
                                            pickedImage = File(v.path);
                                          },
                                        );
                                      }
                                      print(pickedImage);
                                    },
                                    widget: Padding(
                                      padding: const EdgeInsets.only(left: 16,right: 16,top: 4,bottom: 4),
                                      child: Text("Select Image for the Item",
                                        style: TextStyle(fontSize: 12),),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 16,),
                              DataSpaceBetweenContainer(
                                title: 'Item Name',
                                date: 'Xyz',),
                              DataSpaceBetweenContainer(
                                title: 'Design Name',
                                date: 'Abc',),
                              DataSpaceBetweenContainer(
                                title: 'Color',
                                date: 'Green',),
                              DataSpaceBetweenContainer(
                                title: 'Size',
                                date: '8',),
                              DataSpaceBetweenContainer(
                                title: 'HNBC Coede',
                                date: '7557',),
                              DataSpaceBetweenContainer(
                                title: 'Price',
                                date: '10000',),
                            ],
                          )
                        ),
                      ),
                    ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  String? unitVal;

  final List<String> gst = [
    '3',
    '5',
    '12',
    '18',
  ];

  String? gstVal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: AddItemHeaderBox(title: '',)
                ),
                Expanded(
                    child: AddItemHeaderBox(title: 'Item Code',)
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

              ],
            ),
           Row(
             children: [
               Expanded(
                 child: AddItemField(control: sno, label: '',),
               ),
            
               Expanded(
                 child: AddItemField(control: itemCode, label: 'Item Code',),
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
                 child:SizedBox(
                   height: 30,
                   child: DropdownButtonHideUnderline(
                     child: DropdownButton2<String>(
                       isExpanded: true,
                       hint: const Row(
                         children: [
                           Expanded(
                             child: Text(
                               'Select',
                               style: TextStyle(
                                 fontSize: 14,
                                 color: Colors.black,
                               ),
                               overflow: TextOverflow.ellipsis,
                             ),
                           ),
                         ],
                       ),
                       items: units
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
                       value: unitVal,
                       onChanged: (String? value) {
                         setState(() {
                           unitVal = value;
                           unit.text = value!;
                         });
                       },
                       buttonStyleData: ButtonStyleData(
                         // height: 50,
                         width: 276,
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
               Expanded(
                 child:  SizedBox(
                   height: 30,
                   child: TextField(
                     cursorHeight: 22,
                     controller: purchasePrice,
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
                 child:SizedBox(
                   height: 30,
                   child: DropdownButtonHideUnderline(
                     child: DropdownButton2<String>(
                       isExpanded: true,
                       hint: const Row(
                         children: [
                           Expanded(
                             child: Text(
                               'Select',
                               style: TextStyle(
                                 fontSize: 14,
                                 color: Colors.black,
                               ),
                               overflow: TextOverflow.ellipsis,
                             ),
                           ),
                         ],
                       ),
                       items: gst
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
                       value: gstVal,
                       onChanged: (String? value) {
                         setState(() {
                           gstVal = value;
                           gstController.text = value ?? '';

                           gstP = double.tryParse(value!) ?? 0;
                           calculateTotalAmount();
                         });
                         print(gstController.toString());
                       },
                       buttonStyleData: ButtonStyleData(
                         // height: 50,
                         width: 276,
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




             ],
           ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      //
                      String itemC = itemCode.text.trim();
                      String itemN = itemName.text.trim();
                      String designN = designName.text.trim();
                      String colorN = color.text.trim();
                      String sizeN = size.text.trim();
                      String hsnN = hsnCode.text.trim();
                      String unitN = unit.text.trim();
                      String quantityN = quantity.text.trim();
                      String purchaseN = purchasePrice.text.trim();
                      String gstN = gstController.text.trim();

                      String discountN = discount.text.trim();
                      String taxPerN = taxPercent.text.trim();
                      String setN = setMrp.text.trim();
                      String totalN = totalAmount.text.trim();
                      if (itemC.isNotEmpty &&
                          itemN.isNotEmpty &&
                          designN.isNotEmpty &&
                          colorN.isNotEmpty &&
                          sizeN.isNotEmpty &&
                          hsnN.isNotEmpty &&
                          unitN.isNotEmpty &&
                          quantityN.isNotEmpty &&
                          purchaseN.isNotEmpty &&
                          discountN.isNotEmpty &&
                          setN.isNotEmpty &&
                          gstN.isNotEmpty &&
                          totalN.isNotEmpty
                      ) {
                        setState(() {
                          itemCode.text = '';
                          itemName.text = '';
                          designName.text = '';
                          color.text = '';
                          size.text = '';
                          hsnCode.text = '';
                          unit.text = '';
                          quantity.text = '';
                          purchasePrice.text = '';
                          discount.text = '';
                          gstController.text = '';
                          setMrp.text = '';
                          totalAmount.text = '';
                          contacts.add(
                              Contact(
                              itemCode: itemC,
                              itemName: itemN,
                            designName: designN,
                            color: colorN,
                            size: sizeN,
                            hsnCode: hsnN,
                            unit: unitN,
                            quantity: quantityN,
                            purchasePrice: purchaseN,
                            discount: discountN,
                            mrp: setN,
                            total: totalN,
                              taxPercent: taxPerN, gst: gstN
                          ));
                        });
                      }
                      //
                    },
                    child: const Text('Save')),
                ElevatedButton(
                    onPressed: () {
                      String itemC = itemCode.text.trim();
                      String itemN = itemName.text.trim();
                      String designN = designName.text.trim();
                      String colorN = color.text.trim();
                      String sizeN = size.text.trim();
                      String hsnN = hsnCode.text.trim();
                      String unitN = unit.text.trim();
                      String quantityN = quantity.text.trim();
                      String purchaseN = purchasePrice.text.trim();
                      String discountN = discount.text.trim();
                      String gstN = gstController.text.trim();
                      String taxPerN = taxPercent.text.trim();
                      String setN = setMrp.text.trim();

                      String totalN = totalAmount.text.trim();
                      if (itemC.isNotEmpty &&
                          itemN.isNotEmpty &&
                          designN.isNotEmpty &&
                          colorN.isNotEmpty &&
                          sizeN.isNotEmpty &&
                          hsnN.isNotEmpty &&
                          unitN.isNotEmpty &&
                          quantityN.isNotEmpty &&
                          purchaseN.isNotEmpty &&
                          discountN.isNotEmpty &&
                          taxPerN.isNotEmpty &&
                          setN.isNotEmpty &&
                          gstN.isNotEmpty &&
                          totalN.isNotEmpty) {
                        setState(() {
                          itemCode.text = '';
                          itemName.text = '';
                          designName.text = '';
                          color.text = '';
                          size.text = '';
                          hsnCode.text = '';
                          unit.text = '';
                          quantity.text = '';
                          purchasePrice.text = '';
                          discount.text = '';
                          gstController.text = '';
                          taxPercent.text = '';
                          setMrp.text = '';
                          totalAmount.text = '';
                          contacts[selectedIndex].itemCode = itemC;
                          contacts[selectedIndex].itemName = itemN;
                          contacts[selectedIndex].designName = designN;
                          contacts[selectedIndex].color = colorN;
                          contacts[selectedIndex].size = sizeN;
                          contacts[selectedIndex].hsnCode = hsnN;
                          contacts[selectedIndex].unit = unitN;
                          contacts[selectedIndex].quantity = quantityN;
                          contacts[selectedIndex].purchasePrice = purchaseN;
                          contacts[selectedIndex].discount = discountN;
                          contacts[selectedIndex].gst = gstN;
                          contacts[selectedIndex].taxPercent = taxPerN;
                          contacts[selectedIndex].mrp = setN;
                          contacts[selectedIndex].total = totalN;
                          selectedIndex = -1;
                        });
                      }
                      //
                    },
                    child: const Text('Update')),
              ],
            ),
            const SizedBox(height: 10),
             Expanded(
              child: ListView.separated(
                itemCount: contacts.length,
                itemBuilder: (context, index) => getRow(index), separatorBuilder: (BuildContext context, int index) =>
                SizedBox(height: 10,),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getRow(int index) {
    int serialNumber = index + 1;
    return Row(
      children: [
        Expanded(child: AddItemDataBox(text:  '$serialNumber')),
        Expanded(child: AddItemDataBox(text:  contacts[index].itemCode,)),
        Expanded(child: AddItemDataBox(text:  contacts[index].itemName,)),
        Expanded(child: AddItemDataBox(text:  contacts[index].designName,)),
        Expanded(child: AddItemDataBox(text:  contacts[index].color,)),
        Expanded(child: AddItemDataBox(text:  contacts[index].size,)),
        Expanded(child: AddItemDataBox(text:  contacts[index].hsnCode,)),
        Expanded(child: AddItemDataBox(text:  contacts[index].quantity,)),
        Expanded(child: AddItemDataBox(text:  contacts[index].unit,)),
        Expanded(child: AddItemDataBox(text:  contacts[index].purchasePrice,)),
        Expanded(child: AddItemDataBox(text:  contacts[index].discount,)),
        Expanded(child: AddItemDataBox(text:  contacts[index].gst,)),
        Expanded(child: AddItemDataBox(text:  contacts[index].mrp,)),
        Expanded(child: AddItemDataBox(text:  contacts[index].total,)),



      ],
    );
    // return Card(
    //   child: ListTile(
    //     leading: CircleAvatar(
    //       backgroundColor:
    //       index % 2 == 0 ? Colors.deepPurpleAccent : Colors.purple,
    //       foregroundColor: Colors.white,
    //       child: Text(
    //         contacts[index].itemName[0],
    //         style: const TextStyle(fontWeight: FontWeight.bold),
    //       ),
    //     ),
    //     title: Row(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Text(
    //           contacts[index].itemCode,
    //           style: const TextStyle(fontWeight: FontWeight.bold),
    //         ),
    //         Text(contacts[index].color),
    //       ],
    //     ),
    //     trailing: SizedBox(
    //       width: 70,
    //       child: Row(
    //         children: [
    //           InkWell(
    //               onTap: () {
    //
    //                 itemCode.text = contacts[index].itemCode;
    //                 itemName.text = contacts[index].itemName;
    //                 designName.text = contacts[index].designName;
    //                 color.text = contacts[index].color;
    //                 size.text = contacts[index].size;
    //                 hsnCode.text = contacts[index].hsnCode;
    //                 unit.text = contacts[index].unit;
    //                 quantity.text = contacts[index].quantity;
    //                 purchasePrice.text = contacts[index].purchasePrice;
    //                 discount.text = contacts[index].discount;
    //                 taxPercent.text = contacts[index].taxPercent;
    //                 setMrp.text = contacts[index].mrp;
    //                 totalAmount.text = contacts[index].total;
    //
    //                 setState(() {
    //                   selectedIndex = index;
    //                 });
    //                 //
    //               },
    //               child: const Icon(Icons.edit)),
    //           InkWell(
    //               onTap: (() {
    //                 //
    //                 setState(() {
    //                   contacts.removeAt(index);
    //                 });
    //                 //
    //               }),
    //               child: const Icon(Icons.delete)),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
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
  final TextEditingController control;
  final String label;
  const AddItemField({super.key, required this.control, required this.label});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 30,
      child: TextField(
        cursorHeight: 22,
        controller: control,
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
      height: 50,
      decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.80),
        border: Border.all(
          width: 0.2,
          color: Colors.black.withOpacity(0.50)
        )
      ),
      child: Center(
          child: Text(
        title,
      style: TextStyle(
        color: Colors.white,
            fontSize: 13
      ),
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
