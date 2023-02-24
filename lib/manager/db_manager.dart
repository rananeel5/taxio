// import 'dart:math';
// import 'package:foap/helper/common_import.dart';
// import 'package:path/path.dart' as p;
//
// class DBManager {
//   // final db = Localstore.instance;
//   late Database database;
//   var random = Random.secure();
//
//   createDatabase() async {
//     var databasesPath = await getDatabasesPath();
//     var path = p.join(databasesPath, 'socialified.db');
//
//     print(databasesPath);
//     try {
//       await Directory(databasesPath).create(recursive: true);
//       database = await openDatabase(path,
//           version: 2,
//           onCreate: (Database db, int version) async {},
//           onOpen: (db) {}, onUpgrade: (db, oldVersion, currentVersion) async {
//         print('onUpgrade');
//       });
//     } catch (error) {}
//   }
// }
