import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/text_styles.dart';

class AddVoucher extends StatefulWidget {
  const AddVoucher({super.key});

  @override
  State<AddVoucher> createState() => _AddVoucherState();
}

class _AddVoucherState extends State<AddVoucher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);

                },
                child: Row(
                  children: [
                    SvgPicture.asset("assets/icons/chevron-back-svgrepo-com.svg",
                      color: Colors.black,
                      height: 32,
                      width: 32,),
                    SizedBox(width: 8,),
                    Text("Add Voucher",
                      style: pageTitle,)
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
