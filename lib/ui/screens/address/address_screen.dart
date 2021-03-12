//import 'package:cached_network_image/cached_network_image.dart';
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
      fontSize: _size.height * 0.0135
    );

    TextStyle infoStyle = TextStyle(
      fontFamily: 'HelveticaNeue',
      fontWeight: FontWeight.w400,
      color: Colors.black,
      fontSize: _size.height * 0.018
    );

    return Scaffold(
      backgroundColor: ColorPalette.lightGrey,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            CustomAppbar(
              leading: Row(
                children: [
                  Image(
                    height: _size.height * 0.027,
                    image: AssetImage(
                        'assets/ui/icons/flag.png'
                    ),
                  ),
                  SizedBox(width: 8,),
                  Text(
                    'Address',
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
            SizedBox(height: _size.height * .025,),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                  horizontal: _size.width * 0.08,
                  vertical: _size.height * 0.03
              ),
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
                  ),
                  SizedBox(height: _size.height * 0.015,),
                  Text(
                    'Jetex Azerbaijan',
                    style: infoStyle,
                  ),
                  SizedBox(height: _size.height * 0.035,),
                  Text(
                    'Address Line 1'.toUpperCase(),
                    style: titleStyle,
                  ),
                  SizedBox(height: _size.height * 0.015,),
                  Text(
                    'Atakent mahallesi 1.etap 2.bolge 215. Sokak Sutek B9 5. girlś 1b JTX-020696',
                    style: infoStyle,
                  ),

                  SizedBox(height: _size.height * 0.035,),
                  Text(
                    'City (Town)'.toUpperCase(),
                    style: titleStyle,
                  ),
                  SizedBox(height: _size.height * 0.015,),
                  Text(
                    'Istanbul',
                    style: infoStyle,
                  ),
                  SizedBox(height: _size.height * 0.035,),
                  Text(
                    'Province'.toUpperCase(),
                    style: titleStyle,
                  ),
                  SizedBox(height: _size.height * 0.015,),
                  Text(
                    'Küçükcekmece',
                    style: infoStyle,
                  ),
                  SizedBox(height: _size.height * 0.035,),
                  Text(
                    'Postcode'.toUpperCase(),
                    style: titleStyle,
                  ),
                  SizedBox(height: _size.height * 0.015,),
                  Text(
                    '34303',
                    style: infoStyle,
                  ),
                  SizedBox(height: _size.height * 0.035,),
                  Text(
                    'Mobile'.toUpperCase(),
                    style: titleStyle,
                  ),
                  SizedBox(height: _size.height * 0.015,),
                  Text(
                    '+905526382533',
                    style: infoStyle,
                  ),
                  SizedBox(height: _size.height * 0.035,),
                  Text(
                    'Phone'.toUpperCase(),
                    style: titleStyle,
                  ),
                  SizedBox(height: _size.height * 0.015,),
                  Text(
                    '99753474930',
                    style: infoStyle,
                  ),
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}
