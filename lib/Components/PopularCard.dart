import 'package:flutter/material.dart';
import 'package:maafos/Commons/TextStyles.dart';
import 'package:maafos/Screens/App/HomeInnerScreens/PopularInner.dart';

Widget popularCard({@required item, @required BuildContext context}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PopularInner(
            categoryid: item.id,
          ),
        ),
      );
    },
    child: Column(
      children: [
        Expanded(
          child: Container(
            height: 100,
            width: 100,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(1, -0),
                  blurRadius: 4,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Image.network(
              item.image.image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 1),
          child: Text(
            item.name.toString().capitalize(),
            style: kText143.copyWith(
                fontWeight: FontWeight.normal,
                fontSize: 15,
                letterSpacing: 0,
                color: Colors.grey[700]),
          ),
        ),
      ],
    ),
  );
}
