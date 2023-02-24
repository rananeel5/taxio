import 'package:get/get.dart';
import '../model/user_model.dart';
// import '../screens/login_sign_up/login_screen.dart';
import '../util/shared_prefs.dart';

class UserProfileManager {
  UserModel? user;

  bool get isLogin {
    return user != null;
  }

  logout() {
    user = null;
    SharedPrefs().clearPreferences();
    // Get.offAll(() => const LoginScreen());
  }

  Future refreshProfile() async {
    String? authKey = await SharedPrefs().getAuthorizationKey();

    print('authKey $authKey');
    if (authKey != null) {
      // await ApiController().getMyProfile().then((value) {
      //   print('getMyProfile');
      //   user = value.user;
      //
      //   if (user != null) {
      //     setupSocketServiceLocator1();
      //   }
      //   return;
      // });
    } else {
      return;
      // print('no auth token found');
    }
  }
}
