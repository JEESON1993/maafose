import 'package:flutter/material.dart';
import 'package:maafos/Commons/ColorConstants.dart';
import 'package:maafos/Providers/StoreProvider.dart';
import 'package:maafos/Screens/App/HomeInnerScreens/RestaurentDetails.dart';
import 'package:maafos/Shimmers/bannerdummy.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';

class BannerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<StoreProvider>(
      builder: (context, getstore, child) => getstore.loading
          ? bannerShimmer()
          : Container(
              height: 160,
              margin: EdgeInsets.only(left: 5),
              width: MediaQuery.of(context).size.width,
              child: CarouselSlider(
                  options: CarouselOptions(
                    viewportFraction: .95,
                    autoPlay: true,
                    disableCenter: true,
                  ),
                  items: getstore.store.branch.branchBanner.map((e) {
                    return GestureDetector(
                      onTap: () => e.clickable
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                // ignore: missing_required_param
                                builder: (context) =>
                                    RestaurentDetail(restoId: e.linkId),
                              ),
                            )
                          : null,
                      child: Container(
                        margin: EdgeInsets.only(right: 12),
                        width: 340,
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          color: Colors.black26,
                          shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          // borderRadius: BorderRadius.circular(16),
                          // boxShadow: [
                          //   BoxShadow(
                          //       // color: Color(0x48EEEEEE),
                          //       spreadRadius: 0,
                          //       blurRadius: 0.5,
                          //       offset: Offset(0, 0))
                          // ],
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              e.image.image,
                            ),
                            // image:
                            //     ExactAssetImage('assets/images/populartest.png'),
                          ),
                        ),
                      ),
                    );
                  }).toList())

              // ListView.builder(
              //     padding: EdgeInsets.all(16),
              //     shrinkWrap: true,
              //     scrollDirection: Axis.horizontal,
              //     itemCount: getstore.store.branch.branchBanner.length,
              //     itemBuilder: (context, int index) {
              //       return Container(
              //         margin: EdgeInsets.only(right: 12),
              //         width: 310,
              //         clipBehavior: Clip.antiAlias,
              //         decoration: ShapeDecoration(
              //           color: Colors.black26,
              //           shape: ContinuousRectangleBorder(
              //             borderRadius: BorderRadius.circular(20),
              //           ),
              //           // borderRadius: BorderRadius.circular(16),
              //           // boxShadow: [
              //           //   BoxShadow(
              //           //       // color: Color(0x48EEEEEE),
              //           //       spreadRadius: 0,
              //           //       blurRadius: 0.5,
              //           //       offset: Offset(0, 0))
              //           // ],
              //           image: DecorationImage(
              //             fit: BoxFit.cover,
              //             image: NetworkImage(
              //               getstore
              //                   .store.branch.branchBanner[index].image.image,
              //             ),
              //             // image:
              //             //     ExactAssetImage('assets/images/populartest.png'),
              //           ),
              //         ),
              //       );
              //     }),
              ),
    );
  }
}
