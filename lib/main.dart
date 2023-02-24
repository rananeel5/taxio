import 'dart:io';
import 'package:auto_orientation/auto_orientation.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Taxio/util/languages.dart';
import 'package:Taxio/util/shared_prefs.dart';
import 'package:get/get.dart';
import 'package:giphy_get/l10n.dart';
import 'package:overlay_support/overlay_support.dart';
import 'manager/user_profile_manager.dart';
import 'manager/notification_manager.dart';
import 'manager/service_locator.dart';
import 'navigators/app_pages.dart';

bool isDarkTheme = false;

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

// late List<CameraDescription> cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // cameras = await availableCameras();

  await Firebase.initializeApp();
  // await EasyLocalization.ensureInitialized();
  // await FlutterDownloader.initialize(
  //     debug: true,
  //     // optional: set to false to disable printing logs to console (default: true)
  //     ignoreSsl:
  //         true // option: set to false to disable working with http links (default: false)
  //     );
  // await CustomGalleryPermissions.requestPermissionExtend();

  final firebaseMessaging = FCM();
  firebaseMessaging.setNotifications();
  // String? token = await FlutterCallkitIncoming.getDevicePushTokenVoIP();
  // if (token != null) {
  // SharedPrefs().setVoipToken(token);
  // }

  AutoOrientation.portraitAutoMode();

  isDarkTheme = await SharedPrefs().isDarkMode();
  // Get.changeThemeMode(isDarkTheme ? ThemeMode.dark : ThemeMode.light);
  // Get.changeThemeMode(ThemeMode.dark);

  setupServiceLocator();
  await getIt<UserProfileManager>().refreshProfile();
  getIt<NotificationManager>().initialize();

  // AppConfigConstants.selectedLanguage = await SharedPrefs().getLanguageCode();
  // getIt<DBManager>().clearOldStories();
  // await getIt<DBManager>().createDatabase();

  if (getIt<UserProfileManager>().isLogin == true) {
    // ApiController().updateTokens();
  }

  // if (Platform.isAndroid) {
  //   InAppPurchaseAndroidPlatformAddition.enablePendingPurchases();
  // }
  AwesomeNotifications().initialize(
      'resource://drawable/ic_launcher',
      [
        NotificationChannel(
          channelGroupKey: 'Calls',
          channelKey: 'calls',
          channelName: 'Calls',
          channelDescription: 'Notification channel for calls',
          defaultColor: const Color(0xFF9D50DD),
          ledColor: Colors.white,
          importance: NotificationImportance.High,
          locked: true,
          enableVibration: true,
          playSound: true,
        ),
      ],
      channelGroups: [
        NotificationChannelGroup(
            channelGroupkey: 'calls', channelGroupName: 'Calls'),
      ],
      debug: true);

  runApp(Phoenix(child: const SocialifiedApp()));
}

class SocialifiedApp extends StatefulWidget {
  const SocialifiedApp({Key? key}) : super(key: key);

  @override
  State<SocialifiedApp> createState() => _SocialifiedAppState();
}

class _SocialifiedAppState extends State<SocialifiedApp> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(428, 926),
        builder: (_, __) => OverlaySupport.global(
              child: FutureBuilder<String>(
                  future: SharedPrefs().getLanguage(),
                  builder:
                      (BuildContext context, AsyncSnapshot<String> snapshot) {
                    if (snapshot.hasData) {
                      return GetMaterialApp(
                        translations: Languages(),
                        locale: Locale(snapshot.data!),
                        fallbackLocale: const Locale('en', 'US'),
                        debugShowCheckedModeBanner: false,
                        getPages: AppPages.pages,
                        initialRoute: AppPages.initial,
                        builder: EasyLoading.init(),
                        // theme: AppTheme.lightTheme,
                        // darkTheme: AppTheme.darkTheme,
                        themeMode: ThemeMode.dark,
                        // localizationsDelegates: context.localizationDelegates,
                        localizationsDelegates: [
                          GlobalMaterialLocalizations.delegate,
                          GlobalWidgetsLocalizations.delegate,
                          // GlobalCupertinoLocalizations.delegate,
                          // Add this line
                          GiphyGetUILocalizations.delegate,
                        ],
                        supportedLocales: const <Locale>[
                          Locale('hi', 'US'),
                          Locale('en', 'SA'),
                          Locale('ar', 'SA'),
                          Locale('tr', 'SA'),
                          Locale('ru', 'SA'),
                          Locale('es', 'SA'),
                          Locale('fr', 'SA')
                        ],
                      );
                    } else {
                      return Container();
                    }
                  }),
            ));
  }
}
