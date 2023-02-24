import 'package:Taxio/screens/createNewPin/createNewPin_screen.dart';
import 'package:Taxio/screens/loading/loading.dart';
import 'package:Taxio/screens/login/login_binding.dart';
import 'package:Taxio/screens/login/login_screen.dart';
import 'package:Taxio/screens/signup/signup_screen.dart';
import 'package:Taxio/screens/tutorial/tutorial_screen.dart';
import 'package:get/get.dart';
import '../screens/SetProfile/setProfile_binding.dart';
import '../screens/SetProfile/setProfile_screen.dart';
import '../screens/createNewPin/createNewPin_binding.dart';
import '../screens/landing/landing_binding.dart';
import '../screens/landing/landing_screen.dart';
import '../screens/loading/loading_binding.dart';
import '../screens/signup/signup_binding.dart';
import '../screens/splash/splash_binding.dart';
import '../screens/splash/splash_screen.dart';
import '../screens/tutorial/tutorial_binding.dart';
part 'app_routes.dart';

/// Contains the list of pages or routes taken across the whole application.
/// This will prevent us in using context for navigation. And also providing
/// the blocs required in the next named routes.
///
/// [pages] : will contain all the pages in the application as a route
/// and will be used in the material app.
/// Will be ignored for test since all are static values and would not change.
class AppPages {
  static var transitionDuration = const Duration(milliseconds: 300);
  static const initial = Routes.splash;

  static final pages = [
    GetPage<SplashScreen>(
      name: _Paths.splash,
      transitionDuration: transitionDuration,
      page: SplashScreen.new,
      binding: SplashBinding(),
      transition: Transition.cupertino,
    ),
    GetPage<LoadingScreen>(
      name: _Paths.loading,
      transitionDuration: transitionDuration,
      page: LoadingScreen.new,
      binding: LoadingBinding(),
      transition: Transition.cupertino,
    ),
    GetPage<TutorialScreen>(
      name: _Paths.tutorial,
      transitionDuration: transitionDuration,
      page: TutorialScreen.new,
      binding: TutorialBinding(),
      transition: Transition.cupertino,
    ),
    GetPage<LandingScreen>(
      name: _Paths.landing,
      transitionDuration: transitionDuration,
      page: LandingScreen.new,
      binding: LandingBinding(),
      transition: Transition.cupertino,
    ),
    GetPage<LoginScreen>(
      name: _Paths.login,
      transitionDuration: transitionDuration,
      page: LoginScreen.new,
      binding: LoginBinding(),
      transition: Transition.cupertino,
    ),
    GetPage<SignupScreen>(
      name: _Paths.signup,
      transitionDuration: transitionDuration,
      page: SignupScreen.new,
      binding: SingUpBinding(),
      transition: Transition.cupertino,
    ),
    GetPage<SetProfileScreen>(
      name: _Paths.setProfile,
      transitionDuration: transitionDuration,
      page: SetProfileScreen.new,
      binding: SetProfileBinding(),
      transition: Transition.cupertino,
    ),
    GetPage<CreateNewPinScreen>(
      name: _Paths.createNewPin,
      transitionDuration: transitionDuration,
      page: CreateNewPinScreen.new,
      binding: CreateNewPinBinding(),
      transition: Transition.cupertino,
    ),
  ];
}
