import 'package:flutter/material.dart';
import 'package:jetex_app/ui/screens/auth/register_email_screen.dart';
import 'package:jetex_app/ui/screens/auth/register_screen.dart';
import 'package:jetex_app/utils/app_localization.dart';
import 'package:jetex_app/utils/color_palette.dart';
import 'package:jetex_app/ui/widgets/widgets.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _welcomeScreen(context),
    );
  }


  Widget _welcomeScreen(BuildContext context){
    Size _size = MediaQuery.of(context).size;
    const double padding = 40.0;

    return Container(
      width: _size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [ColorPalette.lightPurple, ColorPalette.darkPurple]
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: _size.height * 0.04,),
          Center(
            child: SizedBox(
              height: _size.height * 0.435,
              child: Image.asset(
                'assets/ui/welcome_screen_artwork.png',
              ),
            ),
          ),
          SizedBox(height: _size.height * 0.015,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: padding),
            child: Text(
              'Your Online Shopping Assistant',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: _size.height * 0.017,
                fontFamily: 'HelveticaNeue'
              ),
            ),
          ),
          SizedBox(height: _size.height * 0.012,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: padding),
            child: Text(
              'Türkiyədən Sifariş edin, \nBiz çatdıraq!',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'HelveticaNeue',
                fontWeight: FontWeight.w500,
                fontSize: _size.height * 0.034,
                height: 1.4
              ),
            ),
          ),
          SizedBox(height: _size.height * 0.048,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: padding),
            child: AuthButton(
              color: ColorPalette.sun,
              height: _size.height * 0.055,
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
              },
              child: Text(
                'Sign In',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'HelveticaNeue',
                  fontSize: _size.height * 0.019,
                  letterSpacing: -.5,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          SizedBox(height: _size.height * 0.016,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: padding),
            child: AuthButton(
              color: Colors.white,
              height: _size.height * 0.055,
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> RegisterEmailScreen()));
              },
              child: Text(
                AppLocalizations.of(context).translate('register'),
                style: TextStyle(
                  color: ColorPalette.darkPurple,
                  fontFamily: 'HelveticaNeue',
                  fontSize: _size.height * 0.019,
                  letterSpacing: -.5,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          SizedBox(height: _size.height * 0.04,),
          Center(
            child: Text(
              '+994 12 493 46 17',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'HelveticaNeue',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(height: 2,),
          Center(
            child: Text(
              'info@jetex.az',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'HelveticaNeue',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
