import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jetex_app/utils/color_palette.dart';

class SettingNotificationListViewSnap extends StatefulWidget {
  @override
  _SettingNotificationListViewSnapState createState() => _SettingNotificationListViewSnapState();
}

class _SettingNotificationListViewSnapState extends State<SettingNotificationListViewSnap> {

  bool _value = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
              'Notification',
              style: TextStyle(
                  fontSize: size.height * 0.018,
                  fontFamily: 'HelveticaNeue',
                  fontWeight: FontWeight.w700,
                  color: ColorPalette.darkPurple
              ),
            ),
            Transform.scale(
              scale: 0.8,
              alignment: Alignment.centerRight,
              child: CupertinoSwitch(
                value: _value,
                activeColor: ColorPalette.sun,
                onChanged: (value){
                  setState(() {
                    _value = value;
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
