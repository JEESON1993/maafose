import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:maafos/Commons/ColorConstants.dart';
import 'package:maafos/Commons/SnackBar.dart';
import 'package:maafos/Commons/TextStyles.dart';
import 'package:maafos/Models/RestoProductModel.dart';
import 'package:maafos/Providers/CartProvider.dart';

import 'package:provider/provider.dart';
import 'package:spinner_input/spinner_input.dart';
// import 'package:maafos/Commons/FontStyles.dart';

Widget restaurentInnercard(
    {@required item,
    @required BuildContext context,
    @required store,
    @required branch,
    @required branchdist}) {
  var incart2;
  final getmodel = Provider.of<CartProvider>(context, listen: false);
  Widget Spinner({Function(double) onChange1}) {
    return SpinnerInput(
        minValue: 1,
        maxValue: 80,
        step: 1,
        middleNumberPadding:
            EdgeInsets.only(left: 15, right: 15, top: 3, bottom: 3),
        middleNumberBackground: Colors.red[50],
        plusButton: SpinnerButtonStyle(
            elevation: 0,
            color: Color(0xFFD3184E),
            textColor: Colors.white,
            borderRadius: BorderRadius.circular(5)),
        minusButton: SpinnerButtonStyle(
            elevation: 0,
            textColor: Colors.white,
            color: Color(0xFFD3184E),
            borderRadius: BorderRadius.circular(5)),
        middleNumberStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
            color: Color(0xFFD3184E)),
        // spinnerValue: 10,
        spinnerValue: 0,
        // qty == null ? 1 : qty["qty"].toDouble(),
        onChange: onChange1
        // (value) {
        //   // if (value == 0) {
        //   //   setState(() {
        //   //     _hasBeenPressed = false;
        //   //     deleteItemCart(item);
        //   //   });
        //   // } else {
        //   //   addItemCart(Product, item, value,
        //   //       item.addons, ttprice, '');
        //   // }
        // },
        );
  }

  return SingleChildScrollView(
    child: GestureDetector(
      child: Container(
        // margin: EdgeInsets.only(bottom: 2),
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
                  Row(
                    children: [
                      Row(
                        children: [],
                      ),
                      SizedBox(
                        width: 8,
                      ),
                    ],
                  ),
                  // SizedBox(
                  //   height: 8,
                  // ),
                  Row(
                    children: [
                      item.meal == "veg"
                          ? SvgPicture.asset(
                              "assets/svg/veg.svg",
                              height: 13,
                              width: 13,
                            )
                          : SvgPicture.asset(
                              "assets/svg/nonveg.svg",
                              height: 13,
                              width: 13,
                            ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        item.name[0].toUpperCase() + item.name.substring(1),
                        maxLines: 2,
                        style: kNavBarTitle1,
                      ),
                    ],
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
                                  ' ₹' + item.offerPrice.toString(),
                                  style: kNavBarTitle,
                                ),
                                SizedBox(
                                  width: 5,
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
                            maxLines: 3,
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            style: kTextgrey,
                          ),
                        )
                      : Container(
                          width: 200,
                        ),
                  SizedBox(
                    height: 5,
                  ),
                  item.bestSeller
                      ? Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.yellow[900],
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.star,
                                size: 15,
                                color: Colors.white,
                              ),
                              Text(
                                "Best Selling",
                                style: TextStyle(
                                  fontSize: 11,
                                  fontFamily: 'Proxima Nova Font',
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                        )
                      : Container()
                ],
              ),
            ),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 115,
                    width: 120,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: Colors.grey[350],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ColorFiltered(
                        colorFilter: item.status
                            ? store.storeStatus
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
                        // branchdist.distance <= branch
                        //         ?
                        child: item.image != null
                            ? Image.network(
                                item.image.image,
                                height: 115,
                                width: 120,
                                fit: BoxFit.cover,
                              )
                            : Container(
                                padding: EdgeInsets.only(right: 10),
                                child: Image.asset(
                                  'assets/images/maafos_logo.png',
                                  height: 115,
                                  width: 120,
                                  color: Colors.white,
                                  fit: BoxFit.cover,
                                ),
                              )),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 20,
                  right: 20,
                  child: StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                      var incart = getmodel.cart.firstWhere(
                          (product) => product["id"] == item.ids, orElse: () {
                        return null;
                      });

                      /////////

                      deleteItemCart(val) {
                        getmodel.deleteItem(val);
                      }

                      bool _hasBeenPressed = getmodel.cart.contains("id");

                      // ignore: non_constant_identifier_names
                      addItemCart(Product, val, qty, List<dynamic> addons,
                          totalprice, String varients) {
                        if (getmodel.cart.length == 0 &&
                            getmodel.store.isEmpty) {
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
                            'addons': addons,
                            'showAddon': val.showAddon,
                            'variants': varients
                          };
                          Map detail = {
                            'storeId': store.id,
                            'name': store.name,
                            'type': store.type,
                            'cuisine': store.cuisine,
                            'storeBg': store.storeBg.image,
                            'location': store.location.address,
                            'minimumOrderValue': store.minimumOrderValue,
                          };
                          getmodel.addItem(item: item, storeDetail: detail);
                          // showSnackBar(
                          //     duration: Duration(milliseconds: 1000),
                          //     context: context,
                          //     message: 'Added to cart');
                        } else if (getmodel.store["storeId"] == store.id &&
                            getmodel.store.isNotEmpty) {
                          Map item = {
                            'id': val.ids,
                            '_id': val.id,
                            'name': val.name,
                            'maafosPrice': val.maafosPrice,
                            'price': val.price,
                            'offerPrice': val.offerPrice,
                            'packingCharge': totalprice,
                            'qty': qty,
                            'addons': addons,
                            'showAddon': val.showAddon,
                          };
                          Map detail = {
                            'storeId': store.id,
                            'name': store.name,
                            'type': store.type,
                            'cuisine': store.cuisine,
                            'storeBg': store.storeBg.image,
                            'location': store.location.address,
                            'minimumOrderValue': store.minimumOrderValue,
                          };

                          getmodel.addItem(item: item, storeDetail: detail);
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
                                        style: kNavBarTitle1.copyWith(
                                            fontSize: 22),
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
                                          addItemCart(Product, item, 1,
                                              item.addons, totalprice, '');
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

                      //ADD TO CART FROM ADDONS
                      addItemCartfromAddon(
                          Product,
                          val,
                          qty,
                          totalprice,
                          List<dynamic> addons,
                          List<dynamic> varients,
                          List<dynamic> varientsqty,
                          price,
                          i) {
                        if (getmodel.cart.length == 0 &&
                            getmodel.store.isEmpty) {
                          Map item = {
                            'id': val.ids + i,
                            '_id': val.id,
                            'name': val.name,
                            'maafosPrice': val.maafosPrice,
                            'price': val.price,
                            'offerPrice': val.offerPrice,
                            'packingCharge': totalprice,
                            'qty': qty,
                            'addons': addons,
                            'showAddon': val.showAddon,
                          };
                          Map detail = {
                            'storeId': store.id,
                            'name': store.name,
                            'type': store.type,
                            'cuisine': store.cuisine,
                            'storeBg': store.storeBg.image,
                            'location': store.location.address,
                            'minimumOrderValue': store.minimumOrderValue,
                          };
                          getmodel.addItem(item: item, storeDetail: detail);
                          // showSnackBar(
                          //     duration: Duration(milliseconds: 1000),
                          //     context: context,
                          //     message: 'Added to cart');
                        } else if (getmodel.store["storeId"] == store.id &&
                            getmodel.store.isNotEmpty) {
                          Map item = {
                            'id': val.ids + i,
                            '_id': val.id,
                            'name': val.name,
                            'maafosPrice': val.maafosPrice,
                            'price': val.price,
                            'offerPrice': val.offerPrice,
                            'packingCharge': totalprice,
                            'qty': qty,
                            'addons': addons,
                            'showAddon': val.showAddon,
                          };
                          Map detail = {
                            'storeId': store.id,
                            'name': store.name,
                            'type': store.type,
                            'cuisine': store.cuisine,
                            'storeBg': store.storeBg.image,
                            'location': store.location.address,
                            'minimumOrderValue': store.minimumOrderValue,
                          };

                          getmodel.addItem(item: item, storeDetail: detail);
                        } else {
                          showDialog<void>(
                            context: context,
                            barrierDismissible: false, // user must tap button!
                            builder: (BuildContext context) {
                              var totalprice = item.offerPrice != null
                                  ? item.offerPrice
                                  : item.maafosPrice;
                              return AlertDialog(
                                title: const Text(
                                  'Cart Filled',
                                  style: kNavBarTitle,
                                ),
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: const <Widget>[
                                      Text(
                                        'You have items added in ur cart from different store.Would you like to clear the cart?',
                                        style: kText8,
                                      ),
                                    ],
                                  ),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    child: const Text('Clear'),
                                    onPressed: () {
                                      Provider.of<CartProvider>(context,
                                              listen: false)
                                          .clearItem();
                                      setState(() {
                                        addItemCart(Product, item, 1,
                                            item.addons, totalprice, '');
                                        _hasBeenPressed = true;
                                      });
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  TextButton(
                                    child: const Text('No, Keep Items'),
                                    onPressed: () {
                                      setState(() {
                                        _hasBeenPressed = false;
                                      });
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      }

                      _showAddonSheet(BuildContext context, product) {
                        var random = new Random();
                        var addonprice;
                        var varientsprice;
                        bool vals = false;
                        List addonIndex = [];
                        List varientsIndex = [];
                        var addonsIds;
                        var selectedValue;
                        List<int> varientprice2 = [];
                        var totalprice2;
                        int selectedindex = 0;
                        double newvalue = 0.0;
                        // for(int i = 0; i<addonIndex.length;i++){
                        //    addonsIds = addonIndex[i].name.join('1');
                        // }
                        // var addonIndexString = addonIndex.join(",");
                        var totalprice = item.offerPrice != null
                            ? item.offerPrice
                            : item.maafosPrice;

                        //print(product.addons.toString());
                        List addon = product.addons;
                        List varients = product.variants;
                        print(varients);
                        List<bool> _isChecked;
                        List<bool> _isCheckedvariants;
                        bool __isRadioSelected = false;
                        String varientsselected;
                        _isChecked =
                            List<bool>.filled(product.addons.length, false);
                        //varients add////////////////

                        showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            context: context,
                            isScrollControlled: true,
                            builder: (builder) {
                              return StatefulBuilder(
                                builder: (_, setState) => Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 24, vertical: 24),
                                  decoration: new BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: new BorderRadius.only(
                                          topLeft: const Radius.circular(10.0),
                                          topRight:
                                              const Radius.circular(10.0))),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      // Row(
                                      //   mainAxisAlignment:
                                      //       MainAxisAlignment.spaceBetween,
                                      //   crossAxisAlignment:
                                      //       CrossAxisAlignment.start,
                                      //   children: [
                                      //     Expanded(
                                      //       child: Column(
                                      //         mainAxisAlignment:
                                      //             MainAxisAlignment.start,
                                      //         crossAxisAlignment:
                                      //             CrossAxisAlignment.start,
                                      //         children: [
                                      //           // Text(
                                      //           //   item.name,
                                      //           //   maxLines: 1,
                                      //           //   style: TextStyle(
                                      //           //       color: Colors.black,
                                      //           //       fontSize: 16,
                                      //           //       fontWeight:
                                      //           //           FontWeight.bold),
                                      //           // ),
                                      //         ],
                                      //       ),
                                      //     ),
                                      //   ],
                                      // ),
                                      // Divider(),
                                      // Text(
                                      //   "Take Something Extra",
                                      //   style: TextStyle(
                                      //       color: Colors.grey,
                                      //       fontSize: 16,
                                      //       fontWeight: FontWeight.w600),
                                      // ),
                                      // SizedBox(
                                      //   height: 10,
                                      // ),
                                      // Offstage(
                                      //   offstage: varients.length == 0,
                                      //   // child: Container(
                                      //   //   height: 180,
                                      //   //   child: ListView.builder(
                                      //   //       itemCount: varients.length,
                                      //   //       itemBuilder: (context, index) {
                                      //   //         return Text(
                                      //   //             varients[0].toString());
                                      //   //       }),
                                      //   // ),
                                      // ),
                                      //Text(varients[1].name.toString()),
                                      item.variantStatus && item.showVariant
                                          ? Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.bookmark_add,
                                                      color: Color(0xFFD3184E),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      'Quantity',
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xFFD3184E),
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 18),
                                                    ),
                                                  ],
                                                ),
                                                IconButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    icon: Icon(
                                                      Icons.close,
                                                      color: kGreyLight,
                                                    ))
                                              ],
                                            )
                                          : Container(),
                                      item.variantStatus && item.showVariant
                                          ? Divider(
                                              thickness: 1,
                                            )
                                          : Container(),
                                      item.variantStatus && item.showVariant
                                          ? Container(
                                              child: ListView.separated(
                                                  shrinkWrap: true,
                                                  separatorBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    return SizedBox(height: 8);
                                                  },
                                                  itemCount: varients.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Offstage(
                                                        offstage:
                                                            varients[index]
                                                                    .status ==
                                                                false,
                                                        child: Container(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Container(
                                                                width: 160,
                                                                child: Text(
                                                                  varients[
                                                                          index]
                                                                      .name,
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600),
                                                                ),
                                                              ),
                                                              SpinnerInput(
                                                                  minValue: 0,
                                                                  maxValue: 80,
                                                                  step: 1,
                                                                  middleNumberPadding: EdgeInsets.only(
                                                                      left: 15,
                                                                      right: 15,
                                                                      top: 3,
                                                                      bottom:
                                                                          3),
                                                                  middleNumberBackground: Colors
                                                                      .red[50],
                                                                  plusButton: SpinnerButtonStyle(
                                                                      elevation:
                                                                          0,
                                                                      color: Color(
                                                                          0xFFD3184E),
                                                                      textColor: Colors
                                                                          .white,
                                                                      borderRadius: BorderRadius.circular(
                                                                          5)),
                                                                  minusButton: SpinnerButtonStyle(
                                                                      elevation:
                                                                          0,
                                                                      textColor: Colors
                                                                          .white,
                                                                      color: Color(
                                                                          0xFFD3184E),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5)),
                                                                  middleNumberStyle: TextStyle(
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight: FontWeight
                                                                          .w800,
                                                                      color: Color(
                                                                          0xFFD3184E)),
                                                                  // spinnerValue: 10,
                                                                  spinnerValue:
                                                                      selectedindex == index
                                                                          ? newvalue
                                                                          : 0,
                                                                  // qty == null ? 1 : qty["qty"].toDouble(),
                                                                  onChange: (value) {
                                                                    setState(
                                                                        () {
                                                                      selectedindex =
                                                                          index;
                                                                    });
                                                                    if (selectedindex ==
                                                                        index) {
                                                                      newvalue =
                                                                          value;
                                                                      // addvarientoraddons(
                                                                      //     varients[
                                                                      //         selectedindex],
                                                                      //     selectedindex,
                                                                      //     value);
                                                                    }
                                                                  }
                                                                  // (value) {
                                                                  //   // if (value == 0) {
                                                                  //   //   setState(() {
                                                                  //   //     _hasBeenPressed = false;
                                                                  //   //     deleteItemCart(item);
                                                                  //   //   });
                                                                  //   // } else {
                                                                  //   //   addItemCart(Product, item, value,
                                                                  //   //       item.addons, ttprice, '');
                                                                  //   // }
                                                                  // },
                                                                  ),
                                                              // Spinner(onChange1:
                                                              //     (value) {
                                                              //   setState(() {
                                                              //     selectedindex =
                                                              //         index;
                                                              //   });
                                                              //   if (selectedindex ==
                                                              //       index) {
                                                              //     print(
                                                              //         selectedindex);
                                                              //     print(index);
                                                              //   }
                                                              //   // (value) {
                                                              //   // if (value == 0) {
                                                              //   //     setState(() {
                                                              //   //     _hasBeenPressed = false;
                                                              //   //       deleteItemCart(item);
                                                              //   //      });
                                                              //   //    } else {
                                                              //   //     addItemCart(Product, item, value,
                                                              //   //         item.addons, ttprice, '');
                                                              //   //   }
                                                              // }),
                                                              varients[index]
                                                                          .offerPrice !=
                                                                      null
                                                                  ? Container(
                                                                      width: 75,
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.end,
                                                                        children: [
                                                                          RichText(
                                                                            text:
                                                                                TextSpan(children: [
                                                                              TextSpan(
                                                                                  text: '₹ ' + varients[index].maafosPrice.toString() + ' ',
                                                                                  style: TextStyle(
                                                                                    fontSize: 12,
                                                                                    fontFamily: 'Quicksand',
                                                                                    fontWeight: FontWeight.bold,
                                                                                    color: Colors.grey[400],
                                                                                    decoration: TextDecoration.lineThrough,
                                                                                  )),
                                                                              TextSpan(text: '\t₹' + varients[index].offerPrice.toString(), style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w700)),
                                                                            ]),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    )
                                                                  : Container(
                                                                      width: 75,
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.end,
                                                                        children: [
                                                                          Text(
                                                                              '₹ ' + varients[index].maafosPrice.toString(),
                                                                              style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w700)),
                                                                        ],
                                                                      ),
                                                                    )
                                                            ],
                                                          ),
                                                        )
                                                        // RadioListTile(
                                                        //   controlAffinity:
                                                        //       ListTileControlAffinity
                                                        //           .leading,
                                                        //   secondary: varients[index]
                                                        //               .offerPrice !=
                                                        //           null
                                                        //       ? Container(
                                                        //           width: 180,
                                                        //           child: Row(
                                                        //             children: [
                                                        //               Spinner(),
                                                        //               SizedBox(
                                                        //                 width: 4,
                                                        //               ),
                                                        //               RichText(
                                                        //                 text: TextSpan(
                                                        //                     children: [
                                                        //                       TextSpan(
                                                        //                           text: '₹ ' + varients[index].maafosPrice.toString() + ' ',
                                                        //                           style: TextStyle(
                                                        //                             fontSize: 12,
                                                        //                             fontFamily: 'Quicksand',
                                                        //                             fontWeight: FontWeight.bold,
                                                        //                             color: Colors.grey[400],
                                                        //                             decoration: TextDecoration.lineThrough,
                                                        //                           )),
                                                        //                       TextSpan(
                                                        //                           text: '\t₹' + varients[index].offerPrice.toString(),
                                                        //                           style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w700)),
                                                        //                     ]),
                                                        //               ),
                                                        //             ],
                                                        //           ),
                                                        //         )
                                                        //       : Container(
                                                        //           width: 180,
                                                        //           child: Row(
                                                        //             children: [
                                                        //               Spinner(),
                                                        //               SizedBox(
                                                        //                 width: 35,
                                                        //               ),
                                                        //               Text(
                                                        //                   '₹ ' +
                                                        //                       varients[index]
                                                        //                           .maafosPrice
                                                        //                           .toString(),
                                                        //                   style: TextStyle(
                                                        //                       fontSize:
                                                        //                           16,
                                                        //                       color: Colors
                                                        //                           .black,
                                                        //                       fontWeight:
                                                        //                           FontWeight.w700)),
                                                        //             ],
                                                        //           ),
                                                        //         ),
                                                        //   activeColor: kPinkColor,
                                                        //   title: Text(
                                                        //     varients[index].name,
                                                        //     style: TextStyle(
                                                        //         color: Colors.black,
                                                        //         fontSize: 16,
                                                        //         fontWeight:
                                                        //             FontWeight
                                                        //                 .w600),
                                                        //   ),
                                                        //   selected:
                                                        //       __isRadioSelected,
                                                        //   value: varients[index],
                                                        //   onChanged: (value) {
                                                        //     //print(value.hashCode);
                                                        //     setState(() {
                                                        //       selectedValue = value;
                                                        //       varientsselected =
                                                        //           varients[index]
                                                        //               .name;
                                                        //       var price = item
                                                        //                   .offerPrice !=
                                                        //               null
                                                        //           ? item.offerPrice
                                                        //           : item
                                                        //               .maafosPrice;
                                                        //       varientsprice = varients[
                                                        //                       index]
                                                        //                   .offerPrice ==
                                                        //               null
                                                        //           ? varients[index]
                                                        //               .maafosPrice
                                                        //           : varients[index]
                                                        //               .offerPrice;
                                                        //       totalprice2 = price +
                                                        //           varientsprice;
                                                        //       setState(() {
                                                        //         totalprice =
                                                        //             totalprice2;
                                                        //       });
                                                        //     });
                                                        //   },
                                                        //   groupValue: selectedValue,
                                                        // ),
                                                        );
                                                  }),
                                            )
                                          : Container(),
                                      ///////////////////////////////////////////////////////////
                                      item.showAddon && item.addonStatus
                                          ? Row(
                                              children: [
                                                Icon(
                                                  Icons.add,
                                                  color: Color(0xFFD3184E),
                                                  size: 28,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Add Ons',
                                                  style: TextStyle(
                                                      color: Color(0xFFD3184E),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18),
                                                ),
                                              ],
                                            )
                                          : Container(),

                                      item.showAddon && item.addonStatus
                                          ? Divider(
                                              thickness: 1,
                                            )
                                          : Container(),
                                      item.showAddon && item.addonStatus
                                          ? ListView.separated(
                                              shrinkWrap: true,
                                              separatorBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return SizedBox(height: 8);
                                              },
                                              itemCount: addon.length,
                                              itemBuilder: (context, index) {
                                                return Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      width: 160,
                                                      child: Text(
                                                        addon[index].name,
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    ),
                                                    Spinner(),
                                                    addon[index].offerPrice !=
                                                            null
                                                        ? Container(
                                                            width: 75,
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              children: [
                                                                RichText(
                                                                  text: TextSpan(
                                                                      children: [
                                                                        TextSpan(
                                                                            text: '₹ ' +
                                                                                addon[index].maafosPrice.toString() +
                                                                                ' ',
                                                                            style: TextStyle(
                                                                              fontSize: 12,
                                                                              fontFamily: 'Quicksand',
                                                                              fontWeight: FontWeight.bold,
                                                                              color: Colors.grey[400],
                                                                              decoration: TextDecoration.lineThrough,
                                                                            )),
                                                                        TextSpan(
                                                                            text:
                                                                                '\t₹' + addon[index].offerPrice.toString(),
                                                                            style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w700)),
                                                                      ]),
                                                                ),
                                                              ],
                                                            ),
                                                          )
                                                        : Container(
                                                            width: 75,
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Text(
                                                                    '₹ ' +
                                                                        addon[index]
                                                                            .maafosPrice
                                                                            .toString(),
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            16,
                                                                        color: Colors
                                                                            .black,
                                                                        fontWeight:
                                                                            FontWeight.w700)),
                                                              ],
                                                            ),
                                                          )
                                                  ],
                                                );
                                                // CheckboxListTile(
                                                //   controlAffinity:
                                                //       ListTileControlAffinity
                                                //           .leading,
                                                //   secondary: addon[index]
                                                //               .offerPrice !=
                                                //           null
                                                //       ? Container(
                                                //           width: 150,
                                                //           child: Row(
                                                //             children: [
                                                //               Spinner(),
                                                //               SizedBox(
                                                //                 width: 8,
                                                //               ),
                                                //               RichText(
                                                //                 text: TextSpan(
                                                //                     children: [
                                                //                       TextSpan(
                                                //                           text: '₹ ' +
                                                //                               addon[index].maafosPrice.toString() +
                                                //                               ' ',
                                                //                           style: TextStyle(
                                                //                             fontSize: 12,
                                                //                             fontFamily: 'Quicksand',
                                                //                             fontWeight: FontWeight.bold,
                                                //                             color: Colors.grey[400],
                                                //                             decoration: TextDecoration.lineThrough,
                                                //                           )),
                                                //                       TextSpan(
                                                //                           text:
                                                //                               '\t₹' + addon[index].offerPrice.toString(),
                                                //                           style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w700)),
                                                //                     ]),
                                                //               ),
                                                //             ],
                                                //           ),
                                                //         )
                                                //       : Container(
                                                //           width: 150,
                                                //           child: Row(
                                                //             children: [
                                                //               Spinner(),
                                                //               SizedBox(
                                                //                 width: 25,
                                                //               ),
                                                //               Text(
                                                //                   '₹ ' +
                                                //                       addon[index]
                                                //                           .maafosPrice
                                                //                           .toString(),
                                                //                   style: TextStyle(
                                                //                       fontSize:
                                                //                           16,
                                                //                       color: Colors
                                                //                           .black,
                                                //                       fontWeight:
                                                //                           FontWeight.w700)),
                                                //             ],
                                                //           ),
                                                //         ),
                                                //   activeColor: kPinkColor,
                                                //   title: Text(
                                                //     addon[index].name,
                                                //     style: TextStyle(
                                                //         color: Colors.black,
                                                //         fontSize: 16,
                                                //         fontWeight:
                                                //             FontWeight.w600),
                                                //   ),
                                                //   value: _isChecked[index],
                                                //   onChanged: (value) {
                                                //     setState(
                                                //       () {
                                                //         _isChecked[index] =
                                                //             value;
                                                //         if (value == true) {
                                                //           addonprice = addon[
                                                //                           index]
                                                //                       .offerPrice ==
                                                //                   null
                                                //               ? addon[index]
                                                //                   .maafosPrice
                                                //               : addon[index]
                                                //                   .offerPrice;

                                                //           setState(() {
                                                //             addonIndex.add(
                                                //                 addon[index]);
                                                //             totalprice =
                                                //                 totalprice +
                                                //                     addonprice;
                                                //           });
                                                //         }
                                                //         if (value == false) {
                                                //           addonprice = addon[
                                                //                           index]
                                                //                       .offerPrice ==
                                                //                   null
                                                //               ? addon[index]
                                                //                   .maafosPrice
                                                //               : addon[index]
                                                //                   .offerPrice;
                                                //           setState(() {
                                                //             addonIndex.remove(
                                                //                 addon[index]);
                                                //             totalprice =
                                                //                 totalprice -
                                                //                     addonprice;
                                                //           });
                                                //         }
                                                //       },
                                                //     );
                                                //   },
                                                // );
                                              })
                                          : Container(),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.070,
                                      ),
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            primary: kPinkColor,
                                            // shape: RoundedRectangleBorder(
                                            //     borderRadius: BorderRadius.circular(28)
                                            // )
                                          ),
                                          onPressed: () {
                                            addItemCart(
                                                Product,
                                                item,
                                                1,
                                                addonIndex,
                                                totalprice,
                                                varientsselected);
                                            // addItemCartfromAddon(
                                            //     Product,
                                            //     item,
                                            //     1,
                                            //     totalprice,
                                            //     addonIndex,
                                            //     random.nextInt(100).toString());
                                            // print(addonsIds.toString());
                                            Navigator.of(context).pop();
                                            showSnackBar(
                                                duration: Duration(
                                                    milliseconds: 1000),
                                                context: context,
                                                message: 'Added to cart');
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(14.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Item total ₹" +
                                                      totalprice.toString(),
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                Text(
                                                  'ADD ITEM',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ],
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                              );
                            });
                      }

                      var ttprice = item.offerPrice != null
                          ? item.offerPrice
                          : item.maafosPrice;
                      return incart == null && !_hasBeenPressed
                          // branchdist.distance <= branch
                          ? GestureDetector(
                              onTap: item.status
                                  ? () {
                                      if (store.storeStatus == true) {
                                        print("here" + item.addons.toString());
                                        item.showAddon && item.addonStatus ||
                                                item.variantStatus &&
                                                    item.showVariant
                                            ? setState(() {
                                                _showAddonSheet(context, item);
                                                _hasBeenPressed = true;
                                              })
                                            : setState(() {
                                                addItemCart(Product, item, 1,
                                                    item.addons, ttprice, '');
                                                _hasBeenPressed = true;
                                                showSnackBar(
                                                    duration: Duration(
                                                        milliseconds: 1000),
                                                    context: context,
                                                    message: 'Added to cart');
                                              });
                                      } else {
                                        showSnackBar(
                                            duration:
                                                Duration(milliseconds: 1000),
                                            context: context,
                                            message: 'Currently not available');
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
                                        : Colors.grey[400]
                                    // branchdist.distance <= branch
                                    //         ?
                                    ),
                                height: 30,
                                child: Center(
                                  child: item.status || store.storeStatus
                                      ? Text(
                                          "ADD",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'Proxima Nova Font',
                                            color: kPinkColor,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        )
                                      : Text(
                                          "not available",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'Proxima Nova Font',
                                            color: kPinkColor,
                                            fontWeight: FontWeight.w700,
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
                                        addItemCart(Product, item, value,
                                            item.addons, ttprice, '');
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
    ),
  );
}
