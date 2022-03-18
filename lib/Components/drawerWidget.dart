import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:maafos/Commons/TextStyles.dart';
import 'package:maafos/Components/about_us.dart';
import 'package:maafos/Components/termsandconditions.dart';
import 'package:maafos/Providers/GetDataProvider.dart';
import 'package:maafos/Providers/StoreProvider.dart';
import 'package:maafos/Screens/App/Address.dart';
import 'package:maafos/Screens/App/Orders/MyOrders.dart';
import 'package:maafos/Screens/App/saved_address.dart';
import 'package:maafos/Screens/AuthFiles/SignUp.dart';
import 'package:maafos/Shimmers/nearbydummy.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<GetDataProvider>(
        builder: (context, getmodel, child) => getmodel.loading
            ? nearrestaurantShimmer()
            : SafeArea(
                child: SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Card(
                            elevation: 1,
                            margin: EdgeInsets.all(0),
                            color: Colors.white,
                            child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.person),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          getmodel.get.customer.name[0]
                                                  .toUpperCase() +
                                              getmodel.get.customer.name
                                                  .substring(1),
                                          style: Text18,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Text(
                                          '+91-${getmodel?.get?.customer?.user?.username}',
                                          style: kNavTitle1,
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: ListView(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            ListTile(
                              leading: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Icon(
                                  Icons.shopping_bag_outlined,
                                  color: Color(0xFFD3184E),
                                  size: 20.0,
                                ),
                              ),
                              title: Text(
                                "My Orders",
                                style: kNavTitle5,
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MyOrders(),
                                  ),
                                );
                              },
                            ),
                            Divider(
                              thickness: 1,
                              endIndent: 20,
                              indent: 20,
                            ),
                            ListTile(
                              leading: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Icon(
                                  Icons.location_on_outlined,
                                  color: Color(0xFFD3184E),
                                  size: 20.0,
                                ),
                              ),
                              title: Text(
                                "Saved Address",
                                style: kNavTitle5,
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SavedPage(),
                                  ),
                                );
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => SavedPage(),
                                //   ),
                                // );
                              },
                            ),
                            Divider(
                              thickness: 1,
                              endIndent: 20,
                              indent: 20,
                            ),
                            ListTile(
                              leading: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Icon(
                                  Icons.format_list_numbered_rtl_rounded,
                                  color: Color(0xFFD3184E),
                                  size: 20.0,
                                ),
                              ),
                              title: Text(
                                "Terms & Conditions",
                                style: kNavTitle5,
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TermsAndConditions(),
                                  ),
                                );
                              },
                            ),
                            Divider(
                              thickness: 1,
                              endIndent: 20,
                              indent: 20,
                            ),
                            ListTile(
                              leading: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Icon(
                                  Icons.info_outline,
                                  color: Color(0xFFD3184E),
                                  size: 20.0,
                                ),
                              ),
                              title: Text(
                                "About Us",
                                style: kNavTitle5,
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AboutUs(),
                                  ),
                                );
                              },
                            ),
                            Divider(
                              thickness: 1,
                              endIndent: 20,
                              indent: 20,
                            ),
                            Consumer<StoreProvider>(
                              builder: (context, getstore, child) => ListTile(
                                leading: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Icon(
                                    Icons.call,
                                    color: Color(0xFFD3184E),
                                    size: 20.0,
                                  ),
                                ),
                                title: Text(
                                  "Customer Support",
                                  style: kNavTitle5,
                                ),
                                onTap: () {
                                  UrlLauncher.launch(
                                      'tel:+"+91"+${getstore.store.branch.supportNumber}');
                                },
                              ),
                            ),
                            Divider(
                              thickness: 1,
                              endIndent: 20,
                              indent: 20,
                            ),
                            ListTile(
                              leading: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Icon(
                                    Icons.share,
                                    color: Color(0xFFD3184E),
                                    size: 20.0,
                                  )),
                              title: Text(
                                "Share",
                                style: kNavTitle5,
                              ),
                              onTap: () {
                                final box =
                                    context.findRenderObject() as RenderBox;
                                Share.share('Share your App',
                                    subject:
                                        getmodel?.get?.customer?.user?.username,
                                    sharePositionOrigin:
                                        box.localToGlobal(Offset.zero) &
                                            box.size);
                                // void _onShare(BuildContext context) async {
                                //   // A builder is used to retrieve the context immediately
                                //   // surrounding the ElevatedButton.
                                //   //
                                //   // The context's `findRenderObject` returns the first
                                //   // RenderObject in its descendent tree when it's not
                                //   // a RenderObjectWidget. The ElevatedButton's RenderObject
                                //   // has its position and size after it's built.
                                //   final box =
                                //       context.findRenderObject() as RenderBox;

                                //   if (getmodel?.get?.customer?.user?.username
                                //       .isNotEmpty) {
                                //     await Share.share(
                                //         getmodel?.get?.customer?.user?.username,
                                //         subject: getmodel
                                //             ?.get?.customer?.user?.username,
                                //         sharePositionOrigin:
                                //             box.localToGlobal(Offset.zero) &
                                //                 box.size);
                                //   } else {
                                //     await Share.share(
                                //         getmodel?.get?.customer?.user?.username,
                                //         subject: getmodel
                                //             ?.get?.customer?.user?.username,
                                //         sharePositionOrigin:
                                //             box.localToGlobal(Offset.zero) &
                                //                 box.size);
                                //                       Share.shareFiles(imagePaths,
                                // text: text,
                                // subject: subject,
                                // sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
                                //   }
                                // }
                              },
                            ),
                            Divider(
                              thickness: 1,
                              endIndent: 20,
                              indent: 20,
                            ),
                            ListTile(
                              leading: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Icon(
                                  Icons.logout_outlined,
                                  color: Color(0xFFD3184E),
                                  size: 20.0,
                                ),
                              ),
                              title: Text(
                                "Sign Out",
                                style: kNavTitle5,
                              ),
                              onTap: () async {
                                FlutterSecureStorage storage =
                                    FlutterSecureStorage();
                                await storage.deleteAll();
                                SharedPreferences preferences =
                                    await SharedPreferences.getInstance();
                                await preferences.clear();
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignUp(),
                                  ),
                                  (_) => false,
                                );
                              },
                            ),
                            Divider(
                              thickness: 1,
                              endIndent: 20,
                              indent: 20,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 80),
                        // color: Colors.black,
                        width: MediaQuery.of(context).size.width,
                        height: 80,
                        child: Image.asset(
                          'assets/images/maafos illustration.png',
                        ),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                    ],
                  ),
                ),
              ));
  }
}
