import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import "string_extension.dart";

import 'package:maafos/Commons/ColorConstants.dart';

const String PrimaryFontName = 'ProximaNova';

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}

//* TITLES STYLE

// Head Title
const kText145 = TextStyle(
  fontFamily: PrimaryFontName,
  fontWeight: FontWeight.w600,
  color: kWhiteColor,
  fontSize: 13,
);
const kText1456 = TextStyle(
  fontFamily: PrimaryFontName,
  fontWeight: FontWeight.w600,
  color: kBlackColor,
  fontSize: 13,
);

const kText8 = TextStyle(
  fontFamily: PrimaryFontName,
  fontWeight: FontWeight.w500,
  color: kWhiteColor,
  fontSize: 10,
);
const kText10 = TextStyle(
  fontFamily: PrimaryFontName,
  fontWeight: FontWeight.w400,
  color: kBlackColor,
  fontSize: 10,
);

const kText10white = TextStyle(
  fontFamily: PrimaryFontName,
  fontWeight: FontWeight.w400,
  color: kWhiteColor,
  fontSize: 10,
);

const kText144 = TextStyle(
  fontFamily: PrimaryFontName,
  fontWeight: FontWeight.w500,
  color: kWhiteColor,
  fontSize: 13,
);
TextStyle kTextblock = TextStyle(
  fontFamily: PrimaryFontName,
  fontWeight: FontWeight.w500,
  color: Colors.grey[600],
  fontSize: 18,
);
TextStyle KReason = TextStyle(
  fontFamily: PrimaryFontName,
  // fontWeight: FontWeight.w500,
  color: Colors.grey[600],
  fontSize: 14,
);

const kTextbuttonwhite = TextStyle(
  fontFamily: PrimaryFontName,
  fontWeight: FontWeight.w600,
  color: kWhiteColor,
  fontSize: 15,
);

const kPink14 = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w700,
  color: kPinkColor,
);
const kPink143 = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w900,
  color: kPinkColor,
);

const TextStyle kText143 = TextStyle(
  fontFamily: PrimaryFontName,
  letterSpacing: 0.7,
  fontWeight: FontWeight.w200,
  color: Colors.grey,
  fontSize: 13,
);

const kText12white = TextStyle(
  fontFamily: PrimaryFontName,
  fontWeight: FontWeight.w400,
  color: kWhiteColor,
  fontSize: 11,
);
const kTextgrey = TextStyle(
  fontFamily: PrimaryFontName,
  fontWeight: FontWeight.w200,
  color: Colors.grey,
  fontSize: 13,
);
const kTextgrey1 = TextStyle(
  fontFamily: PrimaryFontName,
  fontWeight: FontWeight.w400,
  color: Colors.grey,
  fontSize: 9,
);

const kNavBarTitle = TextStyle(
  fontFamily: PrimaryFontName,
  fontWeight: FontWeight.w700,
  color: kBlackColor,
  fontSize: 13.5,
);
const kNavBarTitle1 = TextStyle(
  fontFamily: PrimaryFontName,
  fontWeight: FontWeight.w600,

  // letterSpacing: 0.5,
  color: kBlackColor,
  fontSize: 15,
);

const Text15 = TextStyle(
  fontSize: 15,
  fontFamily: PrimaryFontName,
  color: kBlackColor,
  fontWeight: FontWeight.w200,
);

const Text16white = TextStyle(
  color: Colors.white,
  fontFamily: PrimaryFontName,
  fontSize: 18,
  fontWeight: FontWeight.w600,
);

const Text24white = TextStyle(
  color: Colors.white,
  fontFamily: PrimaryFontName,
  fontSize: 24,
  fontWeight: FontWeight.w700,
);

var kOutlineStyle = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: BorderSide(width: 0, style: BorderStyle.none),
);
const Text16black = TextStyle(
  color: Colors.black,
  fontFamily: PrimaryFontName,
  fontSize: 16,
  fontWeight: FontWeight.w700,
);
const Text16 = TextStyle(
  color: Colors.black,
  fontFamily: PrimaryFontName,
  fontSize: 16,
  fontWeight: FontWeight.w600,
);

const Text18 = TextStyle(
  fontFamily: PrimaryFontName,
  fontSize: 22,
  color: Colors.black,
  fontWeight: FontWeight.w500,
);
const Text18Pink = TextStyle(
  fontFamily: PrimaryFontName,
  fontSize: 18,
  color: kPinkColor,
  fontWeight: FontWeight.w700,
);
const Text18Pink1 = TextStyle(
  fontFamily: PrimaryFontName,
  fontSize: 22,
  color: kPinkColor,
  fontWeight: FontWeight.w700,
);

const Text18Grey = TextStyle(
  fontFamily: PrimaryFontName,
  fontSize: 18,
  color: kBlackColor,
  fontWeight: FontWeight.w900,
);

const TextHeadGrey = TextStyle(
  fontFamily: 'ProximaNova',
  // letterSpacing: 0.6,
  fontSize: 22,
  color: Colors.black,
  fontWeight: FontWeight.w600,
);
const TextHeadGrey1 = TextStyle(
  fontSize: 18,
  color: Color(0xff333333),
  fontWeight: FontWeight.w900,
);
const TextHeadBlack = TextStyle(
  fontSize: 18,
  color: kBlackColor,
  fontWeight: FontWeight.w700,
);

const Rdetail = TextStyle(
  fontFamily: PrimaryFontName,
  fontSize: 12,
  color: Colors.white,
  fontWeight: FontWeight.w700,
);
const kNavBarTitle4 = TextStyle(
  fontFamily: PrimaryFontName,
  fontWeight: FontWeight.w600,

  // letterSpacing: 0.5,
  color: kBlackColor,
  fontSize: 18,
);
const kTextgrey4 = TextStyle(
  fontFamily: PrimaryFontName,
  fontWeight: FontWeight.w200,
  color: Colors.grey,
  fontSize: 11,
);
const kText146 = TextStyle(
  fontFamily: PrimaryFontName,
  fontWeight: FontWeight.w500,
  color: kWhiteColor,
  fontSize: 12,
);

const kNavTitle1 = TextStyle(
  fontFamily: PrimaryFontName,
  fontWeight: FontWeight.w400,

  // letterSpacing: 0.5,
  color: kBlackColor,
  fontSize: 15,
);

const kNavTitle5 = TextStyle(
  fontFamily: PrimaryFontName,
  fontWeight: FontWeight.w600,

  // letterSpacing: 0.5,
  color: kBlackColor,
  fontSize: 14,
);

const kText11white = TextStyle(
  fontFamily: PrimaryFontName,
  fontWeight: FontWeight.w400,
  color: kWhiteColor,
  fontSize: 18,
);
