import 'package:flutter/material.dart';
import 'package:jetex_app/ui/widgets/widgets.dart';
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
                child: _newOrderView()
            )
          ],
        )
    );
  }
  Widget _newOrderView(){
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
              List.generate(4, (index) => ExpandableOrderSnap())
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 10,))
      ],
    );
  }
}
