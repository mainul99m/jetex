import 'package:flutter/material.dart';
import 'package:jetex_app/utils/color_palette.dart';


class CustomTextField extends StatelessWidget {

  final String title;
  final bool isAuth;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool readOnly;

  const CustomTextField({Key key,
    @required
    this.title,
    this.isAuth = true,
    this.controller,
    this.keyboardType,
    this.obscureText,
    this.readOnly = false
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
              color: isAuth ? ColorPalette.transparentWhite : ColorPalette.sun,
              fontFamily: 'HelveticaNeue',
              fontWeight: isAuth ? FontWeight.w500 : FontWeight.w700,
              fontSize: isAuth ? _height * 0.0115 : _height * 0.014,
          ),
        ),
        TextField(
          controller: controller,
          keyboardAppearance: Brightness.light,
          readOnly: readOnly,
          obscureText: obscureText==null ? false : obscureText,
          keyboardType: keyboardType,
          cursorColor: isAuth ? Colors.white : ColorPalette.darkPurple,
          style: TextStyle(
            color: isAuth ? Colors.white : ColorPalette.darkPurple,
            fontFamily: 'HelveticaNeue',
            fontWeight: FontWeight.w500,
            fontSize: _height * 0.018
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(12, _height * .018, 12, _height * .014),
            isDense: true,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: isAuth ? ColorPalette.transparentWhite : Colors.grey
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: isAuth ? ColorPalette.transparentWhite : Colors.grey
              ),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: isAuth ? ColorPalette.transparentWhite : Colors.grey
              ),
            ),
          ),
        ),
      ],
    );
  }
}
