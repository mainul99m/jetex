//import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jetex_app/ui/screens/settings/setting_screen.dart';

class CustomAppbar extends StatelessWidget {

  final Widget leading;

  const CustomAppbar({
    Key key,
    this.leading
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(top: _size.height * 0.06),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          leading == null ? SizedBox(height: 1,) : leading,
          InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingScreen()),
              );
            },
            borderRadius: BorderRadius.circular(_size.height * 0.03),
            child: CircleAvatar(
              radius: _size.height * 0.03,
              backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=60'),
              /*
              CachedNetworkImageProvider(
                'https://i.pravatar.cc/150?img=60',
              ),
              */
            ),
          )
        ],
      ),
    );
  }
}
