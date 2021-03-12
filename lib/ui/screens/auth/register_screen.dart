import 'package:flutter/material.dart';
import 'package:jetex_app/utils/color_pallete.dart';
import 'package:jetex_app/ui/widgets/widgets.dart';
import 'package:jetex_app/utils/custom_icons_icons.dart';


class RegisterScreen extends StatelessWidget {

  final String email;

  const RegisterScreen({
    Key key,
    this.email
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _registerScreen(context),
    );
  }


  Widget _registerScreen(BuildContext context){
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
                            color: ColorPallete.sun,
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
              'Sign Up',
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
            child: Row(
              children: [
                Text(
                  'Using ',
                  style: TextStyle(
                    color: ColorPallete.transparentWhite,
                    fontSize: _size.height * 0.018,
                    fontFamily: 'HelveticaNeue',
                    fontWeight: FontWeight.w500
                  ),
                ),
                Text(
                  email == null ? 'info@jetex.az' : email,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: _size.height * 0.018,
                      fontFamily: 'HelveticaNeue',
                      fontWeight: FontWeight.w700
                  ),
                ),
                Text(
                  ' to sign up',
                  style: TextStyle(
                      color: ColorPallete.transparentWhite,
                      fontSize: _size.height * 0.018,
                      fontFamily: 'HelveticaNeue',
                      fontWeight: FontWeight.w500
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: _size.height * 0.03,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: padding),
            child: CustomTextField(
              title: 'Your Full Name',
              keyboardType: TextInputType.name,
            ),
          ),
          SizedBox(height: _size.height * 0.037,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: padding),
            child: CustomTextField(
              title: 'Your Password',
              obscureText: true,
            ),
          ),
          SizedBox(height: _size.height * 0.037,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: padding),
            child: CustomTextField(
              title: 'Repeat Your Password',
              obscureText: true,
            ),
          ),
          SizedBox(height: _size.height * 0.025,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: padding),
            child: AuthButton(
              onPressed: (){},
              color: ColorPallete.sun,
              child: Text(
                'Log In',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'HelveticaNeue',
                    fontWeight: FontWeight.w700,
                    fontSize: _size.height * 0.02
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
