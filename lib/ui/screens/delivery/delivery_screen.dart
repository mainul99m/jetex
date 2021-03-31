import 'package:flutter/material.dart';
import 'package:jetex_app/models/order_model.dart';
import 'package:jetex_app/ui/screens/delivery/request_delivery_screen.dart';
import 'package:jetex_app/ui/widgets/widgets.dart';
import 'package:jetex_app/utils/api.dart';
import 'package:jetex_app/utils/color_palette.dart';

class DeliveryScreen extends StatelessWidget {
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
                  'Delivery',
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
                  child: _deliveryView(_size, context),
                ),
              )
            ],
          )
      ),
    );
  }

  Widget _deliveryView(Size size, BuildContext context){
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(height: size.height*0.034,),
        ),
        SliverToBoxAdapter(
          child: InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RequestDeliveryScreen()),
              );
            },
            borderRadius: BorderRadius.circular(22),
            focusColor: Colors.red,
            splashColor: Colors.grey,
            hoverColor: Colors.black,
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                color: ColorPalette.sun,
                borderRadius: BorderRadius.circular(22)
              ),
              child: Center(
                child: Text(
                  'Request a Delivery',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'HelveticaNeue',
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.25
                  ),
                ),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(height: 16,),
        ),
        SliverToBoxAdapter(
          child: OrderViewButton(
            onTap: (){},
            height: 60,
            title: 'Past Deliveries',
          )
        ),
        SliverToBoxAdapter(
          child: SizedBox(height: 30,),
        ),
        SliverToBoxAdapter(
          child: Text(
            'Tracking',
            style: TextStyle(
                color: ColorPalette.darkPurple,
                fontFamily: 'HelveticaNeue',
                fontSize: 20,
                fontWeight: FontWeight.w700
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(height: 16,),
        ),

        FutureBuilder<List<Order>>(
          future: _getData(),
          builder: (context, snapshot){
            if(snapshot.hasData){
              return SliverList(
                  delegate: SliverChildListDelegate(
                      List.generate(snapshot.data.length, (index) => DeliverySnap(
                        order: snapshot.data[index],
                      )).toList())
              );
            }

            return SliverToBoxAdapter(child: Center(child: CircularProgressIndicator()),);
          },
        )

        /*
        SliverList(
            delegate: SliverChildListDelegate(
                List.generate(3, (index) => DeliverySnap(
                  amount: 7.48,
                  deliveryId: 'JTX-850850',
                  imgURL: '',
                  status: 2,
                )).toList())
        )

         */
      ],
    );
  }

  Future<List<Order>> _getData() async{
    await Future<dynamic>.delayed(Duration(milliseconds: 500));
    List<Order> transactions = API.getNewOrderHistory();
    return transactions;
  }
}
