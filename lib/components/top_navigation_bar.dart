import 'package:flutter/material.dart';
import 'package:foap/util/extension.dart';
import 'package:get/get.dart';
import '../main.dart';
import '../theme/icon_enum.dart';
import '../theme/theme_icon.dart';
import '../util/localization_strings.dart';
import 'custom_texts.dart';

Widget backNavigationBar(
    {required BuildContext context, required String title}) {
  return Row(
    children: [
      ThemeIconWidget(
        ThemeIcon.backArrow,
        size: 18,
        color: isDarkTheme ? TextColor.white : TextColor.grayscale900,
      ).ripple(() {
        Get.back();
      }),
      Heading4Text(
        title.tr,
        weight: TextWeight.bold,
        color: TextColor.grayscale900,
      ).lP8,
    ],
  ).setPadding(left: 16, right: 16, top: 8, bottom: 16);
}

Widget backNavigationBarWithIcon(
    {required BuildContext context,
    required ThemeIcon icon,
    required String title,
    required VoidCallback iconBtnClicked}) {
  return Stack(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ThemeIconWidget(
            ThemeIcon.backArrow,
            size: 18,
            color: isDarkTheme ? TextColor.white : TextColor.grayscale900,
          ).ripple(() {
            Get.back();
          }),
          ThemeIconWidget(
            icon,
            size: 20,
            color: isDarkTheme ? TextColor.white : TextColor.grayscale900,
          ).ripple(() {
            iconBtnClicked();
          }),
        ],
      ),
      Positioned(
        left: 0,
        right: 0,
        child: Center(
          child: Text(
            title.tr,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontWeight: FontWeight.w600),
          ),
        ),
      ),
    ],
  ).setPadding(left: 16, right: 16, top: 8, bottom: 16);
}

Widget titleNavigationBarWithIcon(
    {required BuildContext context,
    required String title,
    required ThemeIcon icon,
    required VoidCallback completion}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const SizedBox(
        width: 25,
      ),
      Text(
        title.tr,
        style: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(fontWeight: FontWeight.w600),
      ),
      ThemeIconWidget(
        icon,
        color: isDarkTheme ? TextColor.white : TextColor.grayscale900,
        size: 25,
      ).ripple(() {
        completion();
      }),
    ],
  ).setPadding(left: 16, right: 16, top: 8, bottom: 16);
}

Widget titleNavigationBar({
  required BuildContext context,
  required String title,
}) {
  return Text(
    title.tr,
    style: Theme.of(context)
        .textTheme
        .bodyLarge!
        .copyWith(fontWeight: FontWeight.w600),
  ).setPadding(left: 16, right: 16, top: 8, bottom: 16);
}
