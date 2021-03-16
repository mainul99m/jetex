import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jetex_app/ui/widgets/widgets.dart';
import 'package:jetex_app/utils/color_palette.dart';


class ReferralScreen extends StatefulWidget {
  @override
  _ReferralScreenState createState() => _ReferralScreenState();
}

class _ReferralScreenState extends State<ReferralScreen> {

  bool isTransactionListExpanded = false;

  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    Gradient gradient = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [ColorPalette.lightPurple, ColorPalette.darkPurple]
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
                    SvgPicture.asset(
                      'assets/ui/icons/referral.svg'
                    ),
                    SizedBox(width: 8,),
                    Text(
                      'Referral',
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

              //Main
              _bonusBalanceCard(_size, gradient),
              SizedBox(height: 24,),

              _transactionList()
              /*
              SingleChildScrollView(

                child: _transactionList(),
              )
              */
            ],
          )
      ),
    );
  }

  Widget _bonusBalanceCard(Size _size, Gradient gradient){
    return Container(
      child: Column(
        children: [
          Container(
            height: _size.height * 0.16,
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: gradient,
                borderRadius: BorderRadius.circular(25)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 2,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      '5.50',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'HelveticaNeue',
                          fontWeight: FontWeight.w300,
                          fontSize: _size.height * 0.046
                      ),
                    ),
                    SizedBox(width: 3,),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        'AZN',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'HelveticaNeue',
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 5,),
                Text(
                  'Bonus Balance',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'HelveticaNeue',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      letterSpacing: 0
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _transactionList() {

    return CustomScrollView(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            height: 25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Transactions',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: 'HelveticsNeue',
                      color: ColorPalette.darkGrey,
                      fontSize: 13
                  ),
                ),
                MaterialButton(
                  onPressed: (){
                    setState(() {
                      isTransactionListExpanded = !isTransactionListExpanded;
                    });
                  },
                  child: Text(
                    isTransactionListExpanded ? 'Show less' : 'Show more',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: 'HelveticsNeue',
                        color: ColorPalette.darkGrey,
                        fontSize: 13
                    ),
                  ),
                  height: 20,
                  minWidth: 10,
                  padding: EdgeInsets.all(0),
                ),
              ],
            ),
          ),
        ),
        /*
        SliverList(
          delegate: SliverChildBuilderDelegate(
              (BuildContext _context, int index){
                return SliverToBoxAdapter(
                  child: Text('hello'),
                );
              },
              childCount: 1
          )
        )
        */
      ],
    );

    return Column(
      children: [
        Container(
          height: 25,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Transactions',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontFamily: 'HelveticsNeue',
                  color: ColorPalette.darkGrey,
                  fontSize: 13
                ),
              ),
              MaterialButton(
                onPressed: (){
                  setState(() {
                    isTransactionListExpanded = !isTransactionListExpanded;
                  });
                },
                child: Text(
                  isTransactionListExpanded ? 'Show less' : 'Show more',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: 'HelveticsNeue',
                      color: ColorPalette.darkGrey,
                      fontSize: 13
                  ),
                ),
                height: 20,
                minWidth: 10,
                padding: EdgeInsets.all(0),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
