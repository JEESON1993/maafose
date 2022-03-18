import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:http/http.dart' as http;
import 'package:maafos/Commons/AppConstants.dart';
import 'package:maafos/Commons/ColorConstants.dart';
import 'package:maafos/Commons/zerostate.dart';
import 'package:maafos/Commons/zerostatepng.dart';
import 'package:maafos/Models/notification_model.dart';
import 'package:maafos/Shimmers/nearbydummy.dart';
// import 'package:maafos/Shimmers/quickdummy.dart';

class Notifications extends StatefulWidget {
  var branch;
  Notifications({Key key, this.branch}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  bool loading = true;

  int initialPage = 0;
  NotificationModel notification;

  FlutterSecureStorage storage = FlutterSecureStorage();
  //* FETCH ORDERS
  Future fetchNotifications() async {
    var token = await storage.read(key: "token");
    try {
      final Uri url = Uri.https(baseUrl, apiUrl + "/branch/notify/", {
        "branch": widget.branch,
      });
      final response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        print(response.body.toString());
        setState(() {
          notification = NotificationModel.fromJson(data);

          loading = false;
        });
      }
      if (response.statusCode == 404 || response.statusCode == 400) {
        loading = false;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    fetchNotifications();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        leading: IconButton(
          color: Colors.white,
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context, false),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(12.0))),
        backgroundColor: Color(0xFFD3184E),
        title: Text(
          'Notifications',
          style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 18.0),
        ),
        centerTitle: true,
      ),
      body: loading
          ? nearrestaurantShimmer()
          : notification?.data?.length == 0
              ? zerostatePNG(
                  icon: 'assets/images/norestaurant.png',
                  head: 'Sorry!',
                  sub: 'No Notifications are available!',
                )
              : Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: Colors.transparent),
                  child: Stack(
                    children: [
                      ListView.builder(
                          itemCount: notification?.data?.length,
                          itemBuilder: (context, int index) {
                            var details = notification.data[index];
                            return GestureDetector(
                              child: Padding(
                                padding: EdgeInsets.all(13),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      child: Container(
                                          height: 100,
                                          width: 20,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          child: Stack(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  top: 10,
                                                ),
                                                child: Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 30),
                                                    child: Text(
                                                      details.title,
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        color:
                                                            Color(0xFF9D9D9D),
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 30),
                                                child: Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 20),
                                                    child: Text(
                                                      details.message,
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: Align(
                                                  alignment:
                                                      Alignment.bottomLeft,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 75.0),
                                                    child: Stack(
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .circle_notifications,
                                                          size: 18,
                                                          color: kPinkColor,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ],
                  )),
    );
  }
}
