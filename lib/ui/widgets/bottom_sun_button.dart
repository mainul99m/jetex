import 'package:flutter/material.dart';
import 'package:jetex_app/utils/color_palette.dart';

class SunButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const SunButton({
    Key key,
    this.title = '',
    this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: size.height * 0.067,
          width: double.infinity,
          decoration: BoxDecoration(
            color: ColorPalette.sun,
            borderRadius: BorderRadius.circular(20)
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'HelveticaNeue',
                fontWeight: FontWeight.w700,
                fontSize: size.height * 0.019
              ),
            ),
          ),
        ),
      ),
    );
  }
}
