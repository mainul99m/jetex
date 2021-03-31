import 'package:flutter/material.dart';

class CurrencyText extends StatelessWidget {
  final double amount;
  final bool isSmall;

  const CurrencyText({
    Key key,
    this.amount,
    this.isSmall
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isPositive = amount > 0.0;
    final double _amount = isPositive ? amount : (-1 * amount);
    final int dollar = _amount.floor();
    final int cent = ((_amount - dollar.toDouble()) * 100).ceil();

    final Color color = isPositive ? Colors.green : Colors.redAccent;

    final TextStyle dollarStyle = TextStyle(
      color: color,
      fontFamily: 'HelveticaNeue',
      fontWeight: FontWeight.w500,
      fontSize: isSmall ? 32 : 44
    );

    final TextStyle centStyle = TextStyle(
      color: color,
      fontFamily: 'HelveticaNeue',
      fontWeight: FontWeight.w500,
      fontSize: isSmall ? 18 : 24
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
          SizedBox(width: isSmall ? 0 : 1,),
          Text(
            dollar.toString(),
            style: dollarStyle,
          ),
          SizedBox(width: 1,),
          Text(
              cent == 0 ? '.00':'.$cent',
              style: centStyle
          ),
        ],
      ),
    );
  }
}
