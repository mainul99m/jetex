import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jetex_app/models/credit_card_model.dart';
import 'package:jetex_app/utils/color_palette.dart';
class CreditCardSnap extends StatelessWidget {

  final CreditCard creditCard;
  final double height;
  final bool hasShadow;

  const CreditCardSnap({
    Key key,
    @required this.creditCard,
    this.height = 160,
    this.hasShadow = false
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Gradient gradient = _getGradientFromCardType(creditCard.type);
    String url = _getCardLogoLink(creditCard.type);
    return Container(
      padding: EdgeInsets.fromLTRB(26, 20, 26, 26),
      height: height,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: hasShadow ? Colors.grey[500] : Colors.transparent,
            blurRadius: 5,
            offset: Offset(2, 2)
          )
        ]
      ),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  creditCard.number,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Helvetica Neue',
                      fontWeight: FontWeight.w500,
                      fontSize: 16
                  ),
                ),
                SizedBox(height: 10,),
                Text(
                  creditCard.name,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Helvetica Neue',
                      fontWeight: FontWeight.w500,
                      fontSize: 16
                  ),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.network(
                  url,
                  width: 50,
                ),
                Text(
                  creditCard.expirationDate,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Helvetica Neue',
                      fontWeight: FontWeight.w500,
                      fontSize: 16
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }

  String _getCardLogoLink(String cardType){
    if(cardType == 'm')
      return 'https://upload.wikimedia.org/wikipedia/commons/2/2a/Mastercard-logo.svg';
    return 'https://upload.wikimedia.org/wikipedia/commons/5/5e/Visa_Inc._logo.svg';
  }

  Gradient _getGradientFromCardType(String cardType){
    if(cardType == 'm'){
      return ColorPalette.mastercardGradient;
    }
    return ColorPalette.visaGradient;
  }
}
