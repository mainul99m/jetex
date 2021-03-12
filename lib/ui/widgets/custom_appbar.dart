import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jetex_app/utils/color_palette.dart';

class CustomAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(top: _size.height * 0.06),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image(
                height: _size.height * 0.027,
                image: AssetImage(
                    'assets/ui/icons/flag.png'
                ),
              ),
              SizedBox(width: 8,),
              Text(
                'Address',
                style: TextStyle(
                    fontFamily: 'HelveticaNeue',
                    fontWeight: FontWeight.w700,
                    fontSize: _size.height * .022,
                    letterSpacing: 0,
                    color: ColorPalette.darkPurple
                ),
              ),
            ],
          ),
          CircleAvatar(
            radius: _size.height * 0.03,
            backgroundImage: CachedNetworkImageProvider(
              'https://i.pravatar.cc/150?img=60',
            ),
          )
        ],
      ),
    );
  }
}
