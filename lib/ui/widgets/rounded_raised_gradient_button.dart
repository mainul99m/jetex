import 'package:flutter/material.dart';
import 'package:jetex_app/utils/color_palette.dart';
import 'package:jetex_app/utils/custom_icons_icons.dart';

class RRGradientButton extends StatelessWidget {

  final Gradient gradient;
  final VoidCallback onTap;
  final String text;
  final double height;
  final double width;
  final Color color;

  const RRGradientButton({
    Key key,
    this.gradient,
    this.onTap,
    @required this.text,
    @required this.height,
    @required this.width,
    this.color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 0,
      padding: const EdgeInsets.all(0.0),
      child: Ink(
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        child: Container(
          height: height == null ? 70 : height,
          width: width == null ? 100 : width,
          alignment: Alignment.center,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: height * 0.5,
                width: height * 0.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(height * 0.21),
                  color: Colors.white
                ),
                child: Icon(
                  CustomIcons.add,
                  color: color,
                ),
              ),
              SizedBox(width: width * 0.08,),
              Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'HelveticaNeue',
                  fontWeight: FontWeight.w700
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}
