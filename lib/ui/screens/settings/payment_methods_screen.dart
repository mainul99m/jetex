import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jetex_app/models/credit_card_model.dart';
import 'package:jetex_app/ui/widgets/widgets.dart';
import 'package:jetex_app/utils/color_palette.dart';
import 'package:jetex_app/utils/custom_icons_icons.dart';

class PaymentMethods extends StatefulWidget {
  @override
  _PaymentMethodsState createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {

  List<CreditCard> creditCards = [
    CreditCard(
      type: 'v',
      number: '4522 .... 4444',
      name: 'Mr jetex Azerbaijan',
      expirationDate: '10/23'
    ),
    CreditCard(
        type: 'm',
        number: '5422 .... 4444',
        name: 'Mr jetex Azerbaijan',
        expirationDate: '12/23'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: ColorPalette.lightGrey,
        child: Column(
          children: [
            _appBar(size),
            Expanded(
              child: _paymentMethod(size)
            )
          ],
        ),
      ),
    );
  }

  Widget _appBar(Size size) {
    return Container(
      padding: EdgeInsets.fromLTRB(12, size.height * 0.05, 30, 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TopBackButton(
            width: 100,
            color: ColorPalette.darkGrey,
          ),
          SvgPicture.asset(
              'assets/ui/logos/jetex_logo.svg'
          )
        ],
      ),
    );
  }
  
  Widget _paymentMethod(Size size){
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: size.height * 0.02, horizontal: 40),
            child: Text(
              'Payment Methods',
              style: TextStyle(
                color: ColorPalette.darkPurple,
                fontFamily: 'HelveticaNeue',
                fontSize: size.height * 0.026,
                fontWeight: FontWeight.w700
              ),
            ),
          ),
        ),

        SliverList(
          delegate: SliverChildListDelegate(
            List.generate(creditCards.length, (index) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
              child: CreditCardSnap(
                creditCard: creditCards[index],
                height: size.height * 0.19,
              ),
            ))
          ),
        ),

        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: DottedBorder(
              borderType: BorderType.RRect,
              radius: Radius.circular(26),
              strokeCap: StrokeCap.round,
              strokeWidth: 5,
              dashPattern: [20,19],
              color: Colors.grey[600],
              child: InkWell(
                onTap: (){
                  print('Add Card');
                },
                child: Container(
                  height: 160,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_circle,
                          size: 60,
                          color: Colors.grey[400],
                        ),
                        SizedBox(height: 10,),
                        Text(
                          'Add A New Card',
                          style: TextStyle(
                            fontFamily: 'HelveticaNeue',
                            fontWeight: FontWeight.w400,
                            fontSize: 16.5,
                            color: Colors.grey[600]
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),

        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          sliver: SliverToBoxAdapter(
            child: SunButton(
              onTap: (){},
              title: 'Save Changes',
            ),
          ),
        )

      ],
    );
  }


}
