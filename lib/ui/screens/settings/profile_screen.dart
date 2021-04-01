import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jetex_app/ui/widgets/widgets.dart';
import 'package:jetex_app/utils/color_palette.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  File _image;
  final picker = ImagePicker();


  TextEditingController _nameController = TextEditingController();
  TextEditingController _idController = TextEditingController();
  TextEditingController _finController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _dobController = TextEditingController();
  TextEditingController _adressController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameController.dispose();
    _idController.dispose();
    _finController.dispose();
    _genderController.dispose();
    _phoneController.dispose();
    _dobController.dispose();
    _adressController.dispose();
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: ColorPalette.lightGrey,
        child: Column(
          children: [
            _appBar(size),
            Expanded(
              child: _profileView(size)
            )
          ],
        ),
      ),
    );
  }

  Widget _appBar(Size size) {
    return Container(
      padding: EdgeInsets.fromLTRB(12, size.height * 0.05, 30, 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TopBackButton(
            width: 100,
            color: ColorPalette.darkGrey,
          ),
          SvgPicture.asset(
              'assets/ui/logos/jetex_logo.svg'
          )
        ],
      ),
    );
  }

  Widget _profileView(Size size){

    EdgeInsetsGeometry padding = EdgeInsets.symmetric(horizontal: 30, vertical: size.height * 0.0145);

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: InkWell(
            onTap: (){
              getImage();
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: _image == null ? NetworkImage(
                    'https://i.pravatar.cc/150?img=60'
                  ) : FileImage(_image),
                  radius: size.height * 0.06,
                ),
                CircleAvatar(
                  radius: size.height * 0.06,
                  backgroundColor: ColorPalette.sun.withAlpha(120),
                ),
                Center(
                  child: Icon(
                    Icons.camera_alt_outlined,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        //name
        SliverPadding(
          padding: EdgeInsets.only(
            top: size.height * 0.012,
            bottom: size.height * 0.005
          ),
          sliver: SliverToBoxAdapter(
            child: Text(
              'Jamil ALizada',
              style: TextStyle(
                  fontFamily: 'HelveticaNeue',
                  fontWeight: FontWeight.w500,
                  fontSize: size.height * 0.021,
                  color: ColorPalette.darkGrey
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),

        //ID
        SliverToBoxAdapter(
          child: Text(
            'JTX-111750',
            style: TextStyle(
                fontFamily: 'HelveticaNeue',
                fontWeight: FontWeight.w400,
                fontSize: size.height * 0.017,
                color: Colors.grey[700]
            ),
            textAlign: TextAlign.center,
          ),
        ),

        SliverToBoxAdapter(
          child: SizedBox(height: size.height * 0.05,),
        ),

        //Full Name
        SliverPadding(
          padding: padding,
          sliver: SliverToBoxAdapter(
            child: CustomTextField(
              title: 'Full Name',
              isAuth: false,
              keyboardType: TextInputType.name,
              controller: _nameController,
            ),
          ),
        ),

        //Id Number
        SliverPadding(
          padding: padding,
          sliver: SliverToBoxAdapter(
            child: CustomTextField(
              title: 'ID Number',
              isAuth: false,
              controller: _idController,
            ),
          ),
        ),

        //Fin
        SliverPadding(
          padding: padding,
          sliver: SliverToBoxAdapter(
            child: CustomTextField(
              title: 'Fin',
              isAuth: false,
              controller: _finController,
            ),
          ),
        ),

        //Gender
        SliverPadding(
          padding: padding,
          sliver: SliverToBoxAdapter(
            child: CustomTextField(
              title: 'Gender',
              isAuth: false,
              controller: _genderController,
            ),
          ),
        ),

        //Phone
        SliverPadding(
          padding: padding,
          sliver: SliverToBoxAdapter(
            child: CustomTextField(
              title: 'Phone',
              isAuth: false,
              keyboardType: TextInputType.phone,
              controller: _phoneController,
            ),
          ),
        ),

        //Date of Birth
        SliverPadding(
          padding: padding,
          sliver: SliverToBoxAdapter(
            child: CustomTextField(
              title: 'Date of Birth',
              isAuth: false,
              keyboardType: TextInputType.datetime,
              controller: _dobController,
            ),
          ),
        ),

        //Address
        SliverPadding(
          padding: padding,
          sliver: SliverToBoxAdapter(
            child: CustomTextField(
              title: 'Address',
              isAuth: false,
              keyboardType: TextInputType.streetAddress,
              controller: _adressController,
            ),
          ),
        ),

        //Save Butthon

        SliverPadding(
          padding: padding,
          sliver: SliverToBoxAdapter(
            child: SunButton(
              title: 'Save Changes',
              onTap: (){
                Navigator.of(context).pop();
              },
            )
          ),
        ),

        SliverToBoxAdapter(
          child: SizedBox(height: 14,),
        )

      ],
    );

  }
}
