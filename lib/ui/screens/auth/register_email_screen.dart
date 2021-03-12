import 'package:flutter/material.dart';
import 'package:jetex_app/ui/screens/auth/register_screen.dart';
import 'package:jetex_app/utils/color_palette.dart';
import 'package:jetex_app/ui/widgets/widgets.dart';
import 'package:jetex_app/utils/custom_icons_icons.dart';
import 'package:jetex_app/utils/string_extension.dart';


class RegisterEmailScreen extends StatelessWidget {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: _registerEmail(context),
    );
  }


  Widget _registerEmail(BuildContext context){
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
              'What\'s your\nemail\naddress?',
              style: TextStyle(
                letterSpacing: 0.0,
                color: Colors.white,
                fontFamily: 'HelveticaNeue',
                fontWeight: FontWeight.w700,
                fontSize: _size.height * 0.043,
              ),
            ),
          ),
          SizedBox(height: _size.height * 0.062,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: padding),
            child: CustomTextField(
              title: 'Your Email',
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
            ),
          ),

          SizedBox(height: _size.height * 0.03,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: padding),
            child: AuthButton(
              onPressed: (){
                _onGo(context);
              },
              color: ColorPalette.sun,
              height: _size.height * 0.055,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                      Icons.email,
                    size: 18,
                    color: Colors.white,
                  ),
                  SizedBox(width: 4,),
                  Text(
                    'Continue with Email',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'HelveticaNeue',
                        fontWeight: FontWeight.w700,
                        fontSize: _size.height * 0.02
                    ),
                  ),
                ],
              ),
            ),
          )

        ],
      ),
    );
  }

  void _onGo(BuildContext context){
    if(emailController.text.isValidEmail()){
      Navigator.push(context, MaterialPageRoute(builder: (context)=> RegisterScreen(
        email: emailController.text,
      )));
    } else{
      final snackBar = SnackBar(content: Text('Invalid email'));
      _scaffoldKey.currentState.showSnackBar(snackBar);
    }
  }
}
