import 'dart:math';

import 'package:flutter/material.dart';
import 'package:magic_test/shared/colors.dart';

const Widget horizontalSpaceMin = SizedBox(width: 1.0);
const Widget horizontalSpaceTiny = SizedBox(width: 5.0);
const Widget horizontalSpaceSmall = SizedBox(width: 10.0);
const Widget horizontalSpaceMedium = SizedBox(width: 25.0);

const Widget verticalSpaceMin = SizedBox(height: 1.0);
const Widget verticalSpaceTiny = SizedBox(height: 5.0);
const Widget verticalSpaceSmall = SizedBox(height: 10.0);
const Widget verticalSpaceMedium = SizedBox(height: 25.0);
const Widget verticalSpaceMediumLarge = SizedBox(height: 37.5);
const Widget verticalSpaceLarge = SizedBox(height: 50.0);
const Widget verticalSpaceMassive = SizedBox(height: 120.0);

Widget spacedDivider = Column(
  children: const <Widget>[
    verticalSpaceMedium,
    Divider(color: Colors.blueGrey, height: 5.0),
    verticalSpaceMedium,
  ],
);

Widget verticalSpace(double height) => SizedBox(height: height);

double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

double screenHeightFraction(BuildContext context,
        {int dividedBy = 1, double offsetBy = 0}) =>
    (screenHeight(context) - offsetBy) / dividedBy;

double screenWidthFraction(BuildContext context,
        {int dividedBy = 1, double offsetBy = 0}) =>
    (screenWidth(context) - offsetBy) / dividedBy;

double halfScreenWidth(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 2);

double thirdScreenWidth(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 3);

double twoThirdsScreenWidth(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 3) * 2;

double scaleByScreenSize(BuildContext context, double size) {
  // print('${screenWidth(context)} $kMaxWidth ${(min(screenWidth(context), kMaxWidth) / kMaxWidth)} = ${(min(screenWidth(context), kMaxWidth) / kMaxWidth) * size}');
  return (screenWidth(context) / 1200.0) * size;
}

TextStyle bodyStyle = TextStyle(
    fontSize: 18.0, color: kLightBlueColor, fontWeight: FontWeight.w400);
TextStyle headStyle = TextStyle(
    fontSize: 28.0, color: kLightBlueColor, fontWeight: FontWeight.w500);
TextStyle subStyle =
    TextStyle(fontSize: 20.0, color: kWhiteColor, fontWeight: FontWeight.w600);
