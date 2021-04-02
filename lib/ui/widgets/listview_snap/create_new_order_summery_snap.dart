import 'package:flutter/material.dart';
import 'package:jetex_app/models/create_new_order.dart';
import 'package:jetex_app/ui/widgets/widgets.dart';
import 'package:jetex_app/utils/color_palette.dart';


class CreateNewOrderSummerySnap extends StatelessWidget {
  final Product product;

  const CreateNewOrderSummerySnap({
    Key key,
    this.product
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    const _padding = EdgeInsets.only(
      top: 5,
      bottom: 20
    );
    return Column(
      children: [
        Text(
          '······································································',
          style: TextStyle(
            color: ColorPalette.sun
          ),
          textAlign: TextAlign.center,
        ),
        //Link
        Padding(
          padding: _padding,
          child: SummeryRow(
            leading: 'Link',
            trailing: product.link,
          ),
        ),

        //Quantity
        Padding(
          padding: _padding,
          child: SummeryRow(
            leading: 'Quantity',
            trailing: product.quantity.toString(),
          ),
        ),

        //Price
        Padding(
          padding: _padding,
          child: SummeryRow(
            leading: 'Price(TL)',
            trailing: product.price.toStringAsFixed(2),
          ),
        ),

        //Delivery fee
        Padding(
          padding: _padding,
          child: SummeryRow(
            leading: 'Delivery Fee(TL)',
            trailing: product.deliveryFee.toStringAsFixed(2),
          ),
        ),

        //Additional Notes
        Padding(
          padding: _padding,
          child: SummeryRow(
            leading: 'Additional Notes',
            trailing: product.additionalNotes,
          ),
        ),
      ],
    );
  }
}
