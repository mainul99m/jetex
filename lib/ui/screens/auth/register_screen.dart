import 'package:flutter/material.dart';
import 'package:jetex_app/utils/color_pallete.dart';
import 'package:jetex_app/ui/widgets/widgets.dart';


class RegisterScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _registerScreen(context),
    );
  }


  Widget _registerScreen(BuildContext context){
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
              'Sign Up',
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
            child: Row(
              children: [
                Text(
                  'Using ',
                  style: TextStyle(
                    color: ColorPallete.transparentWhite,
                    fontSize: 14,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  'info@jetex.az ',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  'to sign up',
                  style: TextStyle(
                      color: ColorPallete.transparentWhite,
                      fontSize: 14,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 60,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: padding),
            child: CustomTextField(
              title: 'Your Full Name',
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: padding),
            child: CustomTextField(
              title: 'Your Password',
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: padding),
            child: CustomTextField(
              title: 'Repeat Your Password',
            ),
          ),

          SizedBox(height: 60,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: padding),
            child: AuthButton(
              onPressed: (){},
              color: ColorPallete.sun,
              child: Text(
                'Log In',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
