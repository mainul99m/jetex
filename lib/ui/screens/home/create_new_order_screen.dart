import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jetex_app/ui/widgets/widgets.dart';
import 'package:jetex_app/utils/color_palette.dart';

class CreateNewOrderScreen extends StatelessWidget {
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
              child: _createNewOrder(_size),
            )
          ],
        ),
      ),
    );
  }

  Widget _createNewOrder(Size _size){
    const EdgeInsetsGeometry _padding = EdgeInsets.fromLTRB(
      30, 0, 30, 26
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
