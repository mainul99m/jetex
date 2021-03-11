import 'package:flutter/material.dart';
import 'package:jetex_app/utils/color_pallete.dart';
import 'package:jetex_app/ui/widgets/widgets.dart';


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
          SizedBox(height: 40,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: padding-20),
            child: SizedBox(
              width: 100,
              child: FlatButton(
                splashColor: Colors.transparent,
                // highlightColor: Colors.transparent,
                onPressed: (){
                  print('working');
                  Navigator.of(context).pop();
                },
                child: Row(
                  children: [
                    RotatedBox(
                      quarterTurns: 1,
                      child: Icon(
                          Icons.arrow_drop_down_circle,
                        color: ColorPallete.sun,
                        size: 18,
                      ),
                    ),
                    SizedBox(width: 4,),
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
          SizedBox(height: 60,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: padding),
            child: CustomTextField(
              title: 'Your Email',
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: padding),
            child: CustomTextField(
              title: 'Your Password',
            ),
          ),

          SizedBox(height: 60,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: padding),
            child: AuthButton(
              onPressed: (){},
              color: ColorPallete.sun,
              child: Text(
                'Sign In',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16
                ),
              ),
            ),
          ),
          SizedBox(height: 14,),
          Center(
            child: MaterialButton(
              onPressed: (){},
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Text(
                'Forgot Password?',
                style: TextStyle(
                  color: Colors.white,
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
