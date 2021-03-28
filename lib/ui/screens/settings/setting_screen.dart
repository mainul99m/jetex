import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jetex_app/ui/screens/settings/payment_methods_screen.dart';
import 'package:jetex_app/ui/screens/settings/profile_screen.dart';
import 'package:jetex_app/ui/widgets/widgets.dart';
import 'package:jetex_app/utils/app_language.dart';
import 'package:jetex_app/utils/app_localization.dart';
import 'package:jetex_app/utils/color_palette.dart';
import 'package:jetex_app/utils/custom_icons_icons.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {

  String _selectedLanguage;
  AppLanguage appLanguage;

  // Map<String, String> languages = {
  //   'English' : 'en',
  //   'Turkish' : 'tr'
  // };
  //
  List<String> languages = ['English', 'Turkish'];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    appLanguage = Provider.of<AppLanguage>(context);
    _selectedLanguage = _getSelectedLanguage();
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
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            );
          },
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
            AppLocalizations.of(context).translate('Settings'),
            style: TextStyle(
                fontSize: size.height * 0.013,
                fontFamily: 'HelveticaNeue',
                fontWeight: FontWeight.w700,
                color: ColorPalette.darkGrey
            ),
          ),
        ),
        SizedBox(height: size.height * 0.018,),

        _languageSelection(size),
        /*
        SettingListViewSnap(
          leadingText: 'Language',
          trailingText: 'English',
          onTap: (){},
        ),

         */
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

  Widget _languageSelection(Size size){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        height: size.height * 0.066,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppLocalizations.of(context).translate('Language'),
              style: TextStyle(
                  fontSize: size.height * 0.018,
                  fontFamily: 'HelveticaNeue',
                  fontWeight: FontWeight.w700,
                  color: ColorPalette.darkPurple
              ),
            ),
            DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: _selectedLanguage,
                style:  TextStyle(
                    fontSize: size.height * 0.015,
                    fontFamily: 'HelveticaNeue',
                    fontWeight: FontWeight.w700,
                    color: ColorPalette.darkGrey,
                ),
                icon: Icon(
                  CustomIcons.circular_arrow_right,
                  color: ColorPalette.sun,
                  size: size.height * 0.018,
                ),
                onChanged: (value){
                  _changeLanguage(value);
                },
                items: languages.map<DropdownMenuItem<String>>((String value){
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _changeLanguage(String value){
    String shortLan = '';
    switch(value){
      case 'English': {
        shortLan = 'en';
      }
      break;
      case 'Turkish': {
        shortLan = 'tr';
      }
      break;
    }

    setState(() {
      _selectedLanguage = value;
    });
    appLanguage.changeLanguage(Locale(shortLan));
  }


  //Get the selected language
  String _getSelectedLanguage(){
    if(appLanguage.appLocal == Locale('tr'))
      return 'Turkish';
    if(appLanguage.appLocal == Locale('en'))
      return 'English';
    return 'Unknown';
  }
}
