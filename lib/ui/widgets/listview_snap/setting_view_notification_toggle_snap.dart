import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:jetex_app/main.dart';
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
                  _setNotification(value);
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

  void _setNotification(bool value){
    if(value)
      scheduleAlarm();
    else
      deleteAlarm();
  }


  /// For dummy notification
  ///
  void scheduleAlarm() async {
    var scheduledNotificationDateTime = DateTime.now().add(Duration(minutes: 1));

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'alarm_notif',
      'alarm_notif',
      'Channel for Alarm notification',
      icon: 'jetex_logo',
      sound: RawResourceAndroidNotificationSound('notification'),
      largeIcon: DrawableResourceAndroidBitmap('jetex_logo'),
    );

    var iOSPlatformChannelSpecifics = IOSNotificationDetails(
        sound: 'a_long_cold_sting.wav',
        presentAlert: true,
        presentBadge: true,
        presentSound: true);
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics, iOS: iOSPlatformChannelSpecifics);

    // ignore: deprecated_member_use

    await flutterLocalNotificationsPlugin.show(0, 'Instant Notification', 'Shows instantly', NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics
    ));



    // ignore: deprecated_member_use
    await flutterLocalNotificationsPlugin.schedule(0, 'Jetex Title', 'Your Order is ready',
        scheduledNotificationDateTime, platformChannelSpecifics);
  }



  void deleteAlarm() async{
    await flutterLocalNotificationsPlugin.cancel(0);
  }
}
