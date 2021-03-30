import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
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
  String _pickedAddress = '';
  LatLng _lastMapPosition;
  Completer<GoogleMapController> _controller = Completer();


  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  TextEditingController _trackingNumberController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _dateTimeNumberController = TextEditingController();
  TextEditingController _additionalNotesController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _trackingNumberController.dispose();
    _addressController.dispose();
    _dateTimeNumberController.dispose();
    _additionalNotesController.dispose();
  }


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
              onCameraIdle: _onCameraIdle,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
            Center(
              child: Icon(
                Icons.location_on_sharp,
                size: 30,
                color: ColorPalette.sun,
              ),
            ),
            Positioned(
              right: 0,
              bottom: _size.height * 0.35 + 20,
              child: Container(
                height: 50,
                width: 60,
                child: Material(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10)
                  ),
                  color: Colors.white,
                  child: InkWell(
                    onTap: _getCurrentLocation,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10)
                    ),
                    child: Center(
                      child: RotatedBox(
                        quarterTurns: 3,
                        child: Icon(
                          CustomIcons.location_arrow,
                          color: ColorPalette.darkPurple,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
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
                    controller: _trackingNumberController,
                  ),
                ),
              ),

              SliverPadding(
                padding: padding,
                sliver: SliverToBoxAdapter(
                  child: Stack(
                    children: [
                      CustomTextField(
                        title: 'Address',
                        isAuth: false,
                        readOnly: true,
                        keyboardType: TextInputType.streetAddress,
                        controller: _addressController,
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
                    controller: _dateTimeNumberController,
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
                    controller: _additionalNotesController,
                  ),
                ),
              ),


              SliverToBoxAdapter(
                child: SizedBox(height: size.height * 0.065,),
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
            'Confirm Address',
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
                      _pickedAddress,
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
            onTap: _onConfirmTap,
          ),
        )

      ],
    );
  }

  void _onConfirmTap(){
    _addressController.text = _pickedAddress;
    setState(() {
      _isExpanded = true;
    });
  }

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  void _onCameraIdle(){
    _getPlace();
  }

  void _getPlace() async{
    List<Placemark> placemarks = await placemarkFromCoordinates(_lastMapPosition.latitude, _lastMapPosition.longitude);
    String temp = '';
    temp = placemarks.first.name + ", " + placemarks.first.locality;

    setState(() {
      _pickedAddress = temp;
    });
  }

  void _getCurrentLocation(){
    _goToCurrentLocation();
  }


  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        // Permissions are denied forever, handle appropriately.
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }

      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error(
            'Location permissions are denied');
      }
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  Future<void> _goToCurrentLocation() async {
    Position position = await _determinePosition();
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(position.latitude, position.longitude),
      zoom: 16,
    )));
  }

}
