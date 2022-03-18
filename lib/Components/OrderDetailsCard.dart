import 'package:flutter/material.dart';
import 'package:maafos/Models/SingleOrderModel.dart';

Widget orderDetailsCard({Item item,type, context}) {
  List addons = item.addons;

  return Column(
    children: [
      SizedBox(
        height: 5,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      width: 200,
                      child: Text.rich(
                        TextSpan(
                          text: item.name,
                          style: TextStyle(fontSize: 14, color: Colors.black),
                          children: <InlineSpan>[
                            TextSpan(
                              text: '\tx${item.qty.toString()}',
                              style: TextStyle(fontSize: 14, color: Colors.black),
                            ),
                          ],
                        ),
                      )
                  ),
                ],
              ),
              item.addons.length>=0 ? Wrap(
                children: [
                  ...addons.map((e) => Text(e.name+",",style: TextStyle(color: Colors.grey,fontSize: 12),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )),

                ],
              ): Container(
                child: Visibility(
                    visible: false,
                    child: Text("No addons")),),
            ],
          ),
          type == "restaurant"?Text(
            '₹' + (item.packingCharge*item.qty).toString(),
            style: TextStyle(fontSize: 14, color: Colors.black),
          ):
          item.offerPrice != null
              ? Text(
                  '₹' + (item.offerPrice*item.qty).toString(),
                  style: TextStyle(fontSize: 14, color: Colors.black),
                )
              : Text(
                  '₹' + (item.maafosPrice*item.qty).toString(),
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
        ],
      ),
      SizedBox(
        height: 5,
      ),
    ],
  );
}
