import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jetex_app/ui/widgets/widgets.dart';
import 'package:jetex_app/utils/color_palette.dart';
import 'package:jetex_app/utils/custom_icons_icons.dart';


class DeliverySnap extends StatelessWidget {

  final String deliveryId;
  final String imgURL;
  final double amount;
  final int status;

  const DeliverySnap({
    Key key,
    this.deliveryId,
    this.imgURL,
    this.amount,
    this.status
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.white
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  deliveryId,
                  style: TextStyle(
                      color: ColorPalette.mysticBlue,
                      fontFamily: 'HelveticaNeue',
                      fontWeight: FontWeight.w500,
                      fontSize: 14
                  ),
                ),
                SvgPicture.asset(
                  'assets/ui/logos/flo_logo.svg'
                )
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                CurrencyText(
                  amount: amount,
                  isSmall: true,
                ),
                _deliveryStatus()
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _deliveryStatus(){
    if(status == 1){
      return Row(
        children: [
          Container(
            height: 6,
            width: 6,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: ColorPalette.red
            ),
          ),
          SizedBox(width: 5,),
          Text(
            'In Warehouse',
            style: TextStyle(
                fontFamily: 'HelveticaNeue',
                fontWeight: FontWeight.w700,
                fontSize: 12,
                color: ColorPalette.darkGrey
            ),
          )
        ],
      );
    }

    if(status == 2){
      return Row(
        children: [
          Container(
            height: 6,
            width: 6,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: ColorPalette.green
            ),
          ),
          SizedBox(width: 5,),
          Text(
            'Delivered',
            style: TextStyle(
                fontFamily: 'HelveticaNeue',
                fontWeight: FontWeight.w700,
                fontSize: 12,
                color: ColorPalette.darkGrey
            ),
          )
        ],
      );
    }

    return Row(
      children: [
        Container(
          height: 6,
          width: 6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color: ColorPalette.sun
          ),
        ),
        SizedBox(width: 5,),
        Text(
          'Out for Delivery',
          style: TextStyle(
            fontFamily: 'HelveticaNeue',
            fontWeight: FontWeight.w700,
            fontSize: 12,
            color: ColorPalette.darkGrey
          ),
        )
      ],
    );
  }
}
