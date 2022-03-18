import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geocoder2/geocoder2.dart';
import 'package:maafos/Commons/zerostatepng.dart';
import 'package:yandex_geocoder/yandex_geocoder.dart';
// import 'package:geocoder/model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:maafos/Commons/AppConstants.dart';
import 'package:maafos/Commons/ColorConstants.dart';
import 'package:maafos/Commons/SnackBar.dart';
import 'package:maafos/Commons/TextStyles.dart';
import 'package:maafos/Commons/zerostate.dart';
import 'package:maafos/Components/ActiveMessageCard.dart';
import 'package:maafos/Components/BannerCard.dart';
import 'package:maafos/Components/CartBottomCard.dart';
import 'package:maafos/Components/drawerWidget.dart';
// import 'package:maafos/Models/StoreModel.dart';
import 'package:maafos/Providers/GetDataProvider.dart';
import 'package:maafos/Providers/GroceryProvider.dart';
import 'package:maafos/Providers/PopularProvider.dart';
import 'package:maafos/Providers/StoreProvider.dart';
// import 'package:maafos/Screens/App/Address.dart';
import 'package:maafos/Screens/App/HomeScreen/BottomNav.dart';
import 'package:maafos/Screens/App/HomeScreen/CategoryScreen.dart';
import 'package:maafos/Screens/App/HomeScreen/NearbyScreen.dart';
import 'package:maafos/Screens/App/HomeScreen/PopularScreen.dart';
import 'package:maafos/Screens/App/HomeScreen/QuickScreen.dart';
import 'package:maafos/Screens/App/HomeScreen/RecommendedScreen.dart';
// import 'package:maafos/Screens/App/Orders/MyOrders.dart';
// import 'package:maafos/Screens/AuthFiles/SignUp.dart';
// import 'package:maafos/Shimmers/nearbydummy.dart';
import 'package:provider/provider.dart';
import 'package:permission_handler/permission_handler.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../notification.dart';
import '../saved_address.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  ScrollController _scrollController = ScrollController();

  bool loadmore;
  // var getStore;
  // IO.Socket socket;

  Future _check() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.deniedForever) {
      return showSnackBar(
          duration: Duration(milliseconds: 10000),
          context: context,
          message: "Please Enable Location Permission");
    }
    if (permission == LocationPermission.denied) {
      LocationPermission newpermission = await Geolocator.requestPermission();
      if (newpermission == LocationPermission.deniedForever ||
          newpermission == LocationPermission.denied) {
        openAppSettings();
        return showSnackBar(
            duration: Duration(milliseconds: 10000),
            context: context,
            message: "Please Enable Location Permission");
      }
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      // FetchGeocoder fetchGeocoder = await Geocoder2.getAddressFromCoordinates(
      //     latitude: position.latitude,
      //     longitude: position.longitude,
      //     googleMapApiKey: googleAPI);
      // var first = fetchGeocoder.results.first;
      // var addresses = first.formattedAddress;
      var addresses =
          await Geocoder.google(googleAPI).findAddressesFromCoordinates(
        Coordinates(position.latitude, position.longitude),
      );
      var check = {
        "address": 'Current Location',
        "latitude": position.latitude,
        "longitude": position.longitude,
        "fullAddress": addresses.first.addressLine
      };
      Provider.of<GetDataProvider>(context, listen: false)
          .setCustomerLocation(check);
      Provider.of<StoreProvider>(context, listen: false).fetchStores(
          latitude: position.latitude,
          longitude: position.longitude,
          context: context);
      Provider.of<GroceryProvider>(context, listen: false).fetchGrocery(
          latitude: position.latitude,
          longitude: position.longitude,
          context: context);
      Provider.of<PopularProvider>(context, listen: false).fetchCategory();
    }
    if (permission == LocationPermission.whileInUse) {
      Position position1 = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      // FetchGeocoder fetchGeocoder = await Geocoder2.getAddressFromCoordinates(
      //     latitude: position1.latitude,
      //     longitude: position1.longitude,
      //     googleMapApiKey: googleAPI);
      // var first1 = fetchGeocoder.results.first;
      // var addresses = first1.formattedAddress;
      var addresses = await Geocoder.google(googleAPI)
          .findAddressesFromCoordinates(
              Coordinates(position1.latitude, position1.longitude));

      var check = {
        "address": 'Current Location',
        "latitude": position1.latitude,
        "longitude": position1.longitude,
        "fullAddress": addresses.first.addressLine
      };

      Provider.of<GetDataProvider>(context, listen: false)
          .setCustomerLocation(check);
      Provider.of<StoreProvider>(context, listen: false).fetchStores(
          latitude: position1.latitude,
          longitude: position1.longitude,
          context: context);
      Provider.of<GroceryProvider>(context, listen: false).fetchGrocery(
          latitude: position1.latitude,
          longitude: position1.longitude,
          context: context);
      Provider.of<PopularProvider>(context, listen: false).fetchCategory();
    }
    if (permission == LocationPermission.always) {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      var addresses = await Geocoder.google(googleAPI)
          .findAddressesFromCoordinates(
              Coordinates(position.latitude, position.longitude));
      // FetchGeocoder fetchGeocoder = await Geocoder2.getAddressFromCoordinates(
      //     latitude: position.latitude,
      //     longitude: position.longitude,
      //     googleMapApiKey: googleAPI);
      // var first1 = fetchGeocoder.results.first;
      // var addresses = first1.formattedAddress;
      var check = {
        "address": 'Current Location',
        "latitude": position.latitude,
        "longitude": position.longitude,
        "fullAddress": addresses.first.addressLine
      };

      Provider.of<GetDataProvider>(context, listen: false)
          .setCustomerLocation(check);
      Provider.of<StoreProvider>(context, listen: false).fetchStores(
          latitude: position.latitude,
          longitude: position.longitude,
          context: context);
      Provider.of<GroceryProvider>(context, listen: false).fetchGrocery(
          latitude: position.latitude,
          longitude: position.longitude,
          context: context);
      Provider.of<PopularProvider>(context, listen: false).fetchCategory();
    }
  }

  // void connectSocket(id) {
  //   socket = IO.io(socketUrl, <String, dynamic>{
  //     "transports": ["websocket"],
  //     "autoConnect": false,
  //   });
  //   socket.connect();
  //   socket.onConnect(
  //         (data) => socket.emit('join', 'branch_$id'),
  //   );
  //   socket.onConnect(
  //         (data) => print('connected'),
  //   );
  //   socket.on('branch', (data) {
  //     getStore.message(data);
  //     //*MANAGE IN-APP MESSAGE
  //     // if (data["type"] == 'message') _message(data);
  //   });
  //
  // }
  Future _refreshStores() async {
    _check();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    final customer = Provider.of<GetDataProvider>(context, listen: false);
    Provider.of<StoreProvider>(context, listen: false).fetchStores(
        latitude: position.latitude,
        longitude: position.longitude,
        context: context);
    Provider.of<GroceryProvider>(context, listen: false).fetchGrocery(
        latitude: customer.latitude,
        longitude: customer.longitude,
        context: context);
    Provider.of<PopularProvider>(context, listen: false).fetchCategory();
  }

  Future _loadMoreStores() async {
    final customer = Provider.of<GetDataProvider>(context, listen: false);
    final store = Provider.of<StoreProvider>(context, listen: false);
    if (store.isPagination)
      Provider.of<StoreProvider>(context, listen: false).loadMoreStores(
          latitude: customer.latitude, longitude: customer.longitude);
  }

  getFCM() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      messaging = FirebaseMessaging.instance;
      messaging.getToken().then((value) {
        Provider.of<GetDataProvider>(context, listen: false).updateFCM(value);
      });
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      messaging = FirebaseMessaging.instance;
      messaging.getToken().then((value) {
        Provider.of<GetDataProvider>(context, listen: false).updateFCM(value);
      });
    } else {
      print('User declined or has not accepted permission');
    }
  }

  dynamic popularfoods;
  @override
  void initState() {
    // getStore = Provider.of<StoreProvider>(context, listen: false);
    // print(getStore.store.branch.id.toString());

    // connectSocket(getStore.store.branch.id);
    final customer = Provider.of<GetDataProvider>(context, listen: false);
    getFCM();
    if (customer.currentAddress == 'Current Location') _check();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadMoreStores();
      }
    });
    super.initState();
    // initializeFCM();
    popularfoods = Provider.of<PopularProvider>(context, listen: false);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        print('notification:${message.notification.title}');
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: kWhiteColor,
      // appBar: new AppBar(
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.vertical(
      //       bottom: Radius.circular(32.0),
      //     ),
      //   ),
      //   backgroundColor: kPinkColor,
      //   elevation: 1,
      //   centerTitle: true,
      //   automaticallyImplyLeading: false,
      //   // leading: Padding(
      //   //   padding: const EdgeInsets.all(8.0),
      //   //   child: Icon(Icons.menu),
      //   // ),
      //   title: SvgPicture.asset(
      //     "assets/svg/logowhite.svg",
      //     height: 20,
      //   ),
      //   actions: <Widget>[
      //     new Padding(
      //       padding: const EdgeInsets.all(10.0),
      //       child: new Container(
      //         height: 150.0,
      //         width: 30.0,
      //         child: new IconButton(
      //           icon: new Icon(
      //             Icons.notifications_active_outlined,
      //             color: kWhiteColor,
      //           ),
      //           onPressed: null,
      //         ),
      //       ),
      //     ),
      //   ],
      //   bottom: PreferredSize(
      //     preferredSize: Size.fromHeight(120),
      //     child: Column(
      //       children: [
      //         GestureDetector(
      //           onTap: () {
      //             Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                 builder: (context) => BottomNavigation(
      //                   index: 1,
      //                 ),
      //               ),
      //             );
      //           },
      //           child: Padding(
      //             padding: const EdgeInsets.fromLTRB(18, 0, 18, 8),
      //             child: Container(
      //               padding: EdgeInsets.all(15),
      //               decoration: BoxDecoration(
      //                 borderRadius: BorderRadius.circular(15),
      //                 color: Colors.white,
      //               ),
      //               child: Row(
      //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                 children: [
      //                   Text(
      //                     'Search for hotels and dishes',
      //                     style: kTextgrey,
      //                   ),
      //                   Icon(
      //                     Icons.search,
      //                     size: 20,
      //                     color: kGreyLight,
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           ),
      //         ),
      //         Padding(
      //           padding: const EdgeInsets.symmetric(horizontal: 50),
      //           child: SizedBox(
      //             height: 50,
      //             child: Padding(
      //               padding: const EdgeInsets.symmetric(
      //                   horizontal: 10, vertical: 10),
      //               child: Consumer<GetDataProvider>(
      //                 builder: (context, details, child) => GestureDetector(
      //                   onTap: () {
      //                     Navigator.push(
      //                       context,
      //                       MaterialPageRoute(
      //                         builder: (context) => MapAddress(),
      //                       ),
      //                     );
      //                   },
      //                   child: Row(
      //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                     children: [
      //                       Icon(
      //                         Icons.location_on,
      //                         color: Colors.white,
      //                       ),
      //                       SizedBox(width: 8,),
      //                       Expanded(
      //                         child: Container(
      //                           child: Text(
      //                             details.fullAddress,
      //                             style: TextStyle(
      //                               fontFamily: PrimaryFontName,
      //                               fontWeight: FontWeight.w400,
      //                               color: Colors.white,
      //                               fontSize: 12,
      //                             ),
      //                             maxLines: 1,
      //                             overflow: TextOverflow.ellipsis,
      //                           ),
      //                         ),
      //                       ),
      //                       // SizedBox(width: 20,),
      //                       Icon(
      //                         Icons.arrow_drop_down,color: Colors.white,
      //                       )
      //                     ],
      //                   ),
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      drawer: Drawer(child: DrawerWidget()),
      bottomNavigationBar: cartBottomCard(),
      body: Consumer<StoreProvider>(
        builder: (context, data, child) => NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              print(data.errorCode);
              return [
                SliverAppBar(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(22.0),
                    ),
                  ),
                  automaticallyImplyLeading: false,
                  leading: IconButton(
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      icon: Icon(Icons.menu)),
                  actions: <Widget>[
                    new Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 18.0, bottom: 10.0, top: 10.0),
                      child: new Container(
                        height: 150.0,
                        width: 30.0,
                        child: new IconButton(
                          icon: new Icon(
                            Icons.notifications_active_outlined,
                            color: kWhiteColor,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Notifications(
                                        branch: data.store.branch.id)));
                          },
                        ),
                      ),
                    ),
                  ],
                  backgroundColor: kPinkColor,
                  elevation: 1,
                  title: SvgPicture.asset(
                    "assets/svg/logowhite.svg",
                    height: 20,
                  ),
                  centerTitle: true,
                  pinned: true,
                  expandedHeight: 200,
                  floating: false,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: kPinkColor,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20))),
                            height: 190,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 85,
                                ),
                                Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                BottomNavigation(
                                              index: 1,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            18, 0, 18, 8),
                                        child: Container(
                                          padding: EdgeInsets.all(15),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: Colors.white,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Search for hotels and dishes',
                                                style:
                                                    // TextStyle(
                                                    //     //fontFamily: 'ProximaNova',
                                                    //     fontWeight: FontWeight.w100)
                                                    kTextgrey.copyWith(
                                                        fontSize: 15,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontWeight:
                                                            FontWeight.w400),
                                              ),
                                              Icon(
                                                Icons.search,
                                                size: 20,
                                                color: kGreyLight,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 50),
                                      child: SizedBox(
                                        height: 40,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 10),
                                          child: Consumer<GetDataProvider>(
                                            builder:
                                                (context, details, child) =>
                                                    GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        SavedPage(),
                                                  ),
                                                );
                                              },
                                              child: Container(
                                                height: 30,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Icon(
                                                      Icons.location_on,
                                                      color: Colors.white,
                                                    ),

                                                    Container(
                                                      width: 200,
                                                      child: Text(
                                                        details.fullAddress,
                                                        style: TextStyle(
                                                          fontFamily:
                                                              PrimaryFontName,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Colors.white,
                                                          fontSize: 13,
                                                        ),
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                    // SizedBox(width: 20,),
                                                    Icon(
                                                      Icons.arrow_drop_down,
                                                      color: Colors.white,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 30,
                            margin: EdgeInsets.only(left: 15, right: 15),
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: ContinuousRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(45),
                                    bottomRight: Radius.circular(45)),
                              ),
                              shadows: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.48),
                                    spreadRadius: 2,
                                    blurRadius: 5.0,
                                    offset: Offset(0, 0))
                              ],
                            ),
                            padding: EdgeInsets.only(
                                left: 10, right: 5, top: 5, bottom: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'With maafo',
                                      style: TextStyle(fontSize: 10),
                                    ),
                                    Text('safe,',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10)),
                                    Text(
                                      'our all the deliveries follows safety protocols.',
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  ],
                                ),
                                SvgPicture.asset(
                                  "assets/svg/safe.svg",
                                  width: 35,
                                  height: 16,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ];
            },
            body: RefreshIndicator(
              backgroundColor: Colors.white,
              onRefresh: () => _refreshStores(),
              child: data.isServicable
                  ? SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MessageCard(data: data.store.branch?.activeMessage),
                          // SizedBox(
                          //   height: 15,
                          // ),
                          QuickScreen(),
                          SizedBox(
                            height: 15,
                          ),

                          // SizedBox(
                          //   height: 5,
                          // ),
                          PopularScreen(),
                          SizedBox(
                            height: 20,
                          ),
                          Consumer<PopularProvider>(
                            builder: (context, data, child) => data
                                        .category.count !=
                                    null
                                ? data.category.count > 8
                                    ? Container(
                                        margin: EdgeInsets.only(
                                            left: 10, right: 10),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 35,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            border: Border.all(
                                                width: 1.2,
                                                color: Colors.grey[300])),
                                        child: InkWell(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              data.loadmore == false
                                                  ? Row(
                                                      children: [
                                                        Text(
                                                          'see more',
                                                          style: TextHeadGrey
                                                              .copyWith(
                                                                  color: Color(
                                                                      0xFFD3184E),
                                                                  fontSize: 13),
                                                        ),
                                                        Icon(Icons
                                                            .arrow_drop_down)
                                                      ],
                                                    )
                                                  : Row(
                                                      children: [
                                                        Text(
                                                          'less more',
                                                          style: TextHeadGrey
                                                              .copyWith(
                                                                  color: Color(
                                                                      0xFFD3184E),
                                                                  fontSize: 13),
                                                        ),
                                                        Icon(
                                                            Icons.arrow_drop_up)
                                                      ],
                                                    ),
                                            ],
                                          ),
                                          onTap: () {
                                            setState(() {
                                              if (data.loadmore == false) {
                                                data.loadmore = true;
                                              } else {
                                                data.loadmore = false;
                                              }
                                            });
                                          },
                                        ),
                                      )
                                    : Container()
                                : Center(
                                    child: CircularProgressIndicator(
                                      strokeWidth: 1,
                                      color: Color(0xFFD3184E),
                                    ),
                                  ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          BannerScreen(),
                          SizedBox(
                            height: 5,
                          ),
                          CategoryScreen(),
                          SizedBox(
                            height: 5,
                          ),
                          RecommendedScreen(),
                          SizedBox(
                            height: 5,
                          ),
                          NearbyScreen(),
                        ],
                      ),
                    )
                  : data.errorCode == 100
                      ? zerostatePNG(
                          size: 350,
                          icon: 'assets/images/Artboard.png',
                          head: '',
                          sub: "",
                        )
                      : zerostate(
                          size: 140,
                          icon: 'assets/svg/noservice.svg',
                          head: 'Dang!',
                          sub: "We are currently under maintenance",
                        ),
            )),
      ),
    );
  }
}
