import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jetex_app/models/referral_model.dart';
import 'package:jetex_app/models/transaction_model.dart';
import 'package:jetex_app/ui/widgets/widgets.dart';
import 'package:jetex_app/utils/api.dart';
import 'package:jetex_app/utils/color_palette.dart';
import 'package:share/share.dart';


class ReferralScreen extends StatefulWidget {
  @override
  _ReferralScreenState createState() => _ReferralScreenState();
}

class _ReferralScreenState extends State<ReferralScreen> {

  bool isTransactionListExpanded = false;
  String refLink = "jetex.az/ref";

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

              Expanded(
                child: Container(
                  child: _transactionList(_size),
                ),
              )
            ],
          )
      ),
    );
  }

  Widget _bonusBalanceCard(Size _size, Gradient gradient){
    return FutureBuilder<Referral>(
      future: _getReferral(),
      builder: (context, snapshot){
        if(snapshot.hasData){
          return Container(
                height: _size.height * 0.17,
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
                          snapshot.data.balance.toStringAsFixed(2),
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
          );
        }
        return Container(
          height: _size.height * 0.17,
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: gradient,
              borderRadius: BorderRadius.circular(25)
          ),
          child: Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.transparent,
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ),
        );
      },
    );
  }

  Widget _transactionList(Size _size) {

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

        FutureBuilder<List<Transaction>>(
          future: _getData(),
          builder: (context, snapshot){
            if(snapshot.hasData){
              return SliverList(
                delegate: SliverChildListDelegate(
                    List.generate(isTransactionListExpanded ? snapshot.data.length : 1,
                            (index) => ReferralTransactionSnap(
                          transaction: snapshot.data[index],
                        ))
                ),
              );
            }

            return SliverToBoxAdapter(child: Center(child: CircularProgressIndicator()));
          },
        ),

        SliverToBoxAdapter(
          child: SizedBox(
            height: 10,
          ),
        ),
        SliverToBoxAdapter(
          child: _shareReferral(_size),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 46,
          ),
        ),
        SliverToBoxAdapter(
          child: _referralTextInfo(_size),
        ),

      ],
    );
  }

  Widget _shareReferral(Size _size){
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: _size.height * 0.06,
            width: _size.width * 0.55,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20)
            ),
            child: Center(
              child: Text(
                refLink,
                style: TextStyle(
                  color: ColorPalette.mysticBlue,
                  fontFamily: 'HelveticaNeue',
                  fontWeight: FontWeight.w700,
                  fontSize: 12
                ),
              ),
            ),
          ),
          SizedBox(
            height: _size.height * 0.06,
            width: _size.width * 0.24,
            child: ElevatedButton(
              onPressed: ()=>_share(context),
              style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                primary: ColorPalette.darkPurple
              ),
              child: Center(
                child: SvgPicture.asset(
                  'assets/ui/icons/logout.svg',
                  width: _size.width * 0.055,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _referralTextInfo(Size _size){
    return Column(
      children: [
        Text(
          'Get 5% off your next order when you invite a friend.',
          style: TextStyle(
            color: ColorPalette.lightPurple,
            fontFamily: 'HelveticaNeue',
            fontSize: 18,
            fontWeight: FontWeight.w500
          ),
        ),
        SizedBox(height: 20,),
        Text(
          'After the registration through your link, you will receive the “5%” from your friends first order. Every time your friend makes a purchase with JETEX, we will share a part of our income with you.',
          style: TextStyle(
            fontFamily: 'HelveticaNeue',
            fontSize: 15,
            color: ColorPalette.mysticBlue,
            wordSpacing: 5,
            height: 1.7
          ),
        )
      ],
    );
  }

  Future<List<Transaction>> _getData() async{
    await Future<dynamic>.delayed(Duration(milliseconds: 300));
    List<Transaction> transactions = API.getTransaction();
    return transactions;
  }

  Future<Referral> _getReferral() async{
    await Future<dynamic>.delayed(const Duration(milliseconds: 500));
    Referral referral = API.getReferral();
    setState(() {
      refLink = referral.link;
    });
    return referral;
  }

  void _share(BuildContext context){
    final RenderBox box = context.findRenderObject();
    Share.share(
        refLink,
        subject: 'Jetex Login',
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size
    );
  }
}
