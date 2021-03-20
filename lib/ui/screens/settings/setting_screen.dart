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
      padding: EdgeInsets.fromLTRB(12, size.height * 0.033, 30, 6),
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
        CircleAvatar(
          radius: size.height * 0.05,
          backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=60'),
        ),
        SizedBox(height: size.height * 0.01,),
        Text(
          'Jamil Alizada',
          style: TextStyle(
            fontSize: size.height * 0.024,
            fontFamily: 'HelveticaNeue',
            fontWeight: FontWeight.w500
          ),
        ),
        Opacity(
          opacity: 0.76,
          child: Text(
            'JTX-111750',
            style: TextStyle(
              fontSize: size.height * 0.018,
              fontFamily: 'HelveticaNeue',
              fontWeight: FontWeight.w400,
              color: ColorPalette.darkGrey
            ),
          ),
        ),
        SizedBox(height: 10,),
        FlatButton(
          onPressed: (){},
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(
                color: ColorPalette.darkPurple,
                width: 2
              )
          ),
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 5, 12, 5),
            child: Text(
              'View Profile',
              style: TextStyle(
                fontFamily: 'HelveticaNeue',
                fontSize: size.height * 0.015
              ),
            ),
          ),
        ),
        SizedBox(height: 30,),
        Opacity(
          opacity: 0.69,
          child: Text(
            'SETTINGS',
            style: TextStyle(
                fontSize: size.height * 0.014,
                fontFamily: 'HelveticaNeue',
                fontWeight: FontWeight.w700,
                color: ColorPalette.darkGrey
            ),
          ),
        ),
        SizedBox(height: 15,),
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
        SunButton(
          title: 'Log Out',
          onTap: (){},
        )
      ],
    );
  }



}
