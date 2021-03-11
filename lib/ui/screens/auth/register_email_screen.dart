import 'package:flutter/material.dart';
import 'package:jetex_app/ui/screens/auth/register_screen.dart';
import 'package:jetex_app/utils/color_pallete.dart';
import 'package:jetex_app/ui/widgets/widgets.dart';


class RegisterEmailScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _registerEmail(context),
    );
  }


  Widget _registerEmail(BuildContext context){
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
              'What\'s your\nemail\naddress',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 34
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

          SizedBox(height: 30,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: padding),
            child: AuthButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> RegisterScreen()));
              },
              color: ColorPallete.sun,
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
                        fontWeight: FontWeight.bold,
                        fontSize: 16
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
}
