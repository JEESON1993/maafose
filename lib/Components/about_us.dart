import 'package:flutter/material.dart';
import 'package:maafos/Commons/TextStyles.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFD3184E),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
        title: Text(
          'About Us',
          style: kTextbuttonwhite,
        ),
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Container(
          padding: EdgeInsets.all(15),
          child: Text(
            "MAAFOS is The Online Food Odering And Delivery Platform With a Wide Verity Of Restaurants Based in Payyanur (Kannur.Dist). Our Platform Lists Local Restaurants And Their Online Odering Menu From Which It Provides Delivery Using A Fleet Of Personnel , Enabling People to Order Food on Their Conveninent Places.",
            textAlign: TextAlign.justify,
          ),
        ),
      ),
    );
  }
}
