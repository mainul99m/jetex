import 'dart:math';
import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jetex_app/models/order_model.dart';
import 'package:jetex_app/ui/widgets/widgets.dart';
import 'package:jetex_app/utils/color_palette.dart';
import 'package:jetex_app/utils/custom_icons_icons.dart';


class ExpandableOrderSnap extends StatefulWidget {

  final Order order;

  const ExpandableOrderSnap({
    Key key,
    this.order
  }) : super(key: key);


  @override
  _ExpandableOrderSnapState createState() => _ExpandableOrderSnapState();
}

class _ExpandableOrderSnapState extends State<ExpandableOrderSnap> {

  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    const EdgeInsetsGeometry _expandableElementPadding = EdgeInsets.symmetric(
      horizontal: 30,
      vertical: 8
    );
    const TextStyle _headerTextStyle = TextStyle(
        fontFamily: 'HelveticaNeue',
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: ColorPalette.darkPurple
    );
    const TextStyle _dataTextStyle = TextStyle(
        fontFamily: 'HelveticaNeue',
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: ColorPalette.darkGrey
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          color: Colors.white,
          child: ExpansionCard(
            leading: SvgPicture.asset(
                _getLogoUrl(),
            ),
            trailing: Container(
              width: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    widget.order.trackingId,
                    style: TextStyle(
                      fontFamily: 'HelveticaNeue',
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: ColorPalette.mysticBlue
                    ),
                  ),
                  SizedBox(width: 20,),
                  Transform.rotate(
                    angle: isExpanded ? 3 * pi / 2 : pi / 2,
                    child: Center(
                      child: Icon(
                        CustomIcons.circular_arrow_right,
                        color: isExpanded ? ColorPalette.red : ColorPalette.green,
                        size: 16,
                      ),
                    ),
                  )
                ],
              ),
            ),
            borderRadius: 40,
            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
            backgroundColor: Colors.white,
            title: null,
            onExpansionChanged: (value){
              setState(() {
                isExpanded = value;
              });
            },
            children: [
              //Date
              Padding(
                padding: _expandableElementPadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Date:',
                      style: _headerTextStyle
                    ),
                    Text(
                      widget.order.date,
                      style: _dataTextStyle,
                    )
                  ],
                ),
              ),
              //Country
              Padding(
                padding: _expandableElementPadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Country:',
                      style: _headerTextStyle
                    ),
                    Row(
                      children: [
                        Text(
                          widget.order.country,
                          style: _dataTextStyle
                        ),
                        SizedBox(width: 10,),
                        Image.asset(
                          'assets/ui/icons/flag.png',
                          height: 20,
                        )
                      ],
                    )
                  ],
                ),
              ),
              //Total Price,
              Padding(
                padding: _expandableElementPadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        'Total Price:',
                        style: _headerTextStyle
                    ),
                    Text(
                      widget.order.price.toString() + ' TRY',
                      style: _dataTextStyle,
                    )
                  ],
                ),
              ),
              //Delivery Fee
              Padding(
                padding: _expandableElementPadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        'Delivery Fee:',
                        style: _headerTextStyle
                    ),
                    Text(
                      '\$' + widget.order.deliveryFee.toString() + '/₼'+ (widget.order.deliveryFee * 1.75).toStringAsFixed(2),
                      style: TextStyle(
                          fontFamily: 'HelveticaNeue',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: ColorPalette.green
                      ),
                    )
                  ],
                ),
              ),
              //Quantity
              Padding(
                padding: _expandableElementPadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        'Quantity:',
                        style: _headerTextStyle
                    ),
                    Text(
                      widget.order.quantity.toString() + ' pcs.',
                      style: _dataTextStyle,
                    )
                  ],
                ),
              ),
              //Weight
              Padding(
                padding: _expandableElementPadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        'Weight:',
                        style: _headerTextStyle
                    ),
                    Text(
                      widget.order.weight.toStringAsFixed(2) + 'kg',
                      style: _dataTextStyle,
                    )
                  ],
                ),
              ),
              //Status
              Padding(
                padding: _expandableElementPadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        'Status:',
                        style: _headerTextStyle
                    ),
                    Text(
                      'Unpaid',
                      style: TextStyle(
                          fontFamily: 'HelveticaNeue',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: ColorPalette.red
                      ),
                    )
                  ],
                ),
              ),

              Padding(
                padding: _expandableElementPadding,
                child: Container(
                  height: 42,
                  decoration: BoxDecoration(
                    color: ColorPalette.sun,
                    borderRadius: BorderRadius.circular(25)
                  ),
                  child: Center(
                    child: Text(
                      'Proceed To Payment',
                      style: TextStyle(
                        fontFamily: 'HelveticaNeue',
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Colors.white
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }

  String _getLogoUrl(){
    if(widget.order.company == "BOYNER")
      return 'assets/ui/logos/boyner_logo.svg';

    return 'assets/ui/logos/flo_logo.svg';
  }
}
