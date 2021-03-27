import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jetex_app/models/credit_card_model.dart';
import 'package:jetex_app/models/new_order.dart';
import 'package:jetex_app/ui/screens/home/confirm_order_screen.dart';
import 'package:jetex_app/ui/widgets/widgets.dart';
import 'package:jetex_app/utils/color_palette.dart';

class SelectPaymentMethodScreen extends StatefulWidget {

  final NewOrder order;

  SelectPaymentMethodScreen({
    Key key,
    @required this.order
  }) : super(key: key);

  @override
  _SelectPaymentMethodScreenState createState() => _SelectPaymentMethodScreenState(order);
}

class _SelectPaymentMethodScreenState extends State<SelectPaymentMethodScreen> {

  final NewOrder order;


  int selectedCardIndex = 1;

  List<CreditCard> creditCards = [
    CreditCard(
        type: 'Visa',
        number: '4522 .... 4444',
        name: 'Mr jetex Azerbaijan',
        expirationDate: '10/23'
    ),
    CreditCard(
        type: 'MasterCard',
        number: '5422 .... 4444',
        name: 'Mr jetex Azerbaijan',
        expirationDate: '12/23'
    ),
  ];

  _SelectPaymentMethodScreenState(this.order);

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
              child: CustomAppbar(
                leading: Row(
                  children: [
                    SvgPicture.asset(
                        'assets/ui/icons/order_box.svg'
                    ),
                    SizedBox(width: 10,),
                    Text(
                      'New Order',
                      style: TextStyle(
                          fontFamily: 'HelveticaNeue',
                          fontWeight: FontWeight.w700,
                          fontSize: _size.height * .022,
                          letterSpacing: 0,
                          color: ColorPalette.darkPurple
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: _size.height * 0.04,),
            Expanded(
              child: _addPaymentMethod(context, _size),
            )
          ],
        ),
      ),
    );
  }

  Widget _addPaymentMethod(BuildContext context, Size _size){
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
          Container(
            height: 70,
            child: Center(
              child: TopBackButton(
                width: 100,
                color: ColorPalette.mysticBlue,
              ),
            ),
          ),
          Expanded(
            child: CustomScrollView(
              slivers: [
                //load all credit card
                SliverList(
                  delegate: SliverChildListDelegate(
                    List.generate(creditCards.length, (index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
                      child: index == selectedCardIndex ? SelectedCreditCardSnap(
                        creditCard: creditCards[index],
                        height: 136,
                        hasShadow: true,
                      ) : InkWell(
                        onTap: (){
                          setState(() {
                            selectedCardIndex = index;
                          });
                        },
                        child: CreditCardSnap(
                          creditCard: creditCards[index],
                          height: 136,
                          hasShadow: true,
                        ),
                      ),
                    ))
                  ),
                ),

                //Add new card Btton
                SliverToBoxAdapter(
                    child: Center(
                      child: InkWell(
                        onTap: (){},
                        child: Container(
                          height: 30,
                          width: 200,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add_circle,
                                size: 24,
                                color: Colors.grey[600],
                              ),
                              SizedBox(width: 4,),
                              Text(
                                'Add New Card',
                                style: TextStyle(
                                    fontFamily: 'HelveticaNeue',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                    color: Colors.grey[600]
                                ),

                              )
                            ],
                          ),
                        ),
                      ),
                    )
                ),
                //Or
                SliverPadding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 8),
                  sliver: SliverToBoxAdapter(
                    child: Center(
                      child: Text(
                        'Or',
                        style: TextStyle(
                            fontFamily: 'HelveticaNeue',
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: Colors.grey[700]
                        ),
                      ),
                    ),
                  ),
                ),
                // Pay via TL Balance
                SliverToBoxAdapter(
                  child: Center(
                    child: Text(
                      'Pay Via TL Balance',
                      style: TextStyle(
                          fontFamily: 'HelveticaNeue',
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: Colors.grey[700]
                      ),
                    ),
                  ),
                ),

                SliverToBoxAdapter(
                  child: SizedBox(height: 20,),
                ),

                SliverPadding(
                  padding: _padding,
                  sliver: SliverToBoxAdapter(
                    child: selectedCardIndex == -1 ? SelectedTLBalanceCard(
                      hasShadow: true,
                    ) : InkWell(
                      onTap: (){
                        setState(() {
                          selectedCardIndex = -1;
                        });
                      },
                      child: TLBalanceCard(
                        hasShadow: true,
                      ),
                    ),
                  ),
                ),


                //bottom proceed buttons
                SliverToBoxAdapter(
                  child: SizedBox(height: 0,),
                ),

                SliverPadding(
                  padding: _padding,
                  sliver: SliverToBoxAdapter(
                      child: SunButton(
                        onTap: (){

                          if(selectedCardIndex < -1){
                            return;
                          }

                          var _order = NewOrder(
                            country: order.country,
                            link:  order.link,
                            quantity: order.quantity,
                            price: order.price,
                            deliveryFee:  order.deliveryFee,
                            additionalNotes: order.additionalNotes,
                          );
                          if(selectedCardIndex > -1) _order.creditCard = creditCards[selectedCardIndex];

                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ConfirmOrderScreen(order: _order,)),
                          );
                        },
                        title: 'Proceed',
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
}
