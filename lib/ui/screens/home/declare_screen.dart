import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jetex_app/ui/screens/home/select_payment_method_screen.dart';
import 'package:jetex_app/ui/widgets/widgets.dart';
import 'package:jetex_app/utils/color_palette.dart';

class DeclareScreen extends StatelessWidget {

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
                        'assets/ui/icons/declare_icon.svg'
                    ),
                    SizedBox(width: 10,),
                    Text(
                      'Declare',
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
                isCancelButton: true,
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
                //Tracking Number
                SliverPadding(
                  padding: _padding,
                  sliver: SliverToBoxAdapter(
                    child: CustomTextField(
                      title: 'Tracking Number',
                      isAuth: false,
                    ),
                  ),
                ),
                //Website
                SliverPadding(
                  padding: _padding,
                  sliver: SliverToBoxAdapter(
                    child: CustomTextField(
                      title: 'Website',
                      isAuth: false,
                    ),
                  ),
                ),
                //Company Name
                SliverPadding(
                  padding: _padding,
                  sliver: SliverToBoxAdapter(
                    child: CustomTextField(
                      title: 'Company Name',
                      isAuth: false,
                    ),
                  ),
                ),
                // Category
                SliverPadding(
                  padding: _padding,
                  sliver: SliverToBoxAdapter(
                    child: CustomTextField(
                      title: 'Category',
                      isAuth: false,
                    ),
                  ),
                ),
                // Total Price
                SliverPadding(
                  padding: _padding,
                  sliver: SliverToBoxAdapter(
                    child: CustomTextField(
                      title: 'Total Price',
                      isAuth: false,
                    ),
                  ),
                ),
                // Currency
                SliverPadding(
                  padding: _padding,
                  sliver: SliverToBoxAdapter(
                    child: CustomTextField(
                      title: 'Currency',
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
                // Special Notes
                SliverPadding(
                  padding: _padding,
                  sliver: SliverToBoxAdapter(
                    child: CustomTextField(
                      title: 'Special Notes',
                      isAuth: false,
                    ),
                  ),
                ),


                //Upload Invoice Button
                SliverPadding(
                  padding: _padding,
                  sliver: SliverToBoxAdapter(
                    child: DottedBorder(
                      borderType: BorderType.RRect,
                      radius: Radius.circular(26),
                      strokeCap: StrokeCap.round,
                      strokeWidth: 4,
                      dashPattern: [20,19],
                      color: ColorPalette.darkPurple,
                      child: InkWell(
                        onTap: (){

                        },
                        child: Container(
                          height: _size.height * 0.13,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add_circle,
                                color: Colors.grey[700],
                                size: 42,
                              ),
                              SizedBox(width: 10,),
                              Text(
                                'Upload Invoice',
                                style: TextStyle(
                                  fontFamily: 'HelveticaNeue',
                                  fontWeight: FontWeight.w700,
                                  color: Colors.grey[700],
                                  fontSize: 16
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ),
                ),


                //Save Button
                SliverToBoxAdapter(
                  child: SizedBox(height: 4,),
                ),
                SliverPadding(
                  padding: _padding,
                  sliver: SliverToBoxAdapter(
                      child: SunButton(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SelectPaymentMethodScreen()),
                          );
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
}
