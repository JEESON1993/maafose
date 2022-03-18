import 'package:flutter/material.dart';
import 'package:maafos/Commons/TextStyles.dart';
import 'package:maafos/Commons/zerostate.dart';
import 'package:maafos/Components/PopularCard.dart';
import 'package:maafos/Providers/PopularProvider.dart';
import 'package:maafos/Shimmers/categorydummy.dart';
import 'package:provider/provider.dart';

class PopularScreen extends StatelessWidget {
  bool loadmore;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: RichText(
            textAlign: TextAlign.justify,
            text: TextSpan(
              text: "Popular",
              style: TextHeadGrey.copyWith(color: Color(0xFFD3184E)),
              children: <TextSpan>[
                TextSpan(
                  text: " Foods",
                  style: TextHeadGrey.copyWith(color: Color(0xFFD3184E)),
                ),
              ],
            ),
          ),
        ),
        Consumer<PopularProvider>(
          builder: (context, data, child) => data.loading
              ? categoryShimmer()
              : data.category.count == 0
                  ? zerostate(
                      icon: 'assets/svg/norestaurant.svg',
                      head: 'Sorry!',
                      sub: 'No Restaurant is found')
                  : Column(
                      children: [
                        Container(
                          // height: 255,
                          child: MediaQuery.removePadding(
                            context: context,
                            //removeTop: true,
                            //removeBottom: true,
                            child: GridView.builder(
                              shrinkWrap: true,
                              itemCount: 8,
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisSpacing: 25,
                                      crossAxisSpacing: 8,
                                      crossAxisCount: 4),
                              itemBuilder: (BuildContext context, int index) {
                                return popularCard(
                                  item: data.category.data[index],
                                  context: context,
                                );
                              },
                            ),
                          ),
                        ),
                        data.loadmore == true
                            ? Container(
                                // height: 255,
                                child: MediaQuery.removePadding(
                                  context: context,
                                  //removeTop: true,
                                  //removeBottom: true,
                                  child: GridView.builder(
                                    shrinkWrap: true,
                                    itemCount: data.category.count - 8,
                                    physics: NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            mainAxisSpacing: 25,
                                            crossAxisSpacing: 8,
                                            crossAxisCount: 4),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return popularCard(
                                        item: data.category.data[index + 8],
                                        context: context,
                                      );
                                    },
                                  ),
                                ),
                              )
                            : Container(),
                      ],
                    ),
        ),
      ],
    );
  }
}
