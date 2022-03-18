import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geocoder2/geocoder2.dart';
import 'package:geolocator/geolocator.dart';
import 'package:maafos/Commons/AppConstants.dart';
import 'package:maafos/Commons/ColorConstants.dart';
import 'package:maafos/Commons/TextStyles.dart';
import 'package:maafos/Providers/GetDataProvider.dart';
import 'package:maafos/Screens/AuthFiles/SignUp.dart';
import 'package:provider/provider.dart';
// import 'package:flutter_animated_splash/flutter_animated_splash.dart';

class WelcomeLocationFetch extends StatefulWidget {
  const WelcomeLocationFetch({key}) : super(key: key);

  @override
  _WelcomeLocationFetchState createState() => _WelcomeLocationFetchState();
}

class _WelcomeLocationFetchState extends State<WelcomeLocationFetch>
    with TickerProviderStateMixin {
  Future check() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var addresses =
        await Geocoder.google(googleAPI).findAddressesFromCoordinates(
      Coordinates(position.latitude, position.longitude),
    );
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
  }

  final storage = FlutterSecureStorage();
  startTime() async {
    var _duration = const Duration(seconds: 3);
    return Timer(
      _duration,
      navigationPage,
    );
  }

  Future navigationPage() async {
    String verified = await storage.read(key: "verified");
    String token = await storage.read(key: "token");
    Provider.of<GetDataProvider>(context, listen: false).getData(context);
    // if (verified == 'true') {
    //   if (token != null) {

    //   }
    // } else {
    //   Navigator.of(context).pushReplacement(
    //     PageRouteBuilder(
    //       transitionDuration: const Duration(seconds: 4),
    //       pageBuilder: (_, __, ___) => SignUp(),
    //     ),
    //   );
    // }
  }

  Tween<double> _tweenSize;
  AnimationController _controller;
  Animation<double> _animation;
  AnimationController _controller1;
  Animation<double> _animation1;
  @override
  void initState() {
    // TODO: implement initState
    check();
    startTime();
    // _controller =
    //     new AnimationController(vsync: this, duration: Duration(seconds: 5))
    //       ..repeat();
    // animation = new CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    // controller =
    //     AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    // controller.forward();

    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: false, period: Duration(milliseconds: 4000));
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: kPinkColor),
        child: Center(
          child: Container(
            height: 300,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    height: 150,
                    width: 200,
                    child: Image.asset(
                      'assets/images/loc11noback.gif',
                      color: Colors.white,
                    )),
                // ScaleTransition(
                //   scale: animation,
                //   child: Container(
                //     margin: EdgeInsets.only(left: 20, right: 20),
                //     child: Divider(
                //       thickness: 2,
                //       color: Colors.grey,
                //     ),
                //   ),
                // ),

                SlideTransition(
                  position:
                      Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0))
                          .animate(_controller),
                  child: Container(
                    //height: 300,
                    child: Column(
                      children: [
                        Text(
                          'DELIVERING TO',
                          style: kTextgrey4.copyWith(
                              fontSize: 18, color: Colors.white),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Consumer<GetDataProvider>(
                            builder: (context, details, child) => Container(
                                margin: EdgeInsets.only(left: 20, right: 20),
                                child: Text(
                                  details.fullAddress,
                                  overflow: TextOverflow.clip,
                                  textAlign: TextAlign.center,
                                  style: Rdetail.copyWith(
                                      fontSize: 13, color: Colors.white),
                                )))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// Container(
//             height: MediaQuery.of(context).size.height,
//             width: MediaQuery.of(context).size.width,
//             decoration: BoxDecoration(
//                 image: DecorationImage(
//                     image: AssetImage(
//                       'assets/images/Rectangle1.png',
//                     ),
//                     fit: BoxFit.cover)),
//           )