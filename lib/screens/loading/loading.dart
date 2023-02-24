import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:foap/theme/common_colors.dart';

import 'loading_controller.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeColor.primaryBackgroundColor,
        body: GetBuilder<LoadingController>(
          builder: (controller) => SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              'assets/welcome.png',
              fit: BoxFit.fill,
            ),
          ),
        ));
  }
}
