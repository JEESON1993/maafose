import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:maafos/Commons/ColorConstants.dart';
import 'package:maafos/Commons/TextStyles.dart';
import 'package:intl/intl.dart';

Widget restaurantInfoCard({restaurant, context}) {
  var outputDate =
      (date) => DateFormat('hh:mm a').format(DateFormat('HH:mm').parse(date));
  return Stack(
    children: [
      Container(
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
        height: 250,
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
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: Container(
            // clipBehavior: Clip.antiAlias,
            transform: Matrix4.translationValues(0, 50, 0),
            height: 140,
            // decoration: BoxDecoration(
            //   color: Colors.grey[100],
            //   borderRadius:
            //       BorderRadius.all(Radius.circular(15.0)),
            // ),
            child: Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        restaurant.vendor.featured
                            ? Container(
                                height: 20,
                                width: 76,
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
                              )
                            : Container(
                                height: 20,
                                width: 48,
                              ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 100,
                              child: Text(
                                restaurant.vendor.name.toUpperCase(),
                                maxLines: 2,
                                style: kNavBarTitle1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            restaurant.vendor.cuisine != 'defalut'
                                ? Text(
                                    '${restaurant.vendor.cuisine[0]}'
                                            .toUpperCase() +
                                        '${restaurant.vendor.cuisine}'
                                            .substring(1),
                                    style: TextStyle(
                                      fontFamily: 'ProximaNova',
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700,
                                      color: kGreyLight,
                                    ),
                                  )
                                : Container()
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Container(
                            height: 20,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xFF0A8F15),
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
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(
                      thickness: 0.5,
                      color: kBlackColor,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // restaurant.vendor.storeStatus == true
                      //     ?
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              'assets/svg/cooking.svg',
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
                                fontFamily: 'ProximaNova',
                                fontSize: 9,
                                color: kGreyLight,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
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
                              '10-${restaurant.vendor.avgCookingTime} mins',
                              style: TextStyle(
                                fontFamily: 'ProximaNova',
                                fontSize: 9,
                                color: kGreyLight,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/person-male.png',
                              height: 20,
                              width: 20,
                              color: kGreyLight,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              '₹${restaurant.vendor.avgPersonAmt.toString()}/- for 1',
                              style: TextStyle(
                                fontFamily: 'ProximaNova',
                                fontSize: 9,
                                color: kGreyLight,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
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
