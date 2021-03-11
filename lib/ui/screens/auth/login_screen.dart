import 'package:flutter/material.dart';
import 'package:jetex_app/utils/color_pallete.dart';

class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _loginScreen(context),
    );
  }


  Widget _loginScreen(BuildContext context){
    Size _size = MediaQuery.of(context).size;
    const double padding = 32.0;

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20,),
          SizedBox(
            width: 100,
            child: FlatButton(
              onPressed: (){},
              child: Row(
                children: [
                  Text(
                    'Back',
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                ],
              )
            ),
          ),
          SizedBox(height: 26,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: padding),
            child: Text(
              'Sign In',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30
              ),
            ),
          ),
          SizedBox(height: 16,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: padding),
            child: Text(
              'Hesabınıza email və ya müştəri nömrəsi ilə \ndaxil ola bilərsiz.',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          SizedBox(height: 40,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: padding),
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
