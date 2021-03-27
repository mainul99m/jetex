import 'package:flutter/material.dart';
import 'package:jetex_app/utils/color_palette.dart';

class SummeryRow extends StatelessWidget {
  final String leading;
  final String trailing;

  const SummeryRow({
    Key key,
    @required this.leading,
    @required this.trailing
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            leading,
            style: TextStyle(
              fontFamily: 'HelveticaNeue',
              fontWeight: FontWeight.w700,
              fontSize: 13,
              color: ColorPalette.darkPurple
            ),
          ),
          Text(
            trailing,
            style: TextStyle(
                fontFamily: 'HelveticaNeue',
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: ColorPalette.mysticBlue
            ),
          )
        ],
      ),
    );
  }
}
