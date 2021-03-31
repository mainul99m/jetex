import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jetex_app/models/credit_card_model.dart';
import 'package:jetex_app/models/create_new_order.dart';
import 'package:jetex_app/ui/screens/home/confirm_order_screen.dart';
import 'package:jetex_app/ui/widgets/widgets.dart';
import 'package:jetex_app/utils/api.dart';
import 'package:jetex_app/utils/color_palette.dart';

class SelectPaymentMethodScreen extends StatefulWidget {

  final CreateNewOrder order;

  SelectPaymentMethodScreen({
    Key key,
    @required this.order
  }) : super(key: key);

  @override
  _SelectPaymentMethodScreenState createState() => _SelectPaymentMethodScreenState();
}

class _SelectPaymentMethodScreenState extends State<SelectPaymentMethodScreen> {


  int selectedCardIndex = -10;

  CreditCard creditCard = CreditCard();

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
                FutureBuilder<List<CreditCard>>(
                  future: _getCards(),
                  builder: (context, snapshot){
                    if(snapshot.hasData){
                      return SliverList(
                        delegate: SliverChildListDelegate(
                            List.generate(snapshot.data.length, (index) => Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
                              child: index == selectedCardIndex ? SelectedCreditCardSnap(
                                creditCard: snapshot.data[index],
                                height: 136,
                                hasShadow: true,
                              ) : InkWell(
                                onTap: (){
                                  creditCard = snapshot.data[index];
                                  setState(() {
                                    selectedCardIndex = index;
                                  });
                                },
                                child: CreditCardSnap(
                                  creditCard: snapshot.data[index],
                                  height: 136,
                                  hasShadow: true,
                                ),
                              ),
                            ))
                        ),
                      );
                    }

                    return SliverList(
                      delegate: SliverChildListDelegate(
                        List.generate(1, (index) => Center(child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircularProgressIndicator(),
                        )))
                      ),
                    );
                  },
                ),

                /*
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

                 */

                //Add new card Btton
                SliverToBoxAdapter(
                    child: Center(
                      child: InkWell(
                        onTap: (){
                          print('Add card');
                        },
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
                            final snackBar = SnackBar(content: Text('Please select your payment method'));
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);

                            return;
                          }

                          var _order = CreateNewOrder(
                            country: widget.order.country,
                            link:  widget.order.link,
                            quantity: widget.order.quantity,
                            price: widget.order.price,
                            deliveryFee:  widget.order.deliveryFee,
                            additionalNotes: widget.order.additionalNotes,
                          );
                          if(selectedCardIndex > -1) _order.creditCard = creditCard;

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


  Future<List<CreditCard>> _getCards() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 500));
    List<CreditCard> cards = API.getCards();
    return cards;
  }

}
