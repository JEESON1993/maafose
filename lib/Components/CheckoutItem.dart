import 'package:flutter/material.dart';
import 'package:maafos/Commons/TextStyles.dart';
import 'package:maafos/Providers/CartProvider.dart';
import 'package:provider/provider.dart';

Widget checkoutItemCard({item, context}) {
  final getmodel = Provider.of<CartProvider>(context, listen: false);
  final qty = getmodel.cart
      .firstWhere((element) => element["_id"] == item["_id"], orElse: () {
    return null;
  });
  List addons = item["addons"];

  return Container(
    color: Colors.white,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    //width: 200,
                    child: Text(
                      item["name"],
                      style: kNavBarTitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Text(
                    item["variants"] == null ? '' : item["variants"],
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
              item["showAddon"] == true
                  ? item["addons"].length > 0
                      ? Wrap(
                          children: [
                            ...addons.map((e) => Text(
                                  e.name + ",",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                )),
                          ],
                        )
                      : Container(
                          child: Visibility(
                              visible: false, child: Text("No addons")),
                        )
                  : Container(
                      child:
                          Visibility(visible: false, child: Text("No addons")),
                    ),
            ],
          ),
          Row(
            children: [
              Text(
                'Qty:\t${qty["qty"].toString()}',
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  '\u20B9' + (item["packingCharge"] * item["qty"]).toString(),
                  style: kText143,
                ),
              ),
              // IconButton(
              //   onPressed: () =>
              //       Provider.of<CartProvider>(context, listen: false)
              //           .deleteItemCart(item),
              //   iconSize: 10,
              //   icon: Icon(
              //     Icons.delete_outline_outlined,
              //     size: 18,
              //     color: Colors.red[900],
              //   ),
              // )
            ],
          )
        ],
      ),
    ),
  );
}
