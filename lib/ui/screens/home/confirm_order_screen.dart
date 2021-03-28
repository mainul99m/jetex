import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jetex_app/models/new_order.dart';
import 'package:jetex_app/ui/screens/navigation_screen.dart';
import 'package:jetex_app/ui/widgets/widgets.dart';
import 'package:jetex_app/utils/color_palette.dart';

class ConfirmOrderScreen extends StatelessWidget {

  final NewOrder order;

  const ConfirmOrderScreen({
    Key key,
    this.order
  }) : super(key: key);



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
        30, 5, 30, 20
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

                SliverToBoxAdapter(
                  child: Text(
                    'Order Summery',
                    style: TextStyle(
                      fontFamily: 'HelveticaNeue',
                      fontWeight: FontWeight.w700,
                      fontSize: _size.height * 0.022,
                      color: ColorPalette.darkPurple
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                //country
                SliverPadding(
                  padding: _padding,
                  sliver: SliverToBoxAdapter(
                    child: SummeryRow(
                      leading: 'Country',
                      trailing: order.country,
                    ),
                  ),
                ),

                //Link
                SliverPadding(
                  padding: _padding,
                  sliver: SliverToBoxAdapter(
                    child: SummeryRow(
                      leading: 'Link',
                      trailing: order.link,
                    ),
                  ),
                ),

                //Quantity
                SliverPadding(
                  padding: _padding,
                  sliver: SliverToBoxAdapter(
                    child: SummeryRow(
                      leading: 'Quantity',
                      trailing: order.quantity.toString(),
                    ),
                  ),
                ),

                //Price
                SliverPadding(
                  padding: _padding,
                  sliver: SliverToBoxAdapter(
                    child: SummeryRow(
                      leading: 'Price(TL)',
                      trailing: order.price.toStringAsFixed(2),
                    ),
                  ),
                ),

                //Delivery fee
                SliverPadding(
                  padding: _padding,
                  sliver: SliverToBoxAdapter(
                    child: SummeryRow(
                      leading: 'Delivery Fee(TL)',
                      trailing: order.deliveryFee.toStringAsFixed(2),
                    ),
                  ),
                ),

                //Additional Notes
                SliverPadding(
                  padding: _padding,
                  sliver: SliverToBoxAdapter(
                    child: SummeryRow(
                      leading: 'Additional Notes',
                      trailing: order.additionalNotes,
                    ),
                  ),
                ),

                SliverPadding(
                  padding: _padding,
                  sliver: SliverToBoxAdapter(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Container(
                        height: 1,
                        color: ColorPalette.sun,
                      ),
                    ),
                  ),
                ),

                //Total Order
                SliverPadding(
                  padding: _padding,
                  sliver: SliverToBoxAdapter(
                    child: SummeryRow(
                      leading: 'Total Order (TL)',
                      trailing: (order.price * order.quantity + order.deliveryFee).toStringAsFixed(2),
                    ),
                  ),
                ),



                //Paying via Text
                SliverToBoxAdapter(
                  child: Text(
                    'Paying Via',
                    style: TextStyle(
                        fontFamily: 'HelveticaNeue',
                        fontWeight: FontWeight.w700,
                        fontSize: _size.height * 0.018,
                        color: ColorPalette.darkPurple
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 18),
                  sliver: SliverToBoxAdapter(
                    child: order.creditCard == null ? TLBalanceCard(
                      hasShadow: true,
                    ) : CreditCardSnap(
                      height: 120,
                      creditCard: order.creditCard,
                      hasShadow: true,
                    ),
                  ),
                ),

                //Button
                SliverPadding(
                  padding: _padding,
                  sliver: SliverToBoxAdapter(
                      child: SunButton(
                        onTap: (){
                          //Navigator.of(context).popUntil(ModalRoute.withName('/'));
                          popUntilRoot(context);
                        },
                        title: 'Confirm',
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
  void popUntilRoot(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
      popUntilRoot(context);
    }
  }
}
