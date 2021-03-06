import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:maafos/Commons/AppConstants.dart';
import 'package:maafos/Commons/ColorConstants.dart';
import 'package:maafos/Commons/TextStyles.dart';
import 'package:maafos/Commons/zerostate.dart';
import 'package:maafos/Commons/zerostatepng.dart';
import 'package:maafos/Components/ActiveMessageCard.dart';
import 'package:maafos/Components/CartBottomCard.dart';
import 'package:maafos/Components/RestaurantInfoCard.dart';
import 'package:maafos/Components/RestaurentInnerCard.dart';
// import 'package:maafos/Models/RestoProductModel.dart';
import 'package:maafos/Models/RestoProductnewModel.dart';
import 'package:maafos/Providers/StoreProvider.dart';
import 'package:maafos/Shimmers/nearbydummy.dart';
import 'package:maafos/Shimmers/restaurentdetaildummy.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class RestaurentDetail extends StatefulWidget {
  final item, restoId, branch;
  const RestaurentDetail(
      {Key key, @required this.item, this.restoId, this.branch})
      : super(key: key);

  @override
  _RestaurentDetailState createState() => _RestaurentDetailState();
}

class _RestaurentDetailState extends State<RestaurentDetail> {
  bool loading = true;
  RestoProductModelNew restaurant;
  bool isVeg = false;
  var outputDate =
      (date) => DateFormat('hh:mm a').format(DateFormat('HH:mm').parse(date));
  List products = [];
  List<RestoProductNewModelProduct> menu = [];
  final itemScrollController = ItemScrollController();

//* FETCH PRODUCTS AND CATEGORIES.
  Future fetchProducts() async {
    FlutterSecureStorage storage = FlutterSecureStorage();
    final String token = await storage.read(key: "token");
    try {
      final Uri url = Uri.https(baseUrl, apiUrl + "/customer/rest-products/", {
        "restId": widget.restoId ?? widget.item.id,
        "veg": isVeg ? 'veg' : '',
      });
      final response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      var res = jsonDecode(response.body);

      if (response.statusCode == 200) {
        setState(() {
          restaurant = RestoProductModelNew.fromJson(res["data"]);

          menu =
              restaurant.products.where((i) => i.products.length > 0).toList();
          print(menu);
          loading = false;
        });
        if (restaurant.products.length == 0) {}
      }
    } catch (e) {
      print(e);
    }
  }

  dynamic getmodelbranch;
  @override
  void initState() {
    fetchProducts();
    super.initState();
    getmodelbranch = Provider.of<StoreProvider>(context, listen: false);
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future scrollToItem(val) async {
    itemScrollController.scrollTo(
        curve: Curves.ease,
        index: val + 1,
        duration: Duration(
          milliseconds: 500,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.white,
      //   leading: IconButton(
      //     icon: Icon(
      //       Icons.arrow_back,
      //       color: Colors.black,
      //     ),
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //   ),
      // ),

      bottomNavigationBar: cartBottomCard(),
      floatingActionButton: FloatingActionButton.extended(
        //extendedPadding: EdgeInsets.only(bottom: 10),
        backgroundColor: Colors.grey[700],
        icon: Icon(
          Icons.restaurant_menu,
          size: 20,
        ),
        label: Text(
          'BROWSE MENU',
          style: Rdetail,
        ),
        isExtended: true,
        onPressed: () =>
            _showMenuSheet(context, menu, (val) => scrollToItem(val)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: loading
          ? nearrestaurantShimmer()
          : ScrollablePositionedList.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemScrollController: itemScrollController,
              itemCount: restaurant.products == null ? 1 : menu.length + 1,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Column(
                    children: <Widget>[
                      loading
                          ? restaurantdetailShimmer()
                          : restaurantInfoCard(
                              restaurant: restaurant, context: context),
                      SizedBox(
                        height: 60,
                      ),
                      Container(
                        clipBehavior: Clip.antiAlias,
                        // transform: Matrix4.translationValues(0, 50, 0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          // borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Column(
                            children: [
                              Offstage(
                                offstage: restaurant?.products?.length == 0,
                                child: Consumer<StoreProvider>(
                                  builder: (context, data, child) {
                                    return MessageCard(
                                        data: data.store.branch?.activeMessage);
                                  },
                                ),
                              ),
                              // Padding(
                              //   padding:
                              //       const EdgeInsets.symmetric(horizontal: 20),
                              //   // child: Divider(
                              //   //   thickness: 1,
                              //   // ),
                              // ),
                              Offstage(
                                offstage: restaurant?.products?.length == 0,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Switch(
                                        onChanged: (val) {
                                          setState(() {
                                            isVeg = val;
                                            fetchProducts();
                                          });
                                        },
                                        value: isVeg,
                                        activeColor: Colors.green,
                                        activeTrackColor: Colors.green,
                                        inactiveThumbColor: Colors.grey[50],
                                        inactiveTrackColor: Colors.grey[200],
                                      ),
                                      Text(
                                        'VEG ONLY',
                                        style: kTextgrey,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Offstage(
                                offstage: restaurant.products.length != 0,
                                child: zerostatePNG(
                                  height: 400,
                                  size: 180,
                                  icon: 'assets/images/noproducts.png',
                                  head: 'Ohh No!',
                                  sub: 'No Products found!',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                }

                index -= 1;

                List products = menu[index].products;
                return Offstage(
                  offstage: products.length == 0,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: Text(
                            menu[index].category.name,
                            style: TextHeadBlack,
                          ),
                        ),
                        Divider(
                          thickness: 1.5,
                          endIndent: 10,
                          indent: 10,
                        ),
                        Container(
                          color: Color(0x8EF5F5F5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: products.map((val) {
                              return restaurentInnercard(
                                  branchdist: widget.item,
                                  item: val,
                                  store: restaurant.vendor,
                                  context: context,
                                  branch: getmodelbranch.store.branch.radius);
                            }).toList(),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
                );
              }),
    );
  }
}

///[Menu Model Sheet]
Future<void> _showMenuSheet(
    context, menu, Future Function(int val) scrollToItem) async {
  return showModalBottomSheet(
      context: context,
      constraints: BoxConstraints.tightForFinite(width: 320, height: 400),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(10),
          bottom: Radius.circular(10),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      isScrollControlled: true,
      // builder: (context) =>

      // barrierDismissible: true, // user must tap button!
      builder: (BuildContext ctx) {
        return WillPopScope(
          onWillPop: () async => true,
          child: Material(
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
              height: 400,
              width: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Padding(
                  //   padding: const EdgeInsets.all(12.0),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Row(
                  //         mainAxisAlignment: MainAxisAlignment.start,
                  //         children: [
                  //           Padding(
                  //             padding: const EdgeInsets.only(right: 5),
                  //             child: Icon(
                  //               Icons.menu,
                  //               size: 25,
                  //               color: Colors.black,
                  //             ),
                  //           ),
                  //           Text(
                  //             "View Menu",
                  //             style: TextStyle(
                  //               fontWeight: FontWeight.w800,
                  //               color: Colors.black54,
                  //               fontSize: 16,
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //       IconButton(
                  //         onPressed: () {
                  //           Navigator.pop(context);
                  //         },
                  //         icon: const Icon(
                  //           Icons.close,
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 10),
                  //   child: Divider(
                  //     thickness: 1,
                  //   ),
                  // ),
                  Expanded(
                    child: menu.length == 0
                        ? zerostatePNG(
                            height: 400,
                            size: 180,
                            icon: 'assets/images/noproducts.png',
                            head: 'Ohh No!',
                            sub: 'No categories found!',
                          )
                        : Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: menu.length,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () => scrollToItem(index).then(
                                        (value) => Navigator.pop(context)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12, horizontal: 15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              "${menu[index].category.name}",
                                              maxLines: 2,
                                              style: kNavBarTitle.copyWith(
                                                  color: Colors.grey[700]),
                                            ),
                                          ),
                                          Text(
                                            menu[index]
                                                .products
                                                .length
                                                .toString(),
                                            style: kText143.copyWith(
                                                color: Colors.grey[700]),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ),
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
