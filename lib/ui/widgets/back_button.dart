import 'package:flutter/material.dart';
import 'package:jetex_app/utils/color_palette.dart';
import 'package:jetex_app/utils/custom_icons_icons.dart';

class TopBackButton extends StatelessWidget {
  final double width;
  final Color color;

  const TopBackButton({
    Key key,
    this.width,
    this.color = Colors.white
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: FlatButton(
          splashColor: Colors.transparent,
          // highlightColor: Colors.transparent,
          onPressed: (){
            Navigator.of(context).pop();
          },
          child: Row(
            children: [
              RotatedBox(
                quarterTurns: 1,
                child: RotatedBox(
                  quarterTurns: 1,
                  child: Icon(
                    CustomIcons.circular_arrow_right,
                    color: ColorPalette.sun,
                    size: 18,
                  ),
                ),
              ),
              SizedBox(width: 5,),
              Text(
                'Back',
                style: TextStyle(
                    color: color,
                    fontFamily: 'HelveticaNeue'
                ),
              ),
            ],
          )
      ),
    );
  }
}
