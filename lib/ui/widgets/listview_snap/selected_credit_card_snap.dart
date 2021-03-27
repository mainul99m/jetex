import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jetex_app/models/credit_card_model.dart';
import 'package:jetex_app/utils/color_palette.dart';
import 'package:jetex_app/utils/custom_icons_icons.dart';

class SelectedCreditCardSnap extends StatelessWidget {

  final CreditCard creditCard;
  final double height;
  final bool hasShadow;

  const SelectedCreditCardSnap({
    Key key,
    @required this.creditCard,
    this.height = 160,
    this.hasShadow = false
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    String loc = _getCardLogoLoc(creditCard.type);
    return Container(
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
                color: hasShadow ? Colors.grey[500] : Colors.transparent,
                blurRadius: 5,
                offset: Offset(2, 2)
            )
          ]
      ),
      child: Stack(
        children: [
          /*
          ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              padding: EdgeInsets.fromLTRB(26, 20, 26, 26),
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
            ),
          ),
          */
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.asset(
              loc,
              fit: BoxFit.cover,
              height: height,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle_outline,
                color: Colors.white,
                size: 44,
              ),
              SizedBox(height: 10,),
              Center(
                child: Text(
                  'Paying Via ' + creditCard.type + ' ' + creditCard.number,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'HelveticaNeue',
                    fontSize: 15,
                    fontWeight: FontWeight.w400
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  String _getCardLogoLoc(String cardType){
    if(cardType == 'MasterCard')
      return 'assets/ui/blur_mastercard.png';
    return 'assets/ui/blur_visa.png';
  }

}
