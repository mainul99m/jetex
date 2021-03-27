import 'package:flutter/material.dart';
import 'package:jetex_app/utils/color_palette.dart';

class  SelectedTLBalanceCard extends StatelessWidget {

  final bool hasShadow;

  const SelectedTLBalanceCard({
    Key key,
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
              'assets/ui/blur_tl.png',
              height: size.height * 0.17,
              fit: BoxFit.cover,
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
                  'Paying Via TL Balance',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'HelveticaNeue',
                      fontSize: 15,
                      fontWeight: FontWeight.w400
                  ),
                ),
              )
            ],
          ),

        ],
      ),
    );
  }
}
