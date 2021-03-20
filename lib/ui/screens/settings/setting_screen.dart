import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jetex_app/ui/screens/settings/payment_methods_screen.dart';
import 'package:jetex_app/ui/widgets/widgets.dart';
import 'package:jetex_app/utils/color_palette.dart';
import 'package:jetex_app/utils/custom_icons_icons.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: ColorPalette.lightGrey,
        child: Column(
          children: [
            _appBar(size),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: _settingScreen(context, size),
            )
          ],
        ),
      ),
    );
  }

  Widget _appBar(Size size) {
    return Container(
      padding: EdgeInsets.fromLTRB(12, size.height * 0.05, 30, 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TopBackButton(
            width: 100,
            color: ColorPalette.darkGrey,
          ),
          SvgPicture.asset(
              'assets/ui/logos/jetex_logo.svg'
          )
        ],
      ),
    );
  }


  Widget _settingScreen(BuildContext context, Size size){
    return Column(
      children: [
        SizedBox(height: size.height * 0.025,),
        CircleAvatar(
          radius: size.height * 0.055,
          backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=60'),
        ),
        SizedBox(height: size.height * 0.02,),
        Text(
          'Jamil Alizada',
          style: TextStyle(
            fontSize: size.height * 0.021,
            fontFamily: 'HelveticaNeue',
            fontWeight: FontWeight.w500
          ),
        ),
        Opacity(
          opacity: 0.76,
          child: Text(
            'JTX-111750',
            style: TextStyle(
              fontSize: size.height * 0.017,
              fontFamily: 'HelveticaNeue',
              fontWeight: FontWeight.w400,
              color: ColorPalette.darkGrey
            ),
          ),
        ),
        SizedBox(height: size.height * 0.008,),
        FlatButton(
          onPressed: (){},
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100.0),
              side: BorderSide(
                color: ColorPalette.darkPurple,
                width: 2
              )
          ),
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(14, 11, 14, 11),
            child: Text(
              'View Profile',
              style: TextStyle(
                fontFamily: 'HelveticaNeue',
                fontSize: size.height * 0.015
              ),
            ),
          ),
        ),
        SizedBox(height: size.height * 0.034,),
        Opacity(
          opacity: 0.69,
          child: Text(
            'SETTINGS',
            style: TextStyle(
                fontSize: size.height * 0.013,
                fontFamily: 'HelveticaNeue',
                fontWeight: FontWeight.w700,
                color: ColorPalette.darkGrey
            ),
          ),
        ),
        SizedBox(height: size.height * 0.018,),
        SettingListViewSnap(
          leadingText: 'Language',
          trailingText: 'English',
          onTap: (){},
        ),
        SettingListViewSnap(
          leadingText: 'Payment Method',
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PaymentMethods()),
            );
          },
        ),
        SettingListViewSnap(
          leadingText: 'Change Password',
          onTap: (){},
        ),
        SettingNotificationListViewSnap(),
        SettingListViewSnap(
          leadingText: 'Contact Support',
          onTap: (){},
        ),
        SizedBox(height: size.height * 0.006,),
        SunButton(
          title: 'Log Out',
          onTap: (){},
        )
      ],
    );
  }



}
