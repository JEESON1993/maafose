import 'package:flutter/material.dart';
import 'package:maafos/Commons/ColorConstants.dart';
import 'package:maafos/Commons/TextStyles.dart';
import 'package:maafos/Models/StoreModel.dart';
import 'package:maafos/Screens/App/HomeInnerScreens/RestaurentDetails.dart';

Widget quickCard(
    {@required Quick item, @required branch, @required BuildContext context}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RestaurentDetail(
              item: item,
              branch: branch,
            ),
          ));
    },
    child: Stack(
      children: [
        Container(
          width: 160,
          height: 210,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: Colors.black26,
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(45),
            ),
            shadows: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.48),
                  spreadRadius: 2,
                  blurRadius: 5.0,
                  offset: Offset(0, 0))
            ],
            //     borderRadius: BorderRadius.circular(15),
            //     boxShadow: [
            //       BoxShadow(
            //          color: Colors.grey.withOpacity(0.8),
            // spreadRadius: 1,
            // blurRadius: 1,
            // offset: Offset(0, 0))
            //     ],
            image: DecorationImage(
              image: NetworkImage(item.storeBg.image),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              SizedBox(
                height: 220,
                width: 170,
                child: Image.asset(
                  'assets/images/Rectangle1.png',
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          item.name,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.clip,
                          style: Text16white.copyWith(height: 1),
                        ),
                        SizedBox(
                          height: 1.2,
                        ),
                        Text(
                          item.location.address,
                          maxLines: 2,
                          overflow: TextOverflow.clip,
                          textAlign: TextAlign.center,
                          style: kText12white.copyWith(
                              fontWeight: FontWeight.normal,
                              color: Color.fromRGBO(254, 254, 254, .8)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          // child: Image.network(
          //   item.storeBg.image,
          //   fit: BoxFit.cover,
          // ),
        ),
      ],
    ),
  );
}
