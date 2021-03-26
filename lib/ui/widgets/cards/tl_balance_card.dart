import 'package:flutter/material.dart';
import 'package:jetex_app/utils/color_palette.dart';

class  TLBalanceCard extends StatelessWidget {

  final double balance;
  final bool hasShadow;

  const TLBalanceCard({
    Key key,
    this.balance,
    this.hasShadow = false
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.17,
      width: 200,
      decoration: BoxDecoration(
          gradient: ColorPalette.darkPurpleGradient,
          borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: hasShadow ? Colors.grey[300] : Colors.transparent,
            offset: Offset(4,2),
            blurRadius: 6
          )
        ]
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.asset(
              'assets/ui/buildings.png',
              width: double.infinity,
              height: size.height * 0.17,
              fit: BoxFit.fitWidth,
              alignment: Alignment.bottomCenter,
            ),
          ),

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 2,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      '786.84',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'HelveticaNeue',
                          fontWeight: FontWeight.w300,
                          fontSize: size.height * 0.046
                      ),
                    ),
                    SizedBox(width: 3,),
                    Text(
                      'TL',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'HelveticaNeue',
                          fontWeight: FontWeight.w500,
                          fontSize: 20
                      ),
                    )
                  ],
                ),
                SizedBox(height: 2,),
                Text(
                  'TL Balance',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'HelveticaNeue',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      letterSpacing: 0
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
