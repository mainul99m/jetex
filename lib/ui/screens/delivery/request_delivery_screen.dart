import 'package:flutter/material.dart';
import 'package:jetex_app/ui/widgets/back_button.dart';
import 'package:jetex_app/ui/widgets/bottom_sun_button.dart';
import 'package:jetex_app/ui/widgets/c_text_field.dart';
import 'package:jetex_app/ui/widgets/currency_text.dart';
import 'package:jetex_app/utils/color_palette.dart';


class RequestDeliveryScreen extends StatefulWidget {
  @override
  _RequestDeliveryScreenState createState() => _RequestDeliveryScreenState();
}

class _RequestDeliveryScreenState extends State<RequestDeliveryScreen> {
  bool _isExpanded = true;

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              color: Colors.amberAccent[100],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 100),
                height: _isExpanded ? _size.height * 0.825 : _size.height * 0.25,
                width: _size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30)
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10
                    )
                  ]
                ),
                child: _isExpanded ? _deliveryInput() : _confirmAdress(),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _deliveryInput(){
    EdgeInsetsGeometry padding = EdgeInsets.symmetric(horizontal: 30, vertical: 10);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TopBackButton(
          color: ColorPalette.darkGrey,
          width: 100,
        ),
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Text(
                  'Request Details',
                  style: TextStyle(
                    color: ColorPalette.darkPurple,
                    fontFamily: 'HelveticaNeue',
                    fontWeight: FontWeight.w700,
                    fontSize: 20
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              //Tracking Number
              SliverPadding(
                padding: padding,
                sliver: SliverToBoxAdapter(
                  child: CustomTextField(
                    title: 'Tracking Number',
                    isAuth: false,
                  ),
                ),
              ),
              //Todo

              SliverPadding(
                padding: padding,
                sliver: SliverToBoxAdapter(
                  child: CustomTextField(
                    title: 'Address',
                    isAuth: false,
                  ),
                ),
              ),

              //Date and Time
              SliverPadding(
                padding: padding,
                sliver: SliverToBoxAdapter(
                  child: CustomTextField(
                    title: 'Date and Time Range',
                    isAuth: false,
                    keyboardType: TextInputType.datetime,
                  ),
                ),
              ),

              //Additional Notes
              SliverPadding(
                padding: padding,
                sliver: SliverToBoxAdapter(
                  child: CustomTextField(
                    title: 'Additional Notes',
                    isAuth: false,
                  ),
                ),
              ),

              SliverPadding(
                padding: padding,
                sliver: SliverToBoxAdapter(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        'Delivery Fee:',
                        style: TextStyle(
                            color: ColorPalette.darkPurple,
                            fontFamily: 'HelveticaNeue',
                            fontWeight: FontWeight.w700,
                            fontSize: 16
                        ),
                      ),
                      CurrencyText(
                        isSmall: true,
                        amount: 17.34,
                      )
                    ],
                  ),
                ),
              ),

              SliverPadding(
                padding: padding,
                sliver: SliverToBoxAdapter(
                  child: SunButton(
                    title: 'Proceed',
                    onTap: (){

                    },
                  ),
                ),
              )

            ],
          )
        )
      ],
    );
  }
  Widget _confirmAdress(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TopBackButton(
          color: ColorPalette.darkGrey,
          width: 100,
        ),
        Expanded(
          child: Container(
            child: Center(child: InkWell(
                onTap: (){
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
                child: Text('Big')
            )),
          ),
        )
      ],
    );
  }
}
