import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Taxio/screens/landing/landing_controller.dart';
import 'package:Taxio/util/extension.dart';
import 'package:Taxio/util/localization_strings.dart';
import 'package:get/get.dart';
import '../../components/app_buttons.dart';
import '../../components/custom_texts.dart';
import '../../components/top_navigation_bar.dart';
import '../../main.dart';
import '../../navigators/routes_management.dart';
import '../../theme/common_colors.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeColor.primaryBackgroundColor,
        body: GetBuilder<LandingController>(
            builder: (controller) => Column(
                  children: [
                    backNavigationBar(
                      context: context,
                      title: '',
                    ).tp(50.sp),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(children: [
                          Image.asset(
                            'assets/landingImg.png',
                            fit: BoxFit.cover,
                          ).setPadding(top: 28.sp, bottom: 28.sp),
                          Heading1Text(LocalizationString.letsYouIn,
                              color: isDarkTheme
                                  ? TextColor.white
                                  : TextColor.grayscale900,
                              weight: TextWeight.bold,
                              textAlign: TextAlign.center).bP16,
                          addSocialLoginPlatform(context, 'assets/facebook.png',
                              LocalizationString.facebookLogin),
                          addSocialLoginPlatform(context, 'assets/google.png',
                              LocalizationString.googleLogin),
                          addSocialLoginPlatform(context, 'assets/apple.png',
                              LocalizationString.appleLogin),
                          BodyExtraLargeText(LocalizationString.or,
                                  weight: TextWeight.semiBold,
                                  color: TextColor.grayscale900)
                              .setPadding(top: 34.sp, bottom: 34.sp),
                          FilledButtonType(
                              text: LocalizationString.signWithPassword,
                              isEnabled: true,
                              enabledBackgroundColor:
                                  ThemeColor.primaryThemeColor,
                              cornerRadius: 25.sp,
                              onPress: () => RouteManagement.goToLogin()),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              BodyMediumText(
                                LocalizationString.noAccount,
                                weight: TextWeight.regular,
                                color: TextColor.grayscale500,
                              ),
                              BodyMediumText(
                                LocalizationString.signup,
                                weight: TextWeight.regular,
                                color: ThemeColor.primaryThemeColor,
                              ).lP4.ripple(() => RouteManagement.goToSignUp())
                            ],
                          ).setPadding(top: 30.sp, bottom: 24.sp)
                        ]).setPadding(left: 24.sp, right: 24.sp),
                      ),
                    ),
                  ],
                )));
  }

  Widget addSocialLoginPlatform(
      BuildContext context, String icon, String title) {
    return SizedBox(
      height: 50.sp,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            icon,
            width: 24.sp,
          ).rp(12.sp),
          BodyLargeText(
            title,
            weight: TextWeight.semiBold,
            color: TextColor.grayscale900,
          )
        ],
      ),
    )
        .borderWithRadius(
            context: context,
            value: 1.sp,
            radius: 16.r,
            color: TextColor.grayscale200)
        .tP16;
  }
}
