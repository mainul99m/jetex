import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jetex_app/ui/widgets/back_button.dart';
import 'package:jetex_app/ui/widgets/bottom_sun_button.dart';
import 'package:jetex_app/ui/widgets/c_text_field.dart';
import 'package:jetex_app/ui/widgets/currency_text.dart';
import 'package:jetex_app/utils/color_palette.dart';
import 'package:jetex_app/utils/custom_icons_icons.dart';


class RequestDeliveryScreen extends StatefulWidget {
  @override
  _RequestDeliveryScreenState createState() => _RequestDeliveryScreenState();
}

class _RequestDeliveryScreenState extends State<RequestDeliveryScreen> {
  bool _isExpanded = true;

  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: _kGooglePlex,
              onCameraMove: _onCameraMove,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                height: _isExpanded ? _size.height * 0.825 : _size.height * 0.35,
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
                child: _isExpanded ? _deliveryInput(_size) : _confirmAdress(),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _deliveryInput(Size size){
    EdgeInsetsGeometry padding = EdgeInsets.symmetric(horizontal: 30, vertical: size.height * 0.016);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 12,
        ),
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

              SliverToBoxAdapter(
                child: SizedBox(height: 30,),
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
                  child: Stack(
                    children: [
                      CustomTextField(
                        title: 'Address',
                        isAuth: false,
                        readOnly: true,
                      ),
                      InkWell(
                        onTap: (){
                          setState(() {
                            _isExpanded = !_isExpanded;
                          });
                        },
                        child: Container(
                          color: Colors.transparent,
                          height: 60,
                        ),
                      )
                    ],
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
      // mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 12,
        ),
        Center(
          child: TopBackButton(
            color: ColorPalette.darkGrey,
            width: 100,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 30,
            top: 20,
            bottom: 18
          ),
          child: Text(
            'Confirm Adress',
            style: TextStyle(
              color: ColorPalette.darkPurple,
              fontFamily: 'HelveticaNeue',
              fontWeight: FontWeight.w700,
              fontSize: 19
            ),
            textAlign: TextAlign.left,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 36),
          child: Container(
            height: 1,
            color: ColorPalette.sun,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30,),
          child: Container(
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  CustomIcons.location,
                  color: ColorPalette.darkPurple,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'Dilara Aliyev 253,',
                      style: TextStyle(
                        fontFamily: 'HelveticaNeue',
                        fontSize: 20,
                        fontWeight: FontWeight.w500
                      ),
                      textAlign: TextAlign.left,
                      maxLines: 2,
                    ),
                  ),
                ),
                Icon(
                  CustomIcons.edit,
                  color: Colors.grey,
                )
              ],
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SunButton(
            title: 'Confirm',
            onTap: (){

            },
          ),
        )

      ],
    );
  }


  void _onCameraMove(CameraPosition position) {
    //_lastMapPosition = position.target;

    print(position);
  }

}
