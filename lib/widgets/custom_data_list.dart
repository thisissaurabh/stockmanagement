import 'package:flutter/material.dart';
import 'package:spyco_shop_management/constants/colors.dart';
import 'package:spyco_shop_management/constants/textstyle.dart';
import 'package:spyco_shop_management/widgets/cards.dart';
import 'package:spyco_shop_management/widgets/global_widgets.dart';

class CustomDataList extends StatefulWidget {
  final String listTitle;
  final String categoryTitle1;
  final String categoryTitle2;
  final String categoryTitle3;
  final String categoryTitle4;
  final int listItemCount;
  final List<String> saleType;
  final List<String> partyName;
  final List<String> date;
  final List<String> amount;
  const CustomDataList({super.key,
    required this.listTitle,
    required this.categoryTitle1,
    required this.categoryTitle2,
    required this.categoryTitle3,
    required this.categoryTitle4,
    required this.listItemCount, required this.saleType, required this.partyName, required this.date, required this.amount,

  });

  @override
  State<CustomDataList> createState() => _CustomDataListState();
}

class _CustomDataListState extends State<CustomDataList> {
  List saleType = ["Purchase","Sales","Purchase","Sales""Purchase","Sales""Purchase","Sales""Purchase","Sales"];
  List partyName = ["saurabh", "Roshan","saurabh", "Roshan","saurabh", "Roshan","saurabh", "Roshan","saurabh", "Roshan",];
  List date = ["24-10-2023","24-10-2023","24-10-2023","24-10-2023","24-10-2023","24-10-2023","24-10-2023","24-10-2023","24-10-2023","24-10-2023",];
  List amount = ["10000","20000","60000","90000","50000","10000","10000","10000","10000","10000",];
  @override
  Widget build(BuildContext context) {
    return  ElevatedBgCard(
      radius: 0.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16,top: 16,),
            child: Text(
              widget.listTitle,
              style: nameText,

            ),
          ),
          SizedBox(height: 10,),
          Column(
            children: [
              Container(
                color: selectedColor
                    .withOpacity(0.40),
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 16.0,vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          widget.categoryTitle1,
                          style: nameTextGrey,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          widget.categoryTitle2,
                          style: nameTextGrey,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          widget.categoryTitle3,
                          style: nameTextGrey,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          widget.categoryTitle4,
                          style: nameTextGrey,
                        ),
                      ),

                    ],
                  ),
                ), ),
              SizedBox(
                height: 5,
              ),
              // CustomHorizontalLine(),
              ListView.separated(
                itemCount: widget.listItemCount,
                shrinkWrap: true,
                itemBuilder: (_, i) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            saleType[i],
                            style: listName,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            partyName[i],
                            style: listName,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            date[i],
                            style: listName,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            amount[i],
                            style: listName,
                          ),
                        ),
                      ],
                    ),
                  );
                }, separatorBuilder: (BuildContext context, int index) =>
                  CustomHorizontalLine(),
              )

            ],
          ),
        ],
      ),
    );
  }
}
