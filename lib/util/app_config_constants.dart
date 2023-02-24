import 'dart:ui';
import 'package:flutter/material.dart';

class AppConfigConstants {
  // Name of app
  static String appName = 'Taxio';
  static String currentVersion = '1.0';

  static String appTagline = 'Share your day activity with friends';
  static const googleMapApiKey = "AIzaSyA4vcqErGvq5NRbvhvq8JKSp0VFpNBBPjE";
  // static const agoraApiKey = "52aa6d82f3f14aa3bd36b7a0fb6648f4";

  static const razorpayKey = 'rzp_test_jDl2SjSKYlghAD';

// static const restApiBaseUrl =
  //     'https://fwdtechnology.co/socialified/api/web/v1/';
  static const restApiBaseUrl =
      'https://fwdtechnology.co/media_selling/api/web/v1/';

  // Socket api url
  static const socketApiBaseUrl = "http://fwdtechnology.co:3000/";

  // Socket api url
  static const encryptionKey = "bbC2H19lkVbQDfakxcrtNMQdd0FloLyw";

  // chat version
  static const int enableEncryption = 1;

  // chat version
  static const int chatVersion = 1;


  // is demo app
  static const bool isDemoApp = true;

  // parameters for delete chat
  static const secondsInADay = 86400;
  static const secondsInThreeDays = 259200;
  static const secondsInSevenDays = 604800;
}

class ColorConstants {
  static Color themeColor = const Color(0xff10ac84);

  static Color backgroundColor = Colors.white;
  static Color cardColor = const Color(0xFFF9F9F9);
  static Color dividerColor = Colors.grey.withOpacity(0.2);
  static Color borderColor = Colors.grey.withOpacity(0.2);

  static Color inputFieldBackgroundColor = const Color(0xFFFAFAFA);
  static Color iconColor = const Color(0xFF212121).withOpacity(0.5);
  static Color inputFieldTextColor = const Color(0xFF212121);
  static Color inputFieldPlaceholderTextColor = const Color(0xFF9E9E9E);

  static Color red = Colors.red;
  static Color green = Colors.green;
}