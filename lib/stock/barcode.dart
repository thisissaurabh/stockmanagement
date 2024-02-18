


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../api/login_register/barcode_api.dart';
import '../api_models/barcode_model.dart';
import '../constants/responsive.dart';
import '../constants/text_styles.dart';

import '../screens/dashboard/components/header.dart';
import '../src/widgets/common_widgets.dart';
import '../widgets/cards.dart';
import '../widgets/global_widgets.dart';
import '../widgets/loading.dart';

class Barcode extends StatefulWidget {
  const Barcode({super.key});

  @override
  State<Barcode> createState() => _BarcodeState();
}

class _BarcodeState extends State<Barcode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // drawer: SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
            // Expanded(
            //   // default flex = 1
            //   // and it takes 1/6 part of the screen
            //   child: SideMenu(),
            // ),
              Expanded(
                // It takes 5/6 part of the screen
                flex: 4,
                child: AllBarcodeList(),
              ),
          ],
        ),
      ),
    );
  }
}


class AllBarcodeList extends StatefulWidget {
  const AllBarcodeList({super.key});

  @override
  State<AllBarcodeList> createState() => _AllBarcodeListState();
}

class _AllBarcodeListState extends State<AllBarcodeList> {

  @override
  void initState() {
    getBarcode();
    // TODO: implement initState
    super.initState();

  }



  bool isLoading = false;

  List<BarcodeModel> barcode = [];

  Future<void> getBarcode() async {
    setState(() {
      isLoading = true;
    });

    try {
      var value = await getBarcodeApi();
      print('API Response: $value');

      if (value['status'] == 1) {
        barcode.clear(); // Clear existing data before adding new items

        for (var v in value['data']) {
          barcode.add(BarcodeModel.fromJson(v));
        }

        setState(() {
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
        print('API Error: ${value['status']}');
      }
    } catch (e) {
      print('Error: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  List<String> sNo = ["1","2","3","4","5","6","7","8","9","10"];
  List <String>partyName = ["95959595", "95959595","95959595", "95959595","95959595", "95959595","95959595", "95959595","95959595", "95959595",];
  List <String>date = ["saurabh","saurabh","saurabh","saurabh","saurabh","saurabh","saurabh","saurabh","saurabh","saurabh",];
  List <String> amount = ["xyz collections","xyz collections","xyz collections","xyz collections","xyz collections","xyz collections","xyz collections","xyz collections","xyz collections","xyz collections",];
  List item = ["xyz collections","xyz collections","xyz collections","xyz collections","xyz collections","xyz collections","xyz collections","xyz collections","xyz collections","xyz collections",];
  List<String> image = ["assets/images/profile_pic.png","assets/images/profile_pic.png","assets/images/profile_pic.png","assets/images/profile_pic.png","assets/images/profile_pic.png","assets/images/profile_pic.png","assets/images/profile_pic.png","assets/images/profile_pic.png","assets/images/profile_pic.png","assets/images/profile_pic.png",];


  @override
  Widget build(BuildContext context) {
    return
      isLoading ?
      Loading():
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(title: "Barcode"),
              // SizedBox(height: 5,),
              // CustomHorizontalLine(),
              // SizedBox(height: 16,),


              ElevatedBgCard(
                radius: 0.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 40.0),
                          child: Row(
                            children: [
                              Expanded(
                                  child: InvoiceBoxField(
                                    title: '#',

                                  )),
                              Expanded(
                                  flex: 2,
                                  child: InvoiceBoxField(
                                    title: 'Item',
                                  )),
                              Expanded(flex: 2,
                                  child: InvoiceBoxField(
                                    title: 'Barcode',
                                  )),
                              Expanded(
                                  child: InvoiceBoxField(
                                    title: 'Coding Type',
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: InvoiceBoxField(
                                    title: 'Quantity',
                                  )),
                              Expanded(
                                  child: InvoiceBoxField(
                                    title: 'Date',
                                  )),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        // CustomHorizontalLine(),
                        ListView.separated(
                          itemCount: barcode.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (_, i) {
                            int serialNumber = i + 1;
                            return Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Center(
                                      child: Text(
                                          '$serialNumber',
                                          style :titleGrey16,
                                          textAlign: TextAlign.center),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Center(
                                      child: Text(
                                          barcode[i].itemName.toString(),
                                          maxLines: 4,
                                          overflow: TextOverflow.ellipsis,
                                          style: pageTitle16,
                                          textAlign: TextAlign.center),
                                    ),
                                  ),
                                  Expanded(
                                    flex:2,
                                    child: Center(
                                      child: Column(
                                        children: barcode[i].barcodes!.map((barcode) {
                                          return CachedNetworkImage(
                                            imageUrl: barcode.imageUrl.toString(),
                                            fit: BoxFit.cover,
                                            errorWidget: (context, url, error) => Image.asset("assets/icons/userico.jpg"),
                                            progressIndicatorBuilder: (a, b, c) => Opacity(
                                              opacity: 0.3,
                                              child: Shimmer.fromColors(
                                                baseColor: Colors.black12,
                                                highlightColor: Colors.white,
                                                child: Container(
                                                  width: 50,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    shape: BoxShape.circle,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Center(
                                      child: Text(
                                          barcode[i].codingType.toString(),
                                          style: titleGrey16,
                                          textAlign: TextAlign.center),
                                    ),
                                  ),
                                  Expanded(
                                    flex:2,

                                    child: Center(
                                      child: Text(
                                          barcode[i].quantity.toString(),
                                          style: titleGrey16,
                                          textAlign: TextAlign.center),
                                    ),
                                  ),
                                  Expanded(
                                    child: Center(
                                      child: Text(
                                          barcode[i].date.toString(),
                                          style: titleGrey16,
                                          textAlign: TextAlign.center),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) => CustomHorizontalLine(),
                        ),


                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
  }
}




