import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jetex_app/ui/screens/Referral/referral_screen.dart';
import 'package:jetex_app/ui/screens/address/address_screen.dart';
import 'package:jetex_app/ui/screens/delivery/delivary_screen.dart';
import 'package:jetex_app/ui/screens/home/home_screen.dart';
import 'package:jetex_app/ui/screens/order/order_screen.dart';
import 'package:jetex_app/ui/widgets/widgets.dart';
import 'package:jetex_app/utils/color_palette.dart';
import 'package:jetex_app/utils/custom_icons_icons.dart';

class NavigationScreen extends StatefulWidget {
  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {

  int _selectedItemIndex = 2;

  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _selectedItemIndex
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }


  final List<Widget> _navigationScreens = [
    AddressScreen(),
    OrderScreen(),
    HomeScreen(),
    ReferralScreen(),
    DeliveryScreen()
  ];

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Scaffold(
      bottomNavigationBar: Container(
        width: _size.width,
        height: _size.height * 0.12,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(_size.width * 0.09),
            topRight: Radius.circular(_size.width * 0.09)
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            BnbItem(
              index: 0,
              iconData: CustomIcons.location,
              selectedItemIdex: _selectedItemIndex,
              onTap: (){
                _setIndex(0);
              },
            ),
            BnbItem(
              index: 1,
              iconData: CustomIcons.credit_card_alt,
              selectedItemIdex: _selectedItemIndex,
              onTap: (){
                _setIndex(1);
              },
            ),
            BnbItem(
              index: 2,
              iconData: CustomIcons.home,
              selectedItemIdex: _selectedItemIndex,
              onTap: (){
                _setIndex(2);
              },
            ),
            BnbItem(
              index: 3,
              iconData: CustomIcons.link,
              selectedItemIdex: _selectedItemIndex,
              onTap: (){
                _setIndex(3);
              },
            ),
            BnbItem(
              index: 4,
              iconData: CustomIcons.motorcycle,
              selectedItemIdex: _selectedItemIndex,
              onTap: (){
                _setIndex(4);
              },
            ),
          ],
        ),
      ),
      backgroundColor: ColorPalette.lightGrey,
      body: PageView(
        physics:new NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: _navigationScreens,
      )
      //_navigationScreens[_selectedItemIndex]
    );
  }

  _setIndex(int index){
    setState(() {
      _selectedItemIndex = index;
    });
    _pageController.animateToPage(index,
        duration: Duration(milliseconds: 500), curve: Curves.easeOut);
  }

}
