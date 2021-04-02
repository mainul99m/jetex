import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jetex_app/models/declare_model.dart';
import 'package:jetex_app/ui/widgets/widgets.dart';
import 'package:jetex_app/utils/color_palette.dart';

class DeclareScreen extends StatefulWidget {

  @override
  _DeclareScreenState createState() => _DeclareScreenState();
}

class _DeclareScreenState extends State<DeclareScreen> {
  File _invoiceImage;
  final picker = ImagePicker();
  
  //controllers
  final countryController = TextEditingController();
  final trackingNumberController = TextEditingController();
  final websiteController = TextEditingController();
  final companyNameController = TextEditingController();
  final categoryController = TextEditingController();
  final priceController = TextEditingController();
  final currencyController = TextEditingController();
  final quantityController = TextEditingController();
  final specialNotesController = TextEditingController();


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    countryController.dispose();
    trackingNumberController.dispose();
    websiteController.dispose();
    companyNameController.dispose();
    categoryController.dispose();
    priceController.dispose();
    currencyController.dispose();
    quantityController.dispose();
    specialNotesController.dispose();
  }
  
  
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
                      controller: countryController,
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
                      controller: trackingNumberController,
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
                      controller: websiteController,
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
                      controller: companyNameController,
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
                      controller: categoryController,
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
                      controller: priceController,
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
                      controller: currencyController,
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
                      controller: quantityController,
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
                      controller: specialNotesController,
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
                          _uploadInvoicePressed(context);
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
                          Navigator.of(context).pop();
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

  Future getImage(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);

    var snackBar = SnackBar(content: Text('Please select your payment method'));
    if(pickedFile != null){
      setState(() {
        _invoiceImage = File(pickedFile.path);
      });
      snackBar = SnackBar(content: Text('Invoice selected'));
    }
    else {
      snackBar = SnackBar(content: Text('Invoice not selected'));
    }


    ScaffoldMessenger.of(context).showSnackBar(snackBar);

  }

  void _uploadInvoicePressed(BuildContext context){
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Select'),
          content: Text(''),
          actions: [
            TextButton(
              onPressed: (){
                getImage(ImageSource.gallery);
                Navigator.pop(context);
              },
              child: Text('Gallery'),
            ),
            TextButton(
              onPressed: (){
                getImage(ImageSource.camera);
              },
              child: Text('Camera'),
            )
          ],
        ),
        barrierDismissible: true
    );
  }

  void _save(){
    var declare = Declare(
      country: countryController.text,
      trackingNumber: trackingNumberController.text,
      website: websiteController.text,
      company: companyNameController.text,
      category: categoryController.text,
      price: priceController.text == '' ? 0 : double.parse(priceController.text),
      currency: currencyController.text,
      quantity: quantityController.text == '' ? 0 : int.parse(quantityController.text),
      notes: specialNotesController.text,
      invoice: _invoiceImage
    );
  }
}
