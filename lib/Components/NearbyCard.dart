import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:maafos/Commons/TextStyles.dart';
import 'package:intl/intl.dart';
import 'package:maafos/Screens/App/HomeInnerScreens/RestaurentDetails.dart';

Widget nearbyCard(
    {@required item, @required branch, @required BuildContext context}) {
  var outputDate =
      (date) => DateFormat('hh:mma').format(DateFormat('HH:mm').parse(date));
  return GestureDetector(
    onTap: () {
      print(branch);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RestaurentDetail(
            item: item,
            branch: branch,
          ),
        ),
      );
    },
    child: Padding(
      padding:
          const EdgeInsets.only(left: 14.0, right: 14.0, bottom: 8.0, top: 8.0),
      child: Container(
        clipBehavior: Clip.antiAlias,
        // margin: EdgeInsets.symmetric(vertical: 5.0),
        decoration: BoxDecoration(
          color: Color(0xFFF6F6F4),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Color(0x48A0A0A0),
              spreadRadius: 2,
              blurRadius: 2,
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              fit: StackFit.passthrough,
              children: [
                SizedBox(
                  height: 180,
                  child: ColorFiltered(
                    colorFilter: item.storeStatus
                        ? item.distance <= branch
                            ? ColorFilter.mode(
                                Colors.transparent,
                                BlendMode.multiply,
                              )
                            : ColorFilter.mode(
                                Colors.grey,
                                BlendMode.saturation,
                              )
                        : ColorFilter.mode(
                            Colors.grey,
                            BlendMode.saturation,
                          ),
                    child: Image.network(
                      item.storeBg.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 180,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    'assets/images/Rectangle1.png',
                    fit: BoxFit.cover,
                  ),
                ),
                item.cuisine != 'defalut'
                    ? Positioned(
                        top: 10,
                        right: 10,
                        child: Container(
                          padding: EdgeInsets.only(
                              top: 5, bottom: 5, right: 10, left: 10),
                          decoration: BoxDecoration(
                            color: Color(0xFFD3184E),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            item.cuisine,
                            style: kText145,
                          ),
                        ),
                      )
                    : Container(),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Color(0xFF0A8F15),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.star,
                          color: Color(0xFFFFFFFF),
                          size: 13.0,
                        ),
                        Text(
                          item.rating.toString(),
                          style: kText146,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.name,
                        style: Text16white,
                        maxLines: 2,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Container(
                        width: 220,
                        child: Text(
                          item.location.address,
                          style: kText144.copyWith(
                              fontWeight: FontWeight.w100,
                              decorationThickness: 1),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: Colors.white,
                            size: 12,
                          ),
                          SizedBox(width: 3),
                          Text(
                            (item.distance.roundToDouble() / 1000).toString() +
                                ' KM',
                            style: kText144.copyWith(fontSize: 11),
                            maxLines: 2,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                item.storeStatus == false
                    ? Positioned(
                        bottom: 10,
                        right: 10,
                        child: Text(
                          "Currently Not Accepting Orders",
                          style: kText12white,
                        ),
                      )
                    : Positioned(
                        bottom: 10,
                        right: 10,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Column(
                                children: [
                                  SvgPicture.asset(
                                    'assets/svg/clock.svg',
                                    color: Color(0xFFFFFFFF),
                                    height: 16.0,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '${outputDate(item.openTime)}-${outputDate(item.closeTime)}',
                                    style: kText10white.copyWith(
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                SvgPicture.asset(
                                  'assets/svg/cooking.svg',
                                  color: Color(0xFFFFFFFF),
                                  height: 16.0,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '${item.avgCookingTime.toString()} mins',
                                  style: kText10white.copyWith(
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
