import 'package:foap/manager/user_profile_manager.dart';
import 'package:get_it/get_it.dart';

import 'location_manager.dart';
import 'notification_manager.dart';

GetIt getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  getIt.registerLazySingleton<UserProfileManager>(() => UserProfileManager());
  getIt.registerLazySingleton<LocationManager>(() => LocationManager());
  getIt.registerLazySingleton<NotificationManager>(() => NotificationManager());
  // getIt.registerLazySingleton<DBManager>(() => DBManager());
}
