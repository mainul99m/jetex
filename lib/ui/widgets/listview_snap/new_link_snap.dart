import 'package:flutter/material.dart';
import 'package:jetex_app/models/create_new_order.dart';
import 'package:jetex_app/ui/widgets/widgets.dart';
import 'package:jetex_app/utils/color_palette.dart';

class AddNewLinkSnap extends StatefulWidget {

  final void Function(Product) onChanged;
  final VoidCallback onTap;
  final Product value;

  const AddNewLinkSnap({
    Key key, this.onChanged,
    this.onTap,
    this.value
  }) : super(key: key);

  @override
  _AddNewLinkSnapState createState() => _AddNewLinkSnapState();
}

class _AddNewLinkSnapState extends State<AddNewLinkSnap> {

  var linkController = TextEditingController();
  var quantityController = TextEditingController();
  var priceController = TextEditingController();
  var deliveryFeeController = TextEditingController();
  var additionalNotesController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    linkController.dispose();
    quantityController.dispose();
    priceController.dispose();
    deliveryFeeController.dispose();
    additionalNotesController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _padding = EdgeInsets.only(bottom: 26);
    linkController.text = widget.value.link == null ? '' : widget.value.link ;
    quantityController.text = widget.value.quantity == 0 ? '' : widget.value.quantity.toString();
    priceController.text = widget.value.price == 0 ? '' : widget.value.price.toString();
    deliveryFeeController.text =  widget.value.deliveryFee == 0 ? '' : widget.value.deliveryFee.toString();
    additionalNotesController.text = widget.value.additionalNotes;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Add additional Information',
              style: TextStyle(
                fontFamily: 'HelveticaNeue',
                color: ColorPalette.darkPurple,
              ),
            ),
            Material(
              child: InkWell(
                borderRadius: BorderRadius.circular(11),
                onTap: widget.onTap,
                child: Icon(
                  Icons.remove_circle,
                  size: 22,
                  color: ColorPalette.sun,
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 12,),
        //Link
        Padding(
          padding: _padding,
          child: CustomTextField(
            title: 'Link',
            isAuth: false,
            controller: linkController,
            keyboardType: TextInputType.url,
            onChanged: _onChange,
          ),
        ),

        Padding(
          padding: _padding,
          child: CustomTextField(
            title: 'Quantity',
            isAuth: false,
            controller: quantityController,
            keyboardType: TextInputType.number,
            onChanged: _onChange,
          ),
        ),
        //Price
        Padding(
          padding: _padding,
          child: CustomTextField(
            title: 'Price (TL)',
            isAuth: false,
            controller: priceController,
            keyboardType: TextInputType.numberWithOptions(
                signed: true,
                decimal: true
            ),
            onChanged: _onChange,
          ),
        ),
        // Delivery Fee
        Padding(
          padding: _padding,
          child: CustomTextField(
            title: 'Delivery Fee (TL)',
            isAuth: false,
            controller: deliveryFeeController,
            keyboardType: TextInputType.numberWithOptions(
                signed: true,
                decimal: true
            ),
            onChanged: _onChange,
          ),
        ),
        // Additional Notes
        Padding(
          padding: _padding,
          child: CustomTextField(
            title: 'Additional Notes',
            isAuth: false,
            controller: additionalNotesController,
            onChanged: _onChange,
          ),
        ),
      ],
    );
  }

  void _onChange(String value){
    var product = Product(
      link: linkController.text,
      quantity: quantityController.text == '' ? 0 : int.parse(quantityController.text),
      price:  priceController.text == '' ? 0: double.parse(priceController.text),
      deliveryFee: deliveryFeeController.text == '' ? 0 : double.parse(deliveryFeeController.text),
      additionalNotes: additionalNotesController.text
    );

    widget.onChanged(product);
  }
}
