import 'package:flutter/material.dart';
import 'package:jetex_app/utils/color_palette.dart';
import 'package:jetex_app/utils/custom_icons_icons.dart';

class SettingListViewSnap extends StatelessWidget {

  final String leadingText;
  final String trailingText;
  final VoidCallback onTap;

  const SettingListViewSnap({
    Key key,
    @required this.leadingText,
    this.trailingText = '',
    this.onTap
  }) : super(key: key);




  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: InkWell(
        onTap: onTap,
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
                leadingText,
                style: TextStyle(
                    fontSize: size.height * 0.018,
                    fontFamily: 'HelveticaNeue',
                    fontWeight: FontWeight.w700,
                    color: ColorPalette.darkPurple
                ),
              ),
              Row(
                children: [
                  Opacity(
                    opacity: 0.7,
                    child: Text(
                      trailingText,
                      style: TextStyle(
                          fontSize: size.height * 0.015,
                          fontFamily: 'HelveticaNeue',
                          fontWeight: FontWeight.w700,
                          color: ColorPalette.darkGrey
                      ),
                    ),
                  ),
                  SizedBox(width: 12,),
                  Icon(
                    CustomIcons.circular_arrow_right,
                    color: ColorPalette.sun,
                    size: size.height * 0.018,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
