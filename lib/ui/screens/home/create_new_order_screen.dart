import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jetex_app/models/new_order.dart';
import 'package:jetex_app/ui/screens/home/select_payment_method_screen.dart';
import 'package:jetex_app/ui/widgets/widgets.dart';
import 'package:jetex_app/utils/color_palette.dart';

class CreateNewOrderScreen extends StatefulWidget {
  @override
  _CreateNewOrderScreenState createState() => _CreateNewOrderScreenState();
}

class _CreateNewOrderScreenState extends State<CreateNewOrderScreen> {

  final countryController = TextEditingController();
  final linkController = TextEditingController();
  final quantityController = TextEditingController();
  final priceController = TextEditingController();
  final deliveryFeeController = TextEditingController();
  final additionalNotesController = TextEditingController();


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    countryController.dispose();
    linkController.dispose();
    quantityController.dispose();
    priceController.dispose();
    deliveryFeeController.dispose();
    additionalNotesController.dispose();
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
              child: _createNewOrder(context, _size),
            )
          ],
        ),
      ),
    );
  }

  Widget _createNewOrder(BuildContext context, Size _size){
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
                //Country
                SliverPadding(
                  padding: _padding,
                  sliver: SliverToBoxAdapter(
                    child: CustomTextField(
                      title: 'Country',
                      isAuth: false,
                      controller: countryController,
                    ),
                  ),
                ),
                //Link
                SliverPadding(
                  padding: _padding,
                  sliver: SliverToBoxAdapter(
                    child: CustomTextField(
                      title: 'Link',
                      isAuth: false,
                      controller: linkController,
                      keyboardType: TextInputType.url,
                    ),
                  ),
                ),
                //Quantity
                SliverPadding(
                  padding: _padding,
                  sliver: SliverToBoxAdapter(
                    child: CustomTextField(
                      title: 'Quantity',
                      isAuth: false,
                      controller: quantityController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
                //Price
                SliverPadding(
                  padding: _padding,
                  sliver: SliverToBoxAdapter(
                    child: CustomTextField(
                      title: 'Price (TL)',
                      isAuth: false,
                      controller: priceController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
                // Delivery Fee
                SliverPadding(
                  padding: _padding,
                  sliver: SliverToBoxAdapter(
                    child: CustomTextField(
                      title: 'Delivery Fee (TL)',
                      isAuth: false,
                      controller: deliveryFeeController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
                // Additional Notes
                SliverPadding(
                  padding: _padding,
                  sliver: SliverToBoxAdapter(
                    child: CustomTextField(
                      title: 'Additional Notes',
                      isAuth: false,
                      controller: additionalNotesController,
                    ),
                  ),
                ),
                //Add new Link Btton
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
                              color: ColorPalette.darkPurple,
                            ),
                            SizedBox(width: 4,),
                            Text(
                              'Add New Link',
                              style: TextStyle(
                                fontFamily: 'HelveticaNeue',
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                color: ColorPalette.darkPurple
                              ),

                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ),

                SliverToBoxAdapter(
                  child: SizedBox(height: 4,),
                ),
                SliverPadding(
                  padding: _padding,
                  sliver: SliverToBoxAdapter(
                      child: SunButton(
                        onTap: (){

                          final order = NewOrder(
                            country: countryController.text,
                            link: linkController.text,
                            quantity: quantityController.text == '' ? 0 : int.parse(quantityController.text),
                            price: priceController.text == '' ? 0 : double.parse(priceController.text),
                            deliveryFee: deliveryFeeController.text == '' ? 0 : double.parse(deliveryFeeController.text),
                            additionalNotes: additionalNotesController.text
                          );

                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SelectPaymentMethodScreen(order: order,)),
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
