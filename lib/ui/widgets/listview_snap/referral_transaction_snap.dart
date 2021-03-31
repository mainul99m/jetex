import 'package:flutter/material.dart';
import 'package:jetex_app/models/transaction_model.dart';
import 'package:jetex_app/ui/widgets/currency_text.dart';
import 'package:jetex_app/utils/color_palette.dart';
import 'package:jetex_app/utils/custom_icons_icons.dart';
import 'package:flutter/widgets.dart';

class ReferralTransactionSnap extends StatelessWidget {

  final Transaction transaction;

  const ReferralTransactionSnap({
    Key key,
    this.transaction
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25)
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  transaction.email,
                  style: TextStyle(
                      color: ColorPalette.mysticBlue,
                      fontFamily: 'HelveticaNeue',
                      fontSize: 15,
                      fontWeight: FontWeight.w700
                  ),
                  softWrap: true,
                ),
                SizedBox(width: 8,),
                Icon(
                  CustomIcons.email,
                  color: ColorPalette.sun,
                  size: 22,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                CurrencyText(
                  amount: transaction.amount,
                  isSmall: false,
                ),
                Text(
                  transaction.date,
                  style: TextStyle(
                    fontSize: 13,
                    fontFamily: 'helveticaNeue',
                    fontWeight: FontWeight.w700,
                    color: ColorPalette.mysticBlue,
                  ),
                ),
              ],
            )
          ],
        )


        /*
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(height: 14,),
                CurrencyText(
                  amount: transaction.amount,
                  isSmall: false,
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      transaction.email,
                      style: TextStyle(
                          color: ColorPalette.mysticBlue,
                          fontFamily: 'HelveticaNeue',
                          fontSize: 15,
                          fontWeight: FontWeight.w700
                      ),
                      softWrap: true,
                    ),
                    SizedBox(width: 8,),
                    Icon(
                      CustomIcons.email,
                      color: ColorPalette.sun,
                      size: 22,
                    )
                  ],
                ),
                SizedBox(height: 26,),
                Text(
                  transaction.date,
                  style: TextStyle(
                    fontSize: 13,
                    fontFamily: 'helveticaNeue',
                    fontWeight: FontWeight.w700,
                    color: ColorPalette.mysticBlue,
                  ),
                ),
              ],
            )
          ],
        ),

         */
      ),
    );
  }
}
