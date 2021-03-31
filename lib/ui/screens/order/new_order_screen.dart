import 'package:flutter/material.dart';
import 'package:jetex_app/models/order_model.dart';
import 'package:jetex_app/ui/widgets/widgets.dart';
import 'package:jetex_app/utils/api.dart';
import 'package:jetex_app/utils/color_palette.dart';

class NewOrdersScreen extends StatelessWidget {
  final VoidCallback onTap;

  const NewOrdersScreen({Key key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            CustomAppbar(
              leading: TopBackButton(
                color: ColorPalette.darkPurple,
                onTap: onTap,
              ),
            ),
            SizedBox(height: _size.height * 0.01,),
            Expanded(
                child: _newOrderView(context)
            )
          ],
        )
    );
  }
  Widget _newOrderView(BuildContext context){
    return CustomScrollView(
      slivers: [
        FutureBuilder<List<Order>>(
          future: _getData(),
          builder: (context, snapshot){
            // if(snapshot.hasData){
            //   print("Has data");
            //   print(snapshot.data.length);
            //   return SliverList(
            //     delegate: SliverChildListDelegate(
            //         List.generate(snapshot.data.length, (index) => ExpandableOrderSnap()).toList()
            //     ),
            //   );
            // }
            if(snapshot.hasData){
              return SliverList(
                  delegate: SliverChildListDelegate(
                      List.generate(snapshot.data.length, (index) => ExpandableOrderSnap(
                        order: snapshot.data[index],
                      )).toList())
              );
            }

            return SliverList(
                delegate: SliverChildListDelegate(
                    List.generate(1, (index) => Center(child: CircularProgressIndicator())).toList())
            );
          },
        ),
        // SliverList(
        //   delegate: SliverChildListDelegate(
        //       List.generate(4, (index) => ExpandableOrderSnap())
        //   ),
        // ),
        SliverToBoxAdapter(child: SizedBox(height: 10,))
      ],
    );
  }

  Future<List<Order>> _getData()async{
    await Future<dynamic>.delayed(const Duration(milliseconds: 500));
    List<Order> orders = API.getNewOrderHistory();
    return orders;
  }
}
