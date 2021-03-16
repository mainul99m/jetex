import 'package:flutter/material.dart';
import 'package:jetex_app/ui/widgets/dot_indicator//dots_indicator.dart';
import 'package:jetex_app/utils/color_palette.dart';
import 'package:jetex_app/utils/custom_icons_icons.dart';

class OrderViewButton extends StatelessWidget {

  final VoidCallback onTap;
  final String title;
  final double height;

  const OrderViewButton({
    Key key,
    this.onTap,
    this.title,
    this.height
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(22),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        height: height,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(22)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                  color: ColorPalette.darkPurple,
                  fontFamily: 'HelveticaNeue',
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  letterSpacing: 0
              ),
            ),
            Icon(
              CustomIcons.circular_arrow_right,
              size: 16,
              color: ColorPalette.sun,
            )
          ],
        ),
      ),
    );
  }
}
