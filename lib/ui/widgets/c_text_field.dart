import 'package:flutter/material.dart';
import 'package:jetex_app/utils/color_palette.dart';


class CustomTextField extends StatelessWidget {

  final String title;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final Color cursorColor;

  const CustomTextField({Key key,
    @required
    this.title,
    this.controller,
    this.keyboardType,
    this.obscureText,
    this.cursorColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.toUpperCase(),
          style: TextStyle(
            letterSpacing: 0.0,
              color: ColorPalette.transparentWhite,
              fontFamily: 'HelveticaNeue',
              fontWeight: FontWeight.w900,
              fontSize: _height * 0.0115,
          ),
        ),
        TextField(
          controller: controller,
          obscureText: obscureText==null ? false : obscureText,
          keyboardType: keyboardType,
          cursorColor: cursorColor == null? Colors.white : cursorColor,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'HelveticaNeue',
            fontWeight: FontWeight.w500,
            fontSize: _height * 0.018
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(12, _height * .018, 12, _height * .014),
            isDense: true,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: ColorPalette.transparentWhite),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: ColorPalette.transparentWhite),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: ColorPalette.transparentWhite),
            ),
          ),
        ),
      ],
    );
  }
}
