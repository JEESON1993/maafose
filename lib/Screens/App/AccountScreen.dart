import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:maafos/Commons/ColorConstants.dart';
import 'package:maafos/Commons/TextStyles.dart';
import 'package:maafos/Components/CartBottomCard.dart';
import 'package:maafos/Providers/GetDataProvider.dart';
import 'package:maafos/Screens/App/Address.dart';
import 'package:maafos/Screens/App/Orders/MyOrders.dart';
import 'package:maafos/Screens/AuthFiles/SignUp.dart';
import 'package:maafos/Shimmers/nearbydummy.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leadingWidth: 0,
        backgroundColor: kWhiteColor,
        elevation: 0,
        title: Text(
          "My Account",
          style: Text18,
        ),
      ),
      bottomNavigationBar: cartBottomCard(),
      body: Consumer<GetDataProvider>(
        builder: (context, getmodel, child) => getmodel.loading
            ? nearrestaurantShimmer()
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Card(
                          elevation: 1,
                          margin: EdgeInsets.all(0),
                          color: Colors.white,
                          child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    getmodel.get.customer.name.toUpperCase(),
                                    style: Text18,
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    '+91-${getmodel?.get?.customer?.user?.username}',
                                    style: kNavBarTitle1,
                                  ),
                                ],
                              )),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          ListTile(
                            leading: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.shopping_bag_outlined,
                                color: Color(0xFFD3184E),
                                size: 25.0,
                              ),
                            ),
                            title: Text(
                              "My Orders",
                              style: kNavBarTitle1,
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
                          ),
                          ListTile(
                            leading: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Icon(
                                Icons.location_on_outlined,
                                color: Color(0xFFD3184E),
                                size: 25.0,
                              ),
                            ),
                            title: Text(
                              "Saved Address",
                              style: kNavBarTitle1,
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MapScreen(),
                                ),
                              );
                            },
                          ),
                          Divider(
                            thickness: 1,
                          ),
                          ListTile(
                            leading: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Icon(
                                Icons.format_list_numbered_rtl_rounded,
                                color: Color(0xFFD3184E),
                                size: 25.0,
                              ),
                            ),
                            title: Text(
                              "Terms & Conditions",
                              style: kNavBarTitle1,
                            ),
                          ),
                          Divider(
                            thickness: 1,
                          ),
                          ListTile(
                            leading: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Icon(
                                Icons.info_outline,
                                color: Color(0xFFD3184E),
                                size: 25.0,
                              ),
                            ),
                            title: Text(
                              "About Us",
                              style: kNavBarTitle1,
                            ),
                          ),
                          Divider(
                            thickness: 1,
                          ),
                          ListTile(
                            leading: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Icon(
                                Icons.call,
                                color: Color(0xFFD3184E),
                                size: 25.0,
                              ),
                            ),
                            title: Text(
                              "Customer Support",
                              style: kNavBarTitle1,
                            ),
                          ),
                          Divider(
                            thickness: 1,
                          ),
                          ListTile(
                            leading: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Icon(
                                Icons.logout_outlined,
                                color: Color(0xFFD3184E),
                                size: 25.0,
                              ),
                            ),
                            title: Text(
                              "Sign Out",
                              style: kNavBarTitle1,
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
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 60,
                      child: Image.asset(
                        'assets/images/drawerbottom.png',
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
