import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maafos/Commons/ColorConstants.dart';
import 'package:maafos/Commons/TextStyles.dart';

class MessageCard extends StatelessWidget {
  final data;
  const MessageCard({
    Key key,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Offstage(
      offstage: data?.title == null,
      child: Container(
        decoration: ShapeDecoration(
          // color: Color(0xFFF8E8EC),
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            // side: BorderSide(
            //   width: 1,
            //   color: kPinkColor,
            // ),
            side: BorderSide(width: 0.8, color: kPinkColor),
          ),
        ),
        margin: EdgeInsets.symmetric(horizontal: 14, vertical: 15),
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (data?.icon != null)
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data?.title ?? '',
                      style: kNavBarTitle1,
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      data?.description ?? '',
                      style: kText143.copyWith(fontWeight: FontWeight.normal),
                    )
                  ],
                ),
              ),
            SizedBox(
              width: 10,
            ),
            Container(
              margin: EdgeInsets.only(left: 5),
              child: SvgPicture.network(
                data?.icon?.image ?? '',
                height: 40,
                width: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
