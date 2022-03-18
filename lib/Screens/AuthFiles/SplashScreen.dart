import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maafos/Commons/ColorConstants.dart';
import 'package:maafos/Providers/GetDataProvider.dart';
import 'package:maafos/Screens/AuthFiles/SignUp.dart';
import 'package:maafos/Screens/AuthFiles/welcomelocationfetch.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  startTime() async {
    var _duration = const Duration(seconds: 5);
    return Timer(
      _duration,
      navigationPage,
    );
  }

  Future navigationPage() async {
    String verified = await storage.read(key: "verified");
    String token = await storage.read(key: "token");

    if (verified == 'true') {
      if (token != null) {
        Provider.of<GetDataProvider>(context, listen: false).getData(context);
      }
    } else {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          transitionDuration: const Duration(seconds: 3),
          pageBuilder: (_, __, ___) => SignUp(),
        ),
      );
    }
  }

  AnimationController _controller;
  Animation<double> _animation;
  @override
  void initState() {
    // startTime();
    startTime1();
    // _controller = AnimationController(
    //   duration: const Duration(seconds: 2),
    //   vsync: this,
    // )..reverse(from: 25);
    // _animation = CurvedAnimation(
    //   parent: _controller,
    //   curve: Curves.ease,
    // );
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    super.initState();
  }

  final storage = FlutterSecureStorage();

  // checkUpdate() async {
  //   PackageInfo packageInfo = await PackageInfo.fromPlatform();
  //   String version = packageInfo.version;
  //   var res = await Provider.of<GetDataProvider>(context, listen: false)
  //       .checkUpdate(context);
  //   if (version != res["version"]) {
  //     if (res["force"]) {
  //       return showDialog(
  //           barrierDismissible: false,
  //           context: context,
  //           builder: (context) => AlertDialog(
  //                 titlePadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
  //                 contentPadding: EdgeInsets.fromLTRB(15, 10, 15, 0),
  //                 title: Container(
  //                   padding: EdgeInsets.all(10),
  //                   // height: 100,
  //                   color: Colors.red[200],
  //                   child: Row(
  //                     mainAxisAlignment: MainAxisAlignment.start,
  //                     crossAxisAlignment: CrossAxisAlignment.center,
  //                     children: [
  //                       CircleAvatar(
  //                         radius: 30,
  //                         backgroundColor: Colors.red[900],
  //                         child: Icon(
  //                           Icons.warning,
  //                           color: Colors.white,
  //                         ),
  //                       ),
  //                       SizedBox(
  //                         width: 10,
  //                       ),
  //                       Expanded(
  //                         child: Column(
  //                           mainAxisAlignment: MainAxisAlignment.start,
  //                           crossAxisAlignment: CrossAxisAlignment.start,
  //                           children: [
  //                             Text(
  //                               'Required Update',
  //                               style: kBoldTextLargeW,
  //                             ),
  //                             Text(
  //                               'Please update.',
  //                               style: kMediumTextSmallW,
  //                             ),
  //                           ],
  //                         ),
  //                       )
  //                     ],
  //                   ),
  //                 ),
  //                 content: SingleChildScrollView(
  //                   child: Column(
  //                     mainAxisAlignment: MainAxisAlignment.start,
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: <Widget>[
  //                       SizedBox(
  //                         height: 10,
  //                       ),
  //                       Container(
  //                         child: Text(
  //                           'UPDATE V${res["version"]}',
  //                           style: TextStyle(
  //                               fontFamily: 'Quicksand',
  //                               fontSize: 15,
  //                               color: kSecondayColor,
  //                               fontWeight: FontWeight.w700),
  //                           textAlign: TextAlign.start,
  //                         ),
  //                         decoration: BoxDecoration(
  //                             color: kSecondayColorFaded,
  //                             borderRadius: BorderRadius.circular(5)),
  //                         padding: EdgeInsets.all(5),
  //                       ),
  //                       SizedBox(
  //                         height: 10,
  //                       ),
  //                       Text(
  //                         'FEATURES',
  //                         style: kBoldGrey,
  //                       ),
  //                       Text(
  //                         res["updateMessage"],
  //                         style: kMediumTextSmall,
  //                       ),
  //                       SizedBox(
  //                         height: 10,
  //                       ),
  //                       Text(
  //                         'Please update to continue using whakaaro for a better experiance',
  //                         style: kMediumTextSmall,
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //                 actions: <Widget>[
  //                   TextButton.icon(
  //                     icon: Icon(Icons.check),
  //                     label: Text('Update'),
  //                     onPressed: () {
  //                       launch(res["applink"]);
  //                     },
  //                   ),
  //                 ],
  //                 elevation: 0.5,
  //                 actionsPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
  //                 clipBehavior: Clip.antiAlias,
  //                 shape: RoundedRectangleBorder(
  //                     borderRadius: BorderRadius.circular(10)),
  //               ));
  //     }
  //     showDialog(
  //         barrierDismissible: false,
  //         context: context,
  //         builder: (context) => AlertDialog(
  //               titlePadding: EdgeInsets.fromLTRB(15, 15, 15, 0),
  //               contentPadding: EdgeInsets.fromLTRB(15, 10, 15, 0),
  //               title: SvgPicture.asset(
  //                 "assets/svg/update.svg",
  //                 height: 150,
  //                 width: 150,
  //               ),
  //               content: SingleChildScrollView(
  //                 child: Column(
  //                   mainAxisAlignment: MainAxisAlignment.start,
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: <Widget>[
  //                     SizedBox(
  //                       height: 10,
  //                     ),
  //                     Container(
  //                       child: Text(
  //                         'UPDATE V${res["version"]}',
  //                         style: TextStyle(
  //                             fontFamily: 'Quicksand',
  //                             fontSize: 15,
  //                             color: kSecondayColor,
  //                             fontWeight: FontWeight.w700),
  //                         textAlign: TextAlign.start,
  //                       ),
  //                       decoration: BoxDecoration(
  //                           color: kSecondayColorFaded,
  //                           borderRadius: BorderRadius.circular(5)),
  //                       padding: EdgeInsets.all(5),
  //                     ),
  //                     SizedBox(
  //                       height: 10,
  //                     ),
  //                     Text(
  //                       'FEATURES',
  //                       style: kBoldGrey,
  //                     ),
  //                     Text(
  //                       res["updateMessage"],
  //                       style: kMediumTextSmall,
  //                     ),
  //                     SizedBox(
  //                       height: 10,
  //                     ),
  //                     Text(
  //                       'Would you like to update application to latest version?',
  //                       style: kMediumTextSmall,
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //               actions: <Widget>[
  //                 TextButton(
  //                   child: const Text(
  //                     'Skip',
  //                     style: kBoldGrey,
  //                   ),
  //                   onPressed: () {
  //                     Navigator.pop(context);
  //                     checkLogin();
  //                   },
  //                 ),
  //                 TextButton.icon(
  //                   icon: Icon(Icons.check),
  //                   label: Text('Update'),
  //                   onPressed: () {
  //                     launch(res["applink"]);
  //                   },
  //                 ),
  //               ],
  //               elevation: 0.5,
  //               actionsPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
  //               clipBehavior: Clip.antiAlias,
  //               shape: RoundedRectangleBorder(
  //                   borderRadius: BorderRadius.circular(10)),
  //             ));
  //   }
  //   if (version == res["version"]) {
  //     checkLogin();
  //   }
  // }
  startTime1() async {
    var _duration = const Duration(seconds: 2);
    return Timer(
      _duration,
      checkLogin,
    );
  }

  void checkLogin() async {
    String verified = await storage.read(key: "verified");
    String token = await storage.read(key: "token");

    if (verified == 'true') {
      if (token != null) {
        //Provider.of<GetDataProvider>(context, listen: false).getData(context);
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => WelcomeLocationFetch(),
          ),
          (route) => false,
        );
      }
    } else {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => SignUp(),
        ),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(bottom: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(150),
                  child: Center(
                    child: FadeTransition(
                      opacity: _animation,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 70,
                          ),
                          Image.asset(
                            'assets/images/Maafos icon.png',
                            //color: Colors.white,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SvgPicture.asset(
                            "assets/svg/logowhite.svg",
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                  child: CircularProgressIndicator(
                      strokeWidth: 1.5, color: Colors.white)),
            ],
          ),
          decoration: const BoxDecoration(
            color: kPinkColor,
          ),
        ),
      ),
    );
  }
}
