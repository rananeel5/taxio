import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Taxio/screens/signup/signup_controller.dart';
import 'package:Taxio/util/extension.dart';
import 'package:Taxio/util/localization_strings.dart';
import 'package:get/get.dart';
import '../../components/app_buttons.dart';
import '../../components/custom_texts.dart';
import '../../components/rounded_input_field.dart';
import '../../components/rounded_password_field.dart';
import '../../components/top_navigation_bar.dart';
import '../../main.dart';
import '../../navigators/routes_management.dart';
import '../../theme/common_colors.dart';
import '../../theme/icon_enum.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeColor.primaryBackgroundColor,
        body: GetBuilder<SignupController>(
            builder: (controller) => Column(
                  children: [
                    backNavigationBar(
                      context: context,
                      title: '',
                    ).tp(50.sp),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(children: [
                          Heading1Text(LocalizationString.createAccount,
                                  color: isDarkTheme
                                      ? TextColor.white
                                      : TextColor.grayscale900,
                                  weight: TextWeight.bold,
                                  textAlign: TextAlign.left)
                              .tp(60.sp),
                          addEmailField().tp(60.sp),
                          addPasswordField().tp(24.sp),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                controller.isRemember.value
                                    ? 'assets/check.png'
                                    : 'assets/emptyCheck.png',
                                width: 24.sp,
                              ).ripple(() => controller.markRememberMe()),
                              BodyMediumText(
                                LocalizationString.rememberMe,
                                weight: TextWeight.semiBold,
                                color: TextColor.grayscale900,
                              ).lP8
                            ],
                          ).setPadding(top: 24.sp),
                          FilledButtonType(
                              text: LocalizationString.signup,
                              isEnabled: true,
                              enabledBackgroundColor:
                                  ThemeColor.primaryThemeColor,
                              cornerRadius: 25.sp,
                              onPress: () =>
                                  RouteManagement.goToSetProfile()).tp(24.sp),
                          BodyExtraLargeText(LocalizationString.orContinue,
                                  weight: TextWeight.semiBold,
                                  color: TextColor.grayscale700)
                              .tp(70.sp),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                addSocialLoginPlatform(
                                        context, 'assets/facebook.png')
                                    .ripple(
                                        () => RouteManagement.goToSetProfile()),
                                SizedBox(width: 20.sp), // give it width
                                addSocialLoginPlatform(
                                        context, 'assets/google.png')
                                    .ripple(
                                        () => RouteManagement.goToSetProfile()),
                                SizedBox(width: 20.sp), // give it width
                                addSocialLoginPlatform(
                                        context, 'assets/apple.png')
                                    .ripple(
                                        () => RouteManagement.goToSetProfile()),
                              ]).tp(30.sp),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              BodyMediumText(
                                LocalizationString.alreadyAccount,
                                weight: TextWeight.regular,
                                color: TextColor.grayscale500,
                              ),
                              BodyMediumText(
                                LocalizationString.signIn,
                                weight: TextWeight.regular,
                                color: ThemeColor.primaryThemeColor,
                              ).lP4.ripple(() => RouteManagement.goToLogin())
                            ],
                          ).setPadding(top: 45.sp, bottom: 24.sp)
                        ]).setPadding(left: 24.sp, right: 24.sp),
                      ),
                    ),
                  ],
                )));
  }

  Widget addEmailField() {
    return InputField(
        hintText: LocalizationString.email,
        cornerRadius: 12.r,
        backgroundColor: TextColor.grayscale100,
        icon: ThemeIcon.email,
        iconColor: TextColor.grayscale500,
        textStyle: TextStyle(
            fontSize: FontSizes.b3.sp,
            color: TextColor.grayscale900,
            fontWeight: TextWeight.semiBold),
        hintStyle: TextStyle(
            fontSize: FontSizes.b3.sp,
            color: TextColor.grayscale500,
            fontWeight: TextWeight.regular),
        iconLeftPadding: 20.sp);
  }

  Widget addPasswordField() {
    return PasswordField(
        hintText: LocalizationString.password,
        cornerRadius: 12.r,
        backgroundColor: TextColor.grayscale100,
        icon: ThemeIcon.password,
        iconColor: TextColor.grayscale500,
        textStyle: TextStyle(
            fontSize: FontSizes.b3.sp,
            color: TextColor.grayscale900,
            fontWeight: TextWeight.semiBold),
        hintStyle: TextStyle(
            fontSize: FontSizes.b3.sp,
            color: TextColor.grayscale500,
            fontWeight: TextWeight.regular),
        onChanged: (String value) {},
        showRevealPasswordIcon: true,
        iconLeftPadding: 20.sp);
  }

  Widget addSocialLoginPlatform(BuildContext context, String icon) {
    return Image.asset(
      icon,
      width: 24.sp,
      height: 24.sp,
    ).paddingSymmetric(horizontal: 32.sp, vertical: 18.sp).borderWithRadius(
        context: context,
        value: 1.sp,
        radius: 16.r,
        color: TextColor.grayscale200);
  }
}
