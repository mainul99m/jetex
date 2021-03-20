import 'package:flutter/material.dart';
import 'package:jetex_app/ui/widgets/widgets.dart';
import 'package:jetex_app/utils/color_palette.dart';

class NewOrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorPalette.lightGrey,
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              CustomAppbar(
                leading: Text(
                  'Orders',
                  style: TextStyle(
                      fontFamily: 'HelveticaNeue',
                      fontWeight: FontWeight.w700,
                      fontSize: _size.height * .022,
                      letterSpacing: 0,
                      color: ColorPalette.darkPurple
                  ),
                ),
              ),
              SizedBox(height: _size.height * 0.01,),
              Expanded(
                child: Container(
                  // child: _orderView(),
                ),
              )
            ],
          )
      ),
    );
  }
}
