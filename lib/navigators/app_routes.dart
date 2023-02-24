// coverage:ignore-file
part of 'app_pages.dart';

/// A chunks of routes and the path names which will be used to create
/// routes in [AppPages].
abstract class Routes {
  static const splash = _Paths.splash;
  static const loading = _Paths.loading;
  static const tutorial = _Paths.tutorial;
  static const landing = _Paths.landing;
  static const login = _Paths.login;
  static const signup = _Paths.signup;
  static const setProfile = _Paths.setProfile;
  static const createNewPin = _Paths.createNewPin;
}

abstract class _Paths {
  static const splash = '/splash-screen';
  static const loading = '/loading';
  static const tutorial = '/tutorial';
  static const landing = '/landing';
  static const login = '/login';
  static const signup = '/signup';
  static const setProfile = '/setProfile';
  static const createNewPin = '/createNewPin';
}
