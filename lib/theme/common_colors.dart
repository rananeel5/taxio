import 'package:flutter/material.dart';

import '../main.dart';

class ThemeColor {
  static Color primaryBackgroundLightColor = const Color(0xffffffff);
  static Color primaryBackgroundDarkColor = const Color(0xff212121);
  static Color primaryBackgroundColor =
  isDarkTheme ? primaryBackgroundDarkColor : primaryBackgroundLightColor;

  static Color primaryThemeColor = const Color(0xffFEBB1B);
  static Color dark3 = const Color(0xff35383F);

  // static Color secondaryBackgroundColor =
  //     isDarkMode ? Color(0xff4e586e) : Color(0xffecf0f1);
  //
  // static Color titleTextColor =
  //     isDarkMode ? Color(0xff1b1718) : Color(0xff1b1718);
  // static Color subTitleTextColor =
  //     isDarkMode ? Color(0xff1b1718) : Color(0xff1b1718);
  //
  // static Color lightTitleTextColor =
  //     isDarkMode ? Color(0xff1b1718) : Color(0xff1b1718);
  // static Color lightSubTitleTextColor =
  //     isDarkMode ? Color(0xff1b1718) : Color(0xff1b1718);
  //
  // static Color grey = isDarkMode ? Color(0xff1b1718) : Color(0xff1b1718);
  // static Color dividerColor =
  //     isDarkMode ? Color(0xff1b1718) : Color(0xff1b1718);
  // static Color iconColor = isDarkMode ? Color(0xff1b1718) : Color(0xff1b1718);
  //
  // static Color red = isDarkMode ? Color(0xff1b1718) : Color(0xff1b1718);
  // static Color green = isDarkMode ? Color(0xff1b1718) : Color(0xff1b1718);
  //
  // static Color black = isDarkMode ? Color(0xff1b1718) : Color(0xff1b1718);
  //
  // static Color borderColor = isDarkMode ? Color(0xff1b1718) : Color(0xff1b1718);
}
