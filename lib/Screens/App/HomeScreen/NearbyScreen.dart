import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';s
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:maafos/Commons/TextStyles.dart';
import 'package:maafos/Commons/zerostate.dart';
import 'package:maafos/Components/NearbyCard.dart';
import 'package:maafos/Providers/StoreProvider.dart';
import 'package:maafos/Shimmers/nearbydummy.dart';
import 'package:provider/provider.dart';

class NearbyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List activelist;
    return Consumer<StoreProvider>(
      builder: (context, getstore, child) => getstore.loading
          ? nearrestaurantShimmer()
          : Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      text: "Near",
                      style: TextHeadGrey.copyWith(color: Color(0xFFD3184E)),
                      children: <TextSpan>[
                        TextSpan(
                          text: " Me",
                          style:
                              TextHeadGrey.copyWith(color: Color(0xFFD3184E)),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                getstore.store.restaurant.length == 0
                    ? zerostate(
                        height: 300,
                        icon: 'assets/svg/noresta.svg',
                        head: 'Opps!',
                        sub: 'No Restaurants',
                      )
                    : MediaQuery.removePadding(
                        removeTop: true,
                        context: context,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: getstore.store.restaurant.length,
                          itemBuilder: (context, int index) {
                            if (index == getstore.store.restaurant.length) {
                              return Offstage(
                                offstage: getstore.isPagination,
                                child: CupertinoActivityIndicator(),
                              );
                            }
                            return nearbyCard(
                                item: getstore.store.restaurant[index],
                                branch: getstore.store.branch.radius,
                                context: context);
                          },
                        ),
                      ),
                // SizedBox(
                //   height: 20,
                // ),
                SizedBox(
                  height: 105,
                ),
                Image.asset(
                  'assets/images/make someone happy.png',
                  //color: Colors.grey,
                  //height: 250,
                  //width: 320,
                  fit: BoxFit.contain,
                ),
                // SizedBox(
                //   height: 20,
                // ),
              ],
            ),
    );
  }
}
