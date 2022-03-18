import 'package:flutter/material.dart';
import 'package:maafos/Commons/ColorConstants.dart';
import 'package:maafos/Commons/SnackBar.dart';
import 'package:maafos/Commons/TextStyles.dart';
import 'package:maafos/Models/MarketProductModel.dart';
import 'package:maafos/Providers/CartProvider.dart';
import 'package:provider/provider.dart';
import 'package:spinner_input/spinner_input.dart';

Widget marketInnercard({
  @required item,
  @required store,
  @required BuildContext context,
}) {
  final getmarket = Provider.of<CartProvider>(context, listen: false);
  return GestureDetector(
    child: Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 8,
                ),
                Container(
                  width: 200,
                  child: Text(
                    item.name.toUpperCase(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: kNavBarTitle1,
                  ),
                ),
                Offstage(
                  offstage: item.status,
                  child: Text(
                    'Currently not available',
                    style: kPink14,
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    item.offerPrice != null
                        ? Row(
                            children: [
                              Text(
                                '\t₹' + item.offerPrice.toString(),
                                style: kNavBarTitle,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                '₹ ' + item.maafosPrice.toString() + ' ',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Quicksand',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[400],
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            ],
                          )
                        : Text(
                            '₹ ' + item.maafosPrice.toString(),
                            style: kNavBarTitle,
                          ),
                  ],
                ),
                item.description != null
                    ? Container(
                        width: 200,
                        child: Text(
                          item.description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: kTextgrey,
                        ),
                      )
                    : Container(
                        width: 200,
                      ),
                item.bestSeller
                    ? Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 18,
                            color: Colors.yellow[800],
                          ),
                          Text(
                            "Best Selling",
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'Proxima Nova Font',
                              color: Colors.yellow[800],
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      )
                    : Container(),
              ],
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    height: 120,
                    width: 130,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: Colors.grey[350],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: item.image != null
                        ? Image.network(
                            item.image.image,
                            height: 120,
                            width: 120,
                            fit: BoxFit.cover,
                          )
                        : Image.asset(
                            'assets/images/maafos_logo.png',
                            height: 110,
                            width: 110,
                            color: Colors.white,
                            fit: BoxFit.cover,
                          )),
              ),
              Positioned(
                bottom: 0,
                left: 20,
                right: 20,
                child: StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                    //////////////////////////////////////

                    var incart = getmarket.cart.firstWhere(
                        (product) => product["id"] == item.ids, orElse: () {
                      return null;
                    });
                    deleteItemCart(val) {
                      getmarket.deleteItem(val);
                    }

                    bool _hasBeenPressed = getmarket.cart.contains("id");
                    /////////////Add Item///////////////////////////////
                    // ignore: non_constant_identifier_names
                    addItemCart(Product, val, qty, totalprice) {
                      if (getmarket.cart.length == 0 &&
                          getmarket.store.isEmpty) {
                        print(val.ids);
                        Map item = {
                          'id': val.ids,
                          '_id': val.id,
                          'name': val.name,
                          'maafosPrice': val.maafosPrice,
                          'price': val.price,
                          'offerPrice': val.offerPrice,
                          'packingCharge': totalprice,
                          'qty': qty,
                        };
                        Map detail = {
                          'storeId': store.id,
                          'name': store.name,
                          'type': store.type,
                          'storeBg': store.storeBg.image,
                          'location': store.location.address,
                          'minimumOrderValue': store.minimumOrderValue,
                        };
                        print(item);
                        getmarket.addItem(item: item, storeDetail: detail);
                        showSnackBar(
                            duration: Duration(milliseconds: 1000),
                            context: context,
                            message: 'Added to cart');
                      } else if (getmarket.store["storeId"] == store.id &&
                          getmarket.store.isNotEmpty) {
                        Map item = {
                          'id': val.id,
                          '_id': val.id,
                          'name': val.name,
                          'maafosPrice': val.maafosPrice,
                          'price': val.price,
                          'offerPrice': val.offerPrice,
                          'packingCharge': totalprice,
                          'qty': qty,
                        };
                        Map detail = {
                          'storeId': store.id,
                          'name': store.name,
                          'type': store.type,
                          'storeBg': store.storeBg.image,
                          'location': store.location.address,
                          'minimumOrderValue': store.minimumOrderValue,
                        };

                        getmarket.addItem(item: item, storeDetail: detail);
                      } else {
                        showDialog<void>(
                          context: context,
                          barrierDismissible: false, // user must tap button!
                          builder: (BuildContext context) {
                            var totalprice = item.offerPrice != null
                                ? item.offerPrice
                                : item.maafosPrice;
                            return AlertDialog(
                              alignment: Alignment.centerLeft,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.shopping_cart_outlined,
                                    color: Colors.blue,
                                    size: 80,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  )
                                ],
                              ),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: <Widget>[
                                    Text(
                                      'Items In Cart',
                                      style:
                                          kNavBarTitle1.copyWith(fontSize: 22),
                                    ),
                                    Text(
                                      'Already items are added in cart.would you like to delete and add this item?',
                                      style: kText8.copyWith(
                                          color: Colors.grey, fontSize: 13),
                                    ),
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.grey),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: TextButton(
                                    child: const Text('Clear'),
                                    onPressed: () {
                                      Provider.of<CartProvider>(context,
                                              listen: false)
                                          .clearItem();
                                      setState(() {
                                        addItemCart(
                                            Product, item, 1, totalprice);
                                        _hasBeenPressed = true;
                                      });
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.grey),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: TextButton(
                                    child: const Text('No, Keep Items'),
                                    onPressed: () {
                                      setState(() {
                                        _hasBeenPressed = false;
                                      });
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    }

                    var ttprice = item.offerPrice != null
                        ? item.offerPrice
                        : item.maafosPrice;
                    return incart == null && !_hasBeenPressed
                        ? GestureDetector(
                            onTap: item.status
                                ? () {
                                    if (store.storeStatus == true) {
                                      setState(() {
                                        addItemCart(Product, item, 1, ttprice);
                                        _hasBeenPressed = true;
                                      });
                                    }
                                  }
                                : null,
                            child: Container(
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: kPinkColor),
                                color: item.status
                                    ? store.storeStatus
                                        ? Colors.white
                                        : Colors.grey[400]
                                    : Colors.grey[400],
                              ),
                              height: 30,
                              child: Center(
                                child: Text(
                                  "ADD",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: kPinkColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Consumer<CartProvider>(
                            builder: (context, data, child) {
                              var qty = data.cart.firstWhere(
                                  (element) => element["id"] == item.id,
                                  orElse: () {
                                return null;
                              });
                              return Container(
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color: kPinkColor,
                                    width: 1.5,
                                  ),
                                ),
                                child: SpinnerInput(
                                  minValue: 0,
                                  maxValue: 80,
                                  step: 1,
                                  plusButton: SpinnerButtonStyle(
                                      elevation: 0,
                                      color: Colors.transparent,
                                      textColor: kGreyLight,
                                      borderRadius: BorderRadius.circular(0)),
                                  minusButton: SpinnerButtonStyle(
                                      elevation: 0,
                                      textColor: kGreyLight,
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(0)),
                                  middleNumberWidth: 30,
                                  middleNumberStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800,
                                      color: kGreyLight),
                                  // spinnerValue: 10,
                                  spinnerValue:
                                      qty == null ? 1 : qty["qty"].toDouble(),
                                  onChange: (value) {
                                    if (value == 0) {
                                      setState(() {
                                        _hasBeenPressed = false;
                                        deleteItemCart(item);
                                      });
                                    } else {
                                      addItemCart(
                                          Product, item, value, ttprice);
                                    }
                                  },
                                ),
                              );
                            },
                          );
                  },
                ),
              )
            ],
          ),
        ],
      ),
    ),
  );
}
