//import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jetex_app/models/contact_model.dart';
import 'package:jetex_app/ui/widgets/custom_appbar.dart';
import 'package:jetex_app/utils/api.dart';
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

            FutureBuilder<Contact>(
              future: _getData(),
              builder: (context, snapshot){
                //If get data from api
                if(snapshot.hasData){
                  return Container(
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
                          snapshot.data.name,
                          style: infoStyle,
                        ),
                        SizedBox(height: _size.height * 0.035,),
                        Text(
                          'Address Line 1'.toUpperCase(),
                          style: titleStyle,
                        ),
                        SizedBox(height: _size.height * 0.015,),
                        Text(
                          snapshot.data.addressLine,
                          style: infoStyle,
                        ),

                        SizedBox(height: _size.height * 0.035,),
                        Text(
                          'City (Town)'.toUpperCase(),
                          style: titleStyle,
                        ),
                        SizedBox(height: _size.height * 0.015,),
                        Text(
                          snapshot.data.city,
                          style: infoStyle,
                        ),
                        SizedBox(height: _size.height * 0.035,),
                        Text(
                          'Province'.toUpperCase(),
                          style: titleStyle,
                        ),
                        SizedBox(height: _size.height * 0.015,),
                        Text(
                          snapshot.data.province,
                          style: infoStyle,
                        ),
                        SizedBox(height: _size.height * 0.035,),
                        Text(
                          'Postcode'.toUpperCase(),
                          style: titleStyle,
                        ),
                        SizedBox(height: _size.height * 0.015,),
                        Text(
                          snapshot.data.postCode,
                          style: infoStyle,
                        ),
                        SizedBox(height: _size.height * 0.035,),
                        Text(
                          'Mobile'.toUpperCase(),
                          style: titleStyle,
                        ),
                        SizedBox(height: _size.height * 0.015,),
                        Text(
                          snapshot.data.mobile,
                          style: infoStyle,
                        ),
                        SizedBox(height: _size.height * 0.035,),
                        Text(
                          'Phone'.toUpperCase(),
                          style: titleStyle,
                        ),
                        SizedBox(height: _size.height * 0.015,),
                        Text(
                          snapshot.data.phone,
                          style: infoStyle,
                        ),
                      ],
                    ),
                  );
                }
                //If failed to get data
                if(snapshot.hasError){
                  return SizedBox(height: 100,);
                }
                //While Loading data
                return Center(child: CircularProgressIndicator());
              },
            ),
          ],
        )
      ),
    );
  }

  Future<Contact> _getData() async{
    await Future<dynamic>.delayed(const Duration(milliseconds: 500));
    Contact contact = API.getContact();
    return contact;
  }
}
