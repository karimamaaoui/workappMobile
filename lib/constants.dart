import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

final kSpacingUnit = 10.00.w;

const kSilverColor = const Color(0xFFF6F7FB);
const kAccentColor = const Color(0xFFED5575);
const kPrimaryTextColor = const Color(0xFF211D42);
const kSecondaryTextColor = const Color(0xFFB9B8CD);

final kCardShadow = BoxShadow(
  color: Color.fromRGBO(0, 0, 0, 0.05),
  blurRadius: 20.w,
  offset: Offset(10.w, 10.w),
);

final kFooterShadow = BoxShadow(
  color: Color.fromRGBO(0, 0, 0, 0.10),
  blurRadius: 50.w,
  offset: Offset(0, -10.w),
);

final kHeadingTextStyle = TextStyle(
  color: kPrimaryTextColor,
  fontFamily: 'SF Pro Rounded',
  fontSize: 34.sp,
  fontWeight: FontWeight.w100,
);

final kTitleTextStyle = TextStyle(
  color: kPrimaryTextColor,
  fontSize: 17.sp,
  fontWeight: FontWeight.w500,
);

final kSubTitleTextStyle = TextStyle(
  color: kPrimaryTextColor,
  fontSize: 15.sp,
  fontWeight: FontWeight.w500,
);

final kCardTitleTextStyle = TextStyle(
  color: kSecondaryTextColor,
  fontSize: 13.sp,
  fontWeight: FontWeight.w500,
);

final kBodyTextStyle = TextStyle(
  color: kPrimaryTextColor,
  fontSize: 13.sp,
);

final kCaptionTextStyle = TextStyle(
  color: kSecondaryTextColor,
  fontSize: 10.sp,
);


const kPrimaryColor = Color(0xFF383338);
const kPrimaryLightColor = Color(0xFFC7C4C4);

const kDarkPrimaryColor = Color(0xFF212121);
const kDarkSecondaryColor = Color(0xFF373737);
const kLightPrimaryColor = Color(0xFFFFFFFF);
const kLightSecondaryColor = Color(0xFFF3F7FB);

