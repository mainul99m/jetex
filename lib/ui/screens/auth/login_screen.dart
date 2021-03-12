import 'package:flutter/material.dart';
import 'package:jetex_app/utils/color_palette.dart';
import 'package:jetex_app/ui/widgets/widgets.dart';
import 'package:jetex_app/utils/custom_icons_icons.dart';


class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _loginScreen(context),
    );
  }


  Widget _loginScreen(BuildContext context){
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: _size.height * 0.06,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: padding-20),
            child: SizedBox(
              width: 100,
              child: FlatButton(
                splashColor: Colors.transparent,
                // highlightColor: Colors.transparent,
                onPressed: (){
                  Navigator.of(context).pop();
                },
                child: Row(
                  children: [
                    RotatedBox(
                      quarterTurns: 1,
                      child: RotatedBox(
                        quarterTurns: 1,
                        child: Icon(
                            CustomIcons.circular_arrow_right,
                          color: ColorPalette.sun,
                          size: 18,
                        ),
                      ),
                    ),
                    SizedBox(width: 5,),
                    Text(
                      'Back',
                      style: TextStyle(
                          color: Colors.white,
                        fontFamily: 'HelveticaNeue'
                      ),
                    ),
                  ],
                )
              ),
            ),
          ),
          SizedBox(height: _size.height * 0.018,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: padding),
            child: Text(
              'Sign In',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'HelveticaNeue',
                fontWeight: FontWeight.w700,
                fontSize: _size.height * 0.044
              ),
            ),
          ),
          SizedBox(height: _size.height * 0.02,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: padding),
            child: Text(
              'Hesabınıza email və ya müştəri nömrəsi ilə \ndaxil ola bilərsiz.',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'HelveticaNeue',
                fontWeight: FontWeight.w500
              ),
            ),
          ),
          SizedBox(height: _size.height * 0.064,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: padding),
            child: CustomTextField(
              title: 'Your Email',
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          SizedBox(height: _size.height * 0.034,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: padding),
            child: CustomTextField(
              title: 'Your Password',
              obscureText: true,
            ),
          ),
          SizedBox(height: _size.height * 0.04,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: padding),
            child: AuthButton(
              onPressed: (){},
              color: ColorPalette.sun,
              height: _size.height * 0.055,
              child: Text(
                'Sign In',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'HelveticaNeue',
                  fontWeight: FontWeight.w700,
                  fontSize: _size.height * 0.02
                ),
              ),
            ),
          ),
          Center(
            child: MaterialButton(
              onPressed: (){},
              //splashColor: Colors.transparent,
              //highlightColor: Colors.transparent,
              height: _size.height * 0.01,
              child: Text(
                'Forgot Password?',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'HelveticaNeue',
                  letterSpacing: 0.01,
                  fontSize: _size.height * 0.014,
                  decoration: TextDecoration.underline
                ),
              ),
            ),
          )

        ],
      ),
    );
  }
}
