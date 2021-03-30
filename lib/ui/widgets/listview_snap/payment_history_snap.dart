import 'package:flutter/material.dart';
import 'package:jetex_app/models/payment_history.dart';
import 'package:jetex_app/ui/widgets/widgets.dart';
import 'package:jetex_app/utils/color_palette.dart';
import 'package:jetex_app/utils/custom_icons_icons.dart';


class PaymentHistorySnap extends StatelessWidget {

  final PaymentHistory history;

  const PaymentHistorySnap({
    Key key,
    this.history
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
                  history.paymentFrom,
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
                  history.paymentTo,
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
                  amount: history.amount,
                  isSmall: true,
                ),
                Text(
                  history.date,
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
