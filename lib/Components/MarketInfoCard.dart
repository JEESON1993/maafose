import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:maafos/Commons/ColorConstants.dart';
import 'package:maafos/Commons/TextStyles.dart';
import 'package:intl/intl.dart';

Widget marketInfoCard({restaurant, context}) {
  var outputDate =
      (date) => DateFormat('hh:mm a').format(DateFormat('HH:mm').parse(date));
  return Stack(
    children: [
      Container(
        height: 250,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                  restaurant.vendor.storeBg.image,
                ),
                fit: BoxFit.fill),
            color: Colors.white,
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(15),
                bottomLeft: Radius.circular(15))),
      ),
      SizedBox(
        height: 250,
        width: MediaQuery.of(context).size.width,
        child: Image.asset(
          'assets/images/Rectangle1.png',
          fit: BoxFit.fill,
        ),
      ),
      Positioned(
        bottom: 0,
        left: 20,
        right: 20,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            // clipBehavior: Clip.antiAlias,
            transform: Matrix4.translationValues(0, 50, 0),
            height: 120,
            // decoration: BoxDecoration(
            //   color: Colors.grey[100],
            //   borderRadius:
            //       BorderRadius.all(Radius.circular(15.0)),
            // ),
            child: Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      restaurant.vendor.featured
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  height: 25,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.yellow[900],
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Recommended",
                                      style: kText10white,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Container(
                              height: 20,
                              width: 90,
                            ),
                      // SizedBox(
                      //   width: 15,
                      // ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              //height: 40,
                              //width: 80,
                              child: Text(
                                restaurant.vendor.name.toUpperCase(),
                                style: kNavBarTitle1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Container(
                              width: 150,
                              child: Text(
                                '${restaurant.vendor.location.address}'
                                    .toLowerCase(),
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontFamily: 'Proxima Nova Font',
                                  fontSize: 10,
                                  color: kGreyLight,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              height: 20,
                              width: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.green,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: 10,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    restaurant.vendor.rating.toString(),
                                    style: kText8,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Divider(
                      thickness: 0.5,
                      color: kGreyLight,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      restaurant.vendor.storeStatus == true
                          ? Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                children: [
                                  SvgPicture.asset(
                                    'assets/svg/clock.svg',
                                    height: 20,
                                    width: 20,
                                    color: kGreyLight,
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    " ${outputDate(restaurant.vendor.openTime)} - ${outputDate(restaurant.vendor.closeTime)}",
                                    style: TextStyle(
                                      fontFamily: 'Proxima Nova Font',
                                      fontSize: 10,
                                      color: kGreyLight,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Container(),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 10),
                      //   child: Column(
                      //     children: [
                      //       SvgPicture.asset(
                      //         'assets/svg/cooking.svg',
                      //         height: 20,
                      //         width: 20,
                      //         color: kGreyLight,
                      //       ),
                      //       SizedBox(
                      //         height: 8,
                      //       ),
                      //       Text(
                      //         '10-${restaurant.vendor.avgCookingTime} mins',
                      //         style: TextStyle(
                      //           fontFamily: 'Proxima Nova Font',
                      //           fontSize: 10,
                      //           color: kGreyLight,
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      Positioned(
        top: 40,
        left: 10,
        child: Container(
          constraints: BoxConstraints.tight(Size(30, 30)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60),
            color: Colors.transparent,
          ),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            padding: EdgeInsets.zero,
            splashColor: Colors.white,
            highlightColor: Colors.white,
            icon: Icon(
              Icons.arrow_back,
              color: kWhiteColor,
            ),
            iconSize: 18,
          ),
        ),
      ),
    ],
  );
}
