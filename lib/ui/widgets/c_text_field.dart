import 'package:flutter/material.dart';
import 'package:jetex_app/utils/color_pallete.dart';


class CustomTextField extends StatelessWidget {

  final String title;

  const CustomTextField({Key key, @required  this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.toUpperCase(),
          style: TextStyle(
              color: ColorPallete.transparentWhite,
              fontWeight: FontWeight.bold,
              fontSize: 12
          ),
        ),
        TextField(
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
