import 'package:credit_card_type_detector/credit_card_type_detector.dart';
import 'package:flutter/material.dart';
import 'package:jetex_app/models/credit_card_model.dart';
import 'package:jetex_app/ui/widgets/widgets.dart';
import 'package:jetex_app/utils/color_palette.dart';

class AddCreditCard extends StatefulWidget {
  @override
  _AddCreditCardState createState() => _AddCreditCardState();
}

class _AddCreditCardState extends State<AddCreditCard> {

  final numberController = TextEditingController();
  final nameController = TextEditingController();
  final expirydateController = TextEditingController();
  final typeController = TextEditingController();


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    numberController.dispose();
    nameController.dispose();
    expirydateController.dispose();
    typeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorPalette.lightGrey,
      body: Container(
        child: Column(
          children: [
            //Appbar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Container(
                height: 90,
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Icon(
                          Icons.credit_card,
                          color: ColorPalette.sun,
                          size: 34,
                        ),
                        SizedBox(width: 8,),
                        Text(
                          'Add Credit Card',
                          style: TextStyle(
                            color: ColorPalette.darkPurple,
                            fontSize: 24,
                            fontFamily: 'HelveticaNeue',
                            fontWeight: FontWeight.w700
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ),
            SizedBox(height: _size.height * 0.1,),
            Expanded(child: _createCard())
          ],
        ),
      ),
    );
  }

  Widget _createCard(){
    const EdgeInsetsGeometry _padding = EdgeInsets.fromLTRB(
        40, 0, 40, 26
    );
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
          boxShadow: [BoxShadow(
            color: Colors.grey[300],
            blurRadius: 10,
          )]
      ),
      child: Column(
        children: [
          ///Top back button
          Container(
            height: 70,
            child: Center(
              child: TopBackButton(
                width: 100,
                color: ColorPalette.mysticBlue,
              ),
            ),
          ),
          ///Input list
          Expanded(
            child: CustomScrollView(
              slivers: [
                /// Name
                SliverPadding(
                  padding: _padding,
                  sliver: SliverToBoxAdapter(
                    child: CustomTextField(
                      title: 'Name',
                      isAuth: false,
                      controller: nameController,
                      keyboardType: TextInputType.name,
                    ),
                  ),
                ),
                /// Number
                SliverPadding(
                  padding: _padding,
                  sliver: SliverToBoxAdapter(
                    child: CustomTextField(
                      title: 'Card Number',
                      isAuth: false,
                      controller: numberController,
                      onChanged: _detectCardType,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
                /// Exp Date
                SliverPadding(
                  padding: _padding,
                  sliver: SliverToBoxAdapter(
                    child: CustomTextField(
                      title: 'Expiry Date',
                      isAuth: false,
                      controller: expirydateController,
                    ),
                  ),
                ),
                /// Type
                SliverPadding(
                  padding: _padding,
                  sliver: SliverToBoxAdapter(
                    child: CustomTextField(
                      title: 'Card Type',
                      isAuth: false,
                      controller: typeController,
                    ),
                  ),
                ),

                SliverToBoxAdapter(
                  child: SizedBox(height: 4,),
                ),
                SliverPadding(
                  padding: _padding,
                  sliver: SliverToBoxAdapter(
                      child: SunButton(
                        onTap: (){
                          _save(context);
                        },
                        title: 'Save',
                      )
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _detectCardType(String value){
    var type = detectCCType(value);
    switch(type){
      case CreditCardType.unknown:{
        typeController.text = "";
      }
      break;
      case CreditCardType.visa:{
        typeController.text = "VISA";
      }
      break;
      case CreditCardType.mastercard:{
        typeController.text = "MASTERCARD";
      }
      break;
      case CreditCardType.amex:{
        typeController.text = "AMEX";
      }
      break;
    }
  }


  void _save(BuildContext context){
    final card = CreditCard(
      name: nameController.text,
      number: numberController.text,
      expirationDate: expirydateController.text,
      type: typeController.text
    );

    Navigator.of(context).pop();

  }
}
