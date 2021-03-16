import 'package:flutter/material.dart';
import 'package:jetex_app/ui/widgets/currency_text.dart';
import 'package:jetex_app/utils/color_palette.dart';
import 'package:jetex_app/utils/custom_icons_icons.dart';
import 'package:flutter/widgets.dart';

class ReferralTransactionSnap extends StatelessWidget {

  final String email;
  final String date;
  final double amount;

  const ReferralTransactionSnap({
    Key key,
    this.email,
    this.date,
    this.amount
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(height: 14,),
                CurrencyText(
                  amount: 20.1,
                  isSmall: false,
                )
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      email,
                      style: TextStyle(
                          color: ColorPalette.mysticBlue,
                          fontFamily: 'HelveticaNeue',
                          fontSize: 15,
                          fontWeight: FontWeight.w700
                      ),
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
                  date,
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
      ),
    );
    /*
    return Container(
      height: 100,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 26,vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //left
          Column(
            children: [
              SizedBox(height: 16,),
              CurrencyText(
                amount: amount,
              ),
            ],
          ),

          //Right
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    email,
                    style: TextStyle(
                        color: ColorPalette.mysticBlue,
                        fontFamily: 'HelveticaNeue',
                        fontSize: 15,
                        fontWeight: FontWeight.w700
                    ),
                  ),
                  SizedBox(width: 8,),
                  Icon(
                    CustomIcons.email,
                    color: ColorPalette.sun,
                    size: 22,
                  )
                ],
              ),
              Text(
                date,
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

      /*
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                email,
                style: TextStyle(
                  color: ColorPalette.darkGrey,
                  fontFamily: 'HelveticaNeue',
                  fontSize: 15,
                  fontWeight: FontWeight.w500
                ),
              ),
              SizedBox(width: 8,),
              Icon(
                CustomIcons.email,
                color: ColorPalette.sun,
                size: 22,
              )
            ],
          ),
          Container(
            //color: Colors.greenAccent,
            child: CurrencyText(
              amount: amount,
            ),
          ),
          Container(
            //color: Colors.redAccent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  date,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'helveticaNeue',
                    fontWeight: FontWeight.w500,
                    color: ColorPalette.darkGrey
                  ),
                ),
              ],
            ),
          )
        ],
      ),

      */
    );
    */
  }
}
