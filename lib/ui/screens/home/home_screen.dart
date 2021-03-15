import 'package:flutter/material.dart';
import 'package:jetex_app/utils/color_palette.dart';
import 'package:jetex_app/ui/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final PageController _pageController = PageController(
    initialPage: 0,
    viewportFraction: 0.9
  );
  double _pageIndex = 0;


  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    Gradient _gradient = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [ColorPalette.lightPurple, ColorPalette.darkPurple]
    );

    return Scaffold(
      backgroundColor: ColorPalette.lightGrey,
      body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: CustomAppbar(
                  leading: Text(
                    'Dashboard',
                    style: TextStyle(
                        fontFamily: 'HelveticaNeue',
                        fontWeight: FontWeight.w700,
                        fontSize: _size.height * .022,
                        letterSpacing: 0,
                        color: ColorPalette.darkPurple
                    ),
                  ),
                ),
              ),
              SizedBox(height: _size.height * .007,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  'Hello, \nJamil Alizada 👋',
                  style: TextStyle(
                      fontFamily: 'HelveticaNeue',
                      fontWeight: FontWeight.w700,
                      fontSize: _size.height * .039,
                      letterSpacing: 0,
                      color: ColorPalette.darkPurple,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(height: _size.height * .026,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RRGradientButton(
                      onTap: (){
                        print(_pageController.page);
                      },
                      gradient: _gradient,
                      height: _size.height * 0.064,
                      width: _size.width * 0.39,
                      text: 'New Order',
                      color: ColorPalette.darkPurple,
                    ),
                    RRGradientButton(
                      onTap: (){},
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [ColorPalette.sun, ColorPalette.sun]
                      ),
                      height: _size.height * 0.064,
                      width: _size.width * 0.39,
                      text: 'Declare',
                      color: ColorPalette.sun,
                    ),
                  ],
                ),
              ),
              SizedBox(height: _size.height * 0.033,),
              Container(
                height: _size.height * 0.17,
                width: double.infinity,
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (value) {
                    setState(() {
                      _pageIndex = value.toDouble();
                    });
                  },
                  children: _pageViewPages(_size, _gradient),
                ),
              ),
              SizedBox(height: 12,),
              Center(
                child: DotsIndicator(
                  dotsCount: 3,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  position: _pageIndex,
                  decorator: DotsDecorator(
                    size: Size(6, 6),
                    activeSize: Size(6,6),
                    spacing: EdgeInsets.symmetric(horizontal: 2.5),
                    color: Colors.grey[300],
                    activeColor: Colors.grey[400]
                  ),
                ),
              )
            ],
          )
      ),
    );
  }



  List<Widget> _pageViewPages(Size size, Gradient gradient){
    const double padding = 15.0;
    return [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: padding),
        child: Container(
          height: size.height * 0.17,
          width: 200,
          decoration: BoxDecoration(
              gradient: gradient,
              borderRadius: BorderRadius.circular(25)
          ),
          child: Stack(
            children: [
              Opacity(
                opacity: 0.5,
                child: Image.asset(
                  'assets/ui/cloud.png',
                  width: double.infinity,
                  height: size.height * 0.17,
                  fit: BoxFit.cover,
                ),
              ),

              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: [
                        Text(
                          '74.60',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'HelveticaNeue',
                            fontWeight: FontWeight.w100,
                            fontSize: size.height * 0.046
                          ),
                        ),
                        SizedBox(width: 3.0,),
                        Text(
                          'AZN',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'HelveticaNeue',
                              fontWeight: FontWeight.w500,
                              fontSize: 20
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 6,),
                    Text(
                      'Delivery Balance',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'HelveticaNeue',
                          fontWeight: FontWeight.w500,
                          fontSize: 14
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: padding),
        child: Container(
          height: size.height * 0.17,
          width: 200,
          decoration: BoxDecoration(
              gradient: gradient,
              borderRadius: BorderRadius.circular(25)
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.asset(
                  'assets/ui/buildings.png',
                  width: double.infinity,
                  height: size.height * 0.17,
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.bottomCenter,
                ),
              ),

              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 2,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: [
                        Text(
                          '786.84',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'HelveticaNeue',
                              fontWeight: FontWeight.w100,
                              fontSize: size.height * 0.046
                          ),
                        ),
                        SizedBox(width: 3,),
                        Text(
                          'TL',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'HelveticaNeue',
                              fontWeight: FontWeight.w500,
                              fontSize: 20
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 2,),
                    Text(
                      'TL Balance',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'HelveticaNeue',
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        letterSpacing: 0
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: padding),
        child: Container(
          height: size.height * 0.17,
          width: 200,
          decoration: BoxDecoration(
              gradient: gradient,
              borderRadius: BorderRadius.circular(25)
          ),
        ),
      ),
    ];
  }

}
