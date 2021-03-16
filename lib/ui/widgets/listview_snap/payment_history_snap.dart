import 'package:flutter/material.dart';
import 'package:jetex_app/ui/widgets/widgets.dart';
import 'package:jetex_app/utils/color_palette.dart';
import 'package:jetex_app/utils/custom_icons_icons.dart';


class PaymentHistorySnap extends StatelessWidget {

  final String from;
  final String to;
  final double amount;
  final String date;

  const PaymentHistorySnap({
    Key key,
    this.from,
    this.to,
    this.amount,
    this.date
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.white
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  from,
                  style: TextStyle(
                      color: ColorPalette.darkGrey,
                      fontFamily: 'HelveticaNeue',
                      fontWeight: FontWeight.w500,
                      fontSize: 14
                  ),
                ),
                SizedBox(width: 12,),
                Icon(
                  CustomIcons.exchange_alt,
                  color: ColorPalette.darkPurple,
                  size: 18,
                ),
                SizedBox(width: 12,),
                Text(
                  to,
                  style: TextStyle(
                      color: ColorPalette.darkGrey,
                      fontFamily: 'HelveticaNeue',
                      fontWeight: FontWeight.w500,
                      fontSize: 14
                  ),
                ),
              ],
            ),
            SizedBox(height: 12,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                CurrencyText(
                  amount: amount,
                  isSmall: true,
                ),
                Text(
                  date,
                  style: TextStyle(
                      color: ColorPalette.darkGrey,
                      fontFamily: 'HelveticaNeue',
                      fontWeight: FontWeight.w700,
                      letterSpacing: -.5,
                      fontSize: 12
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
