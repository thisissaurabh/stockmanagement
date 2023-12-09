import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spyco_shop_management/constants/colors.dart';
import 'package:spyco_shop_management/constants/textstyle.dart';

class CustomerDetailsCard extends StatelessWidget {
  final String name;
  final String email;
  final String phoneNo;
  const CustomerDetailsCard(
      {super.key,
      required this.name,
      required this.email,
      required this.phoneNo});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              "assets/icons/person-svgrepo-com.svg",
              height: 44,
              width: 44,
            )
          ],
        ),
        SizedBox(
          width: 8,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: selectedThinText,
            ),
            Text(
              email,
              style: selectedThinText,
            ),
            Row(
              children: [
                SvgPicture.asset(
                  "assets/icons/phone-svgrepo-com.svg",
                  height: 16,
                  width: 16,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  phoneNo,
                  style: selectedThinText,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Edit",
                  style: thinblueText,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Send Mail",
                  style: thinblueText,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Delete",
                  style: thinblueText,
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}

class RowSpaceBetweenRow extends StatelessWidget {
  final String title;
  final String desc;

  const RowSpaceBetweenRow(
      {super.key, required this.title, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: selectedThinText16,
        ),
        Text(
          desc,
          style: selectedThinText16,
        ),
      ],
    );
  }
}


class DashBoardPriceCard extends StatelessWidget {
  final String title;
  final String price;
  final String percent;



  const DashBoardPriceCard({super.key, required this.title, required this.price, required this.percent});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: nameText,
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              price,
              style: nameText42,
            ),
            Spacer(),
            Column(
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/triangle_arrow_up.svg",
                      colorFilter: ColorFilter.mode(
                          positiveColor, BlendMode.srcIn),
                    ),
                    Text(
                      percent,
                      style: TextStyle(
                          color: Colors.green.withOpacity(0.80)
                      ),),
                  ],
                ),
                Text(
                  "from last month",
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.green.withOpacity(0.80)
                  ),),
              ],
            ),
          ],
        ),
      ],
    );
  }
}


class DataField extends StatefulWidget {
  final Widget child;
  const DataField({super.key, required this.child});

  @override
  State<DataField> createState() => _DataFieldState();
}

class _DataFieldState extends State<DataField> {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return  Container(
      height: 50.0,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: AppColors.whiteColor,
      ),
      child: widget.child
    );
  }
}


class CustomRadioButton extends StatelessWidget {
  final String value;
  final String? groupValue;
  final ValueChanged<String> onChanged;

  const CustomRadioButton({
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(value);
        print("Selected Option: $value");
      },
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: groupValue == value ? Colors.black : Colors.grey,
            width: 2.0, // Border width
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0), // Padding for the inner circle
          child: groupValue == value
              ? Container(
            width: 20.0, // Adjust size as needed
            height: 20.0, // Adjust size as needed
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black, // Color of the inner circle when selected
            ),
          )
              : SizedBox(
            width: 20.0, // Adjust size as needed
            height: 20.0, // Adjust size as needed
          ),
        ),
      ),
    );
  }
}


class AddSupplierRow extends StatefulWidget {
  final String title;
  final Widget? child;
  final Widget? child2;
  const AddSupplierRow({super.key, required this.title, this.child, this.child2});

  @override
  State<AddSupplierRow> createState() => _AddSupplierRowState();
}

class _AddSupplierRowState extends State<AddSupplierRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          color: Colors.transparent,
          width: MediaQuery.sizeOf(context).width *0.10,
            child: Text(widget.title)),
        SizedBox(width: 16,),
        widget.child ?? SizedBox(),

        SizedBox(width: 16,),
        widget.child2 ?? SizedBox()




      ],
    );
  }
}
