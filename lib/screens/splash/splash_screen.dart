import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Taxio/screens/splash/splash_controller.dart';
import 'package:Taxio/theme/common_colors.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeColor.primaryBackgroundColor,
        body: GetBuilder<SplashController>(
            builder: (controller) => Center(
                  child: Image.asset(
                    'assets/Group.png',
                    fit: BoxFit.cover,
                    height: 419.sp,
                    width: 367.sp,
                  ),
                )));
  }
}
