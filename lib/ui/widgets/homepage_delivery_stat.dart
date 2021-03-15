import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jetex_app/utils/color_palette.dart';
import 'package:jetex_app/utils/custom_icons_icons.dart';

class HomePageDeliveryStat extends StatelessWidget {
  final String leadingImagePath;
  final String title;
  final int count;

  const HomePageDeliveryStat({
    Key key,
    @required this.leadingImagePath,
    this.title,
    this.count
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    final Widget svgIcon = SvgPicture.asset(
      leadingImagePath,
      height: 30,
    );
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15)
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                svgIcon,
                SizedBox(width: 14,),
                Text(
                  title,
                  style: TextStyle(
                      fontFamily: 'HelveticaNeue',
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0,
                      fontSize: 15
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  count.toString(),
                  style: TextStyle(
                    color: ColorPalette.sun,
                    fontFamily: 'HelveticaNeue',
                    fontWeight: FontWeight.w900,
                    fontSize: 20
                  ),
                ),
                SizedBox(width: 10,),
                Icon(
                  CustomIcons.circular_arrow_right,
                  size: 14,
                  color: ColorPalette.sun,
                ),
                SizedBox(width: 4,)
              ],
            )
          ],
        ),
      ),
    );
  }
}
