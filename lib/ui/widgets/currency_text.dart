import 'package:flutter/material.dart';

class CurrencyText extends StatelessWidget {
  final double amount;

  const CurrencyText({
    Key key,
    this.amount
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isPositive = amount > 0.0;
    final int dollar = amount.floor();
    final int cent = ((amount - dollar.toDouble()) * 100).ceil();

    final Color color = isPositive ? Colors.green : Colors.redAccent;

    final TextStyle dollarStyle = TextStyle(
      color: color,
      fontFamily: 'HelveticaNeue',
      fontWeight: FontWeight.w500,
      fontSize: 44
    );

    final TextStyle centStyle = TextStyle(
      color: color,
      fontFamily: 'HelveticaNeue',
      fontWeight: FontWeight.w500,
      fontSize: 24
    );

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Text(
            isPositive ? '₼' : '-₼',
            style: centStyle
          ),
          SizedBox(width: 1,),
          Text(
            dollar.toString(),
            style: dollarStyle,
          ),
          SizedBox(width: 1,),
          Text(
              '.$cent',
              style: centStyle
          ),
        ],
      ),
    );
  }
}
