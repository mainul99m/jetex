import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/material.dart';
import 'package:jetex_app/models/payment_history.dart';
import 'package:jetex_app/ui/screens/order/new_order_screen.dart';
import 'package:jetex_app/ui/widgets/widgets.dart';
import 'package:jetex_app/utils/api.dart';
import 'package:jetex_app/utils/color_palette.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jetex_app/utils/custom_icons_icons.dart';

class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {

  int screenID  = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
        initialPage: screenID
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: ColorPalette.lightGrey,
      body: PageView(
        controller: _pageController,
        physics: new NeverScrollableScrollPhysics(),
        children: [
          _orderScreen(_size),
          NewOrdersScreen(
            onTap: (){
              _setScreenID(0);
            },
          )
        ],
      )
    );
  }

  Widget _orderScreen(Size _size){
    return Container(
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
                child: _orderView(),
              ),
            )
          ],
        )
    );
  }

  Widget _orderView(){
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(height: 20,),
        ),
        SliverToBoxAdapter(
          child: OrderViewButton(
            onTap: (){
              _setScreenID(1);
            },
            height: 60,
            title: 'New Orders',
          )
        ),
        SliverToBoxAdapter(
          child: SizedBox(height: 14,),
        ),
        SliverToBoxAdapter(
            child: OrderViewButton(
              onTap: (){

              },
              height: 60,
              title: 'Past Orders',
            )
        ),
        SliverToBoxAdapter(
          child: SizedBox(height: 30,),
        ),
        SliverToBoxAdapter(
          child: Text(
            'Payments History',
            style: TextStyle(
              color: ColorPalette.darkPurple,
              fontFamily: 'HelveticaNeue',
              fontSize: 20,
              fontWeight: FontWeight.w700
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(height: 20,),
        ),

        FutureBuilder<List<PaymentHistory>>(
          future: _getData(),
          builder: (context, snapshot){

            if(snapshot.hasData){
              return SliverList(
                  delegate: SliverChildListDelegate(
                      List.generate(snapshot.data.length, (index) => PaymentHistorySnap(
                        history: snapshot.data[index],
                      )).toList())
              );
            }


            return SliverToBoxAdapter(child: Center(child: CircularProgressIndicator()));
          },
        ),
      ],
    );
  }

  _setScreenID(int id){
    setState(() {
      screenID = id;
    });
    _pageController.animateToPage(id,
        duration: Duration(milliseconds: 500), curve: Curves.easeOutCubic);
  }


  Future<List<PaymentHistory>> _getData() async{
    await Future<dynamic>.delayed(const Duration(milliseconds: 100));

    var list = API.getPaymentHistory();
    return list;
  }



}
