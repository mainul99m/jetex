import 'package:flutter/material.dart';
import 'package:jetex_app/ui/widgets/widgets.dart';
import 'package:jetex_app/utils/color_palette.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:jetex_app/utils/custom_icons_icons.dart';

class OrderScreen extends StatelessWidget {
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
                  child: _orderView(),
                ),
              )
            ],
          )
      ),
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
        SliverList(
          delegate: SliverChildListDelegate(
          List.generate(10, (index) => PaymentHistorySnap(
            amount: 20.5,
            date: '16.03.2021',
            from: 'Sifariş Balansi a',
            to: 'Negd a',
          )).toList())
          )
      ],
    );
  }
}
