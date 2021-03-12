import 'package:flutter/material.dart';
import 'package:jetex_app/utils/color_palette.dart';
import 'package:jetex_app/utils/custom_icons_icons.dart';

class BnbItem extends StatelessWidget {

  final IconData iconData;
  final VoidCallback onTap;
  final int index;
  final int selectedItemIdex;

  const BnbItem({
    Key key,
    this.iconData,
    this.onTap,
    this.index,
    this.selectedItemIdex
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: _size.width * 0.13,
        width: _size.width * 0.2,
        child: Stack(
          children: [
            Center(
              child: Container(
                height: _size.width * 0.13,
                width: _size.width * 0.125,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(_size.width * 0.035),
                    color: index == selectedItemIdex ? ColorPalette.sun : Colors.white
                ),
              ),
            ),
            Center(
                child: Icon(
                  iconData,
                  color: index == selectedItemIdex ? Colors.white : Colors.black,
                  size: _size.width * 0.05,
                )
            )
          ],
        ),
      ),
    );
  }
}
