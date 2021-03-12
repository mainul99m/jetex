import 'package:flutter/material.dart';
import 'package:jetex_app/utils/color_palette.dart';
import 'package:jetex_app/ui/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Size _size = MediaQuery.of(context).size;

    Gradient _gradient = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [ColorPalette.lightPurple, ColorPalette.darkPurple]
    );

    return Scaffold(
      backgroundColor: ColorPalette.lightGrey,
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppbar(
                leading: Text(
                  'Dashboard',
                  style: TextStyle(
                      fontFamily: 'HelveticaNeue',
                      fontWeight: FontWeight.w700,
                      fontSize: _size.height * .022,
                      letterSpacing: 0,
                      color: ColorPalette.darkPurple
                  ),
                ),
              ),
              SizedBox(height: _size.height * .004,),
              Text(
                'Hello, \nJamil Alizada 👋',
                style: TextStyle(
                    fontFamily: 'HelveticaNeue',
                    fontWeight: FontWeight.w700,
                    fontSize: _size.height * .037,
                    letterSpacing: 0,
                    color: ColorPalette.darkPurple,
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: _size.height * .023,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RRGradientButton(
                    onTap: (){},
                    gradient: _gradient,
                    height: _size.height * 0.06,
                    width: _size.width * 0.39,
                    text: 'New Order',
                    color: ColorPalette.darkPurple,
                  ),
                  RRGradientButton(
                    onTap: (){},
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [ColorPalette.sun, ColorPalette.sun]
                    ),
                    height: _size.height * 0.06,
                    width: _size.width * 0.39,
                    text: 'Declare',
                    color: ColorPalette.sun,
                  ),
                ],
              ),
              SizedBox(height: _size.height * 0.033,),
              Container(
                height: _size.height * 0.162,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: _gradient,
                  borderRadius: BorderRadius.circular(25)
                ),
              )
            ],
          )
      ),
    );
  }
}
