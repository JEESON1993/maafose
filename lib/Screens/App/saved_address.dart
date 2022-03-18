import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoder2/geocoder2.dart';
import 'package:geolocator/geolocator.dart';
import 'package:maafos/Commons/AppConstants.dart';
import 'package:maafos/Commons/ColorConstants.dart';
import 'package:maafos/Commons/SnackBar.dart';
import 'package:maafos/Commons/TextStyles.dart';
import 'package:maafos/Commons/zerostate.dart';
import 'package:maafos/Providers/GetDataProvider.dart';
import 'package:maafos/Providers/GroceryProvider.dart';
import 'package:maafos/Providers/StoreProvider.dart';
import 'package:maafos/Screens/App/Address.dart';
import 'package:maafos/Screens/App/mapSeachScreen.dart';
import 'package:provider/provider.dart';

class SavedPage extends StatefulWidget {
  SavedPage({Key key}) : super(key: key);

  @override
  _SavedPageState createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
  Future _selectCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      return showSnackBar(
          duration: Duration(milliseconds: 10000),
          context: context,
          message: 'Please Enable Location Permission');
    }
    if (permission == LocationPermission.denied) {
      LocationPermission newpermission = await Geolocator.requestPermission();
      if (newpermission == LocationPermission.deniedForever ||
          newpermission == LocationPermission.denied) {
        return showSnackBar(
            duration: Duration(milliseconds: 10000),
            context: context,
            message: 'Please Enable Location Permission');
      }
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      // FetchGeocoder fetchGeocoder = await Geocoder2.getAddressFromCoordinates(
      //     latitude: position.latitude,
      //     longitude: position.longitude,
      //     googleMapApiKey: googleAPI);
      // var first1 = fetchGeocoder.results.first;
      // var addresses = first1.formattedAddress;
      var addresses = await Geocoder.google(googleAPI)
          .findAddressesFromCoordinates(
              Coordinates(position.latitude, position.longitude));

      var check = {
        "currentAddress": 'Current Location',
        "latitude": position.latitude,
        "longitude": position.longitude,
        "fullAddress": addresses.first.addressLine
      };
      Provider.of<GetDataProvider>(context, listen: false)
          .setCustomerLocation(check);
      Provider.of<StoreProvider>(context, listen: false).fetchStores(
          latitude: position.latitude, longitude: position.longitude);
      Provider.of<GroceryProvider>(context, listen: false).fetchGrocery(
          latitude: position.latitude, longitude: position.longitude);
    }
    if (permission == LocationPermission.whileInUse) {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      // FetchGeocoder fetchGeocoder = await Geocoder2.getAddressFromCoordinates(
      //     latitude: position.latitude,
      //     longitude: position.longitude,
      //     googleMapApiKey: googleAPI);
      // var first1 = fetchGeocoder.results.first;
      // var addresses = first1.formattedAddress;
      var addresses = await Geocoder.google(googleAPI)
          .findAddressesFromCoordinates(
              Coordinates(position.latitude, position.longitude));
      var check = {
        "currentAddress": 'Current Location',
        "latitude": position.latitude,
        "longitude": position.longitude,
        "fullAddress": addresses.first.addressLine
      };
      Provider.of<GetDataProvider>(context, listen: false)
          .setCustomerLocation(check);
      Provider.of<StoreProvider>(context, listen: false).fetchStores(
          latitude: position.latitude, longitude: position.longitude);
      Provider.of<GroceryProvider>(context, listen: false).fetchGrocery(
          latitude: position.latitude, longitude: position.longitude);
    }
    Navigator.pop(context);
  }

  Future _selectLocation(address) async {
    var selecetd = {
      "address": address["address"],
      "landmark": address["landmark"],
      "latitude": address["coordinates"][1],
      "longitude": address["coordinates"][0],
      "fullAddress": address["formattedAddress"],
      "addressType": address["addressType"]
    };
    Provider.of<GetDataProvider>(context, listen: false)
        .setCustomerLocation(selecetd);
    Provider.of<StoreProvider>(context, listen: false).fetchStores(
        latitude: address["coordinates"][1],
        longitude: address["coordinates"][0]);
    Provider.of<GroceryProvider>(context, listen: false).fetchGrocery(
        latitude: address["coordinates"][1],
        longitude: address["coordinates"][0]);
    Navigator.pop(
      context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: kPinkColor,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back_rounded),
          color: Colors.white,
        ),
        title: const Text(
          'Saved Address',
          style: kText11white,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MapScreen()),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: kPinkColor,
        tooltip: 'Add Address',
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              //height: 57,
              // constraints: BoxConstraints.tight(Size(30, 30)),
              margin: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kWhiteColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // SizedBox(
                  //   height: 8,
                  // ),
                  // GestureDetector(
                  //   onTap: () {
                  //     Navigator.pushReplacement(context,
                  //         MaterialPageRoute(builder: (context) => MapSearch()));
                  //   },
                  //   child: Container(
                  //     width: MediaQuery.of(context).size.width,
                  //     child: TextField(
                  //       enabled: false,
                  //       autofocus: false,
                  //       // focusNode: false,

                  //       // controller: searchController,
                  //       decoration: InputDecoration(
                  //         contentPadding: EdgeInsets.only(
                  //           left: 10,
                  //         ),
                  //         suffixIcon: Icon(
                  //           Icons.search,
                  //           color: kPinkColor,
                  //         ),
                  //         // filled: true,
                  //         border: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(10),
                  //           borderSide: BorderSide(
                  //               width: 0,
                  //               style: BorderStyle.none,
                  //               color: Colors.grey),
                  //         ),
                  //         hintText: 'Search for area,streate,name...',
                  //         hintStyle: kTextgrey,
                  //       ),
                  //       // onChanged: (val) {
                  //       //   findPlace(val);
                  //       // },
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
            // Divider(
            //   color: kPinkColor,
            //   height: 30,
            // ),
            ListTile(
              onTap: () => _selectCurrentLocation(),
              enableFeedback: true,
              horizontalTitleGap: 5,
              minVerticalPadding: 1,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Current Location',
                    style: Text18Pink,
                  ),
                  Text(
                    'Use your current location for delivery.',
                    style: kText143,
                  ),
                ],
              ),
              // subtitle: Container(
              //   child: Text(
              //     'Use your current location for delivery.',
              //     style: kText143,
              //   ),
              // ),
              leading: SizedBox(
                child: SvgPicture.asset(
                  'assets/svg/gps.svg',
                  width: 20,
                  height: 20,
                  color: kPinkColor,
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: new Container(
                    margin: const EdgeInsets.only(right: 15.0),
                    child: Divider(
                      color: kPinkColor,
                      height: 30,
                    ),
                  ),
                ),
                Text("OR"),
                Expanded(
                  child: new Container(
                    margin: const EdgeInsets.only(
                      left: 15.0,
                    ),
                    child: Divider(
                      color: kPinkColor,
                      height: 30,
                    ),
                  ),
                ),
              ],
            ),
            Consumer<GetDataProvider>(
              builder: (context, data, child) => Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: data.get.customer.address.length > 0
                    ? [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Saved Address', style: Text18Pink),
                              Text('Select Saved Delivery Address',
                                  style: kText143),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: data.get.customer.address.length,
                            physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              var address = data.get.customer.address[index];
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  ListTile(
                                    onTap: () => _selectLocation(address),
                                    enableFeedback: true,
                                    horizontalTitleGap: 5,
                                    trailing: IconButton(
                                        onPressed: () {
                                          Provider.of<GetDataProvider>(context,
                                                  listen: false)
                                              .deleteAddressData(
                                                  address["_id"]);
                                        },
                                        icon: Icon(
                                          Icons.close_rounded,
                                          color: Colors.red[900],
                                        )),
                                    title: Text(
                                      address["address"],
                                      style: kNavBarTitle,
                                    ),
                                    subtitle: Text(
                                      address["formattedAddress"],
                                      maxLines: 3,
                                      style: kText143,
                                    ),
                                    leading: Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              width: 0.5, color: kGreyLight)),
                                      child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 25,
                                        child: SvgPicture.asset(
                                          address["addressType"] == 'work'
                                              ? "assets/svg/work.svg"
                                              : "assets/svg/home2.svg",
                                          height: 20,
                                          width: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Divider(
                                    color: kPinkColor,
                                  )
                                ],
                              );
                            }),
                      ]
                    : [
                        zerostate(
                            size: 160,
                            icon: 'assets/svg/address.svg',
                            head: 'Add Address',
                            sub: "Opps!. Please add atleast one address.")
                      ],
              ),
            ),
            SizedBox(
              height: 75,
            )
          ],
        ),
      ),
    );
  }
}
