import 'package:flutter/material.dart';
import 'package:jetex_app/utils/color_palette.dart';

class LinkSnap extends StatelessWidget {
  final String link;
  final int index;
  final void Function(int) onTap;

  const LinkSnap({
    Key key,
    this.link,
    this.index,
    this.onTap
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            link,
            style: TextStyle(
              color: ColorPalette.darkPurple,
              fontFamily: 'HelveticaNeue',
            ),
          ),
          Material(
            child: InkWell(
              onTap: (){
                onTap(index);
              },
              borderRadius: BorderRadius.circular(10),
              child: Icon(
                Icons.remove_circle,
                color: ColorPalette.sun,
                size: 20,
              ),
            ),
          )
        ],
      ),
    );
  }
}
