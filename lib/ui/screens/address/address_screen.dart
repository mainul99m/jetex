import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jetex_app/ui/widgets/custom_appbar.dart';
import 'package:jetex_app/utils/color_palette.dart';

class AddressScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    TextStyle titleStyle = TextStyle(
      fontFamily: 'HelveticaNeue',
      fontWeight: FontWeight.w700,
      color: ColorPalette.darkPurple,
      fontSize: _size.height * 0.014
    );
    return Scaffold(
      backgroundColor: ColorPalette.lightGrey,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            CustomAppbar(),
            SizedBox(height: _size.height * .025,),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: _size.width * 0.08,vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name, Surname'.toUpperCase(),
                    style: titleStyle,
                  )
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}
