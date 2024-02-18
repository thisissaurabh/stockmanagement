import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ionicons/ionicons.dart';

import '../../../constants/colors.dart';
import '../../../constants/text_styles.dart';

class CardSales extends StatelessWidget {
  final String title,amount,viewAll;
  final Color iconColor;
  final Color containerColor;
  final IconData icon;

  const CardSales({super.key,
    required this.title,
    required this.amount,
    required this.viewAll,
    required this.iconColor,
    required this.icon, required this.containerColor});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,
              style: textMainGrey,),
            SvgPicture.asset("assets/icon/arrow-up-right-svgrepo-com.svg",
              height: 24,
              width: 24,)
          ],
        ),
        Row(
          children: [
            Text(amount,style: title34w300,),
            SvgPicture.asset("assets/icon/rupee-sign-svgrepo-com.svg",
              height: 16,
              width: 16,),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(viewAll,
              style: textGreenColor.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w500),),
            Container(
                color: containerColor,
                padding: EdgeInsets.all(10),
                child: Icon(icon,
                  color: iconColor,))
          ],
        )
      ],
    );
  }
}
