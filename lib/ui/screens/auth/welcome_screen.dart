import 'package:flutter/material.dart';
import 'package:jetex_app/utils/color_pallete.dart';
import 'package:jetex_app/ui/widgets/widgets.dart';

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
            colors: [ColorPallete.LightPurple, ColorPallete.DarkPurple]
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 45,),
          Center(
            child: SizedBox(
              width: _size.width - padding*2,
              child: Image.asset(
                'assets/ui/welcome_screen_artwork.png',
              ),
            ),
          ),
          SizedBox(height: 8,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: padding),
            child: Text(
              'Your Online Shopping Assistant',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12
              ),
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: padding),
            child: Text(
              'Türkiyədən Sifariş edin, \nBiz çatdıraq!',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                fontSize: 26
              ),
            ),
          ),
          SizedBox(height: 44,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: padding),
            child: AuthButton(
              color: ColorPallete.sun,
              onPressed: (){},
              child: Text(
                'Sign In',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          SizedBox(height: 12,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: padding),
            child: AuthButton(
              color: Colors.white,
              onPressed: (){},
              child: Text(
                  'Register',
                style: TextStyle(
                    color: ColorPallete.DarkPurple,
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          SizedBox(height: 42,),
          Center(
            child: Text(
              '+994 12 493 46 17',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 2,),
          Center(
            child: Text(
              'info@jetex.az',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
