import 'dart:developer';
import '../model/setting_model.dart';
import '../model/user_model.dart';
import '../util/localization_strings.dart';

class ApiResponseModel {
  bool success = true;
  String message = "";
  bool isInvalidLogin = true;
  String? authKey;
  String? token;

  UserModel? user;
  SettingModel? settings;

  bool isLoginFirstTime = false;

  ApiResponseModel();

  factory ApiResponseModel.fromJson(dynamic json, String url) {
    ApiResponseModel model = ApiResponseModel();
    model.success = json['status'] == 200;
    dynamic data = json['data'];
    model.isInvalidLogin = json['isInvalidLogin'] == null ? false : true;

    log(json.toString());

    if (model.success) {
      model.message = json['message'];
      if (data != null && data.length > 0) {
        if (data['user'] != null) {

        } else if (data['setting'] != null) {
          var setting = data['setting'];
          model.settings = SettingModel.fromJson(setting);
        }
      }
    } else {
      if (data == null) {
        model.message = LocalizationString.errorMessage;
      } else if (data['errors'] != null) {
        Map errors = data['errors'];
        var errorsArr = errors[errors.keys.first] ?? [];
        String error = errorsArr.first ?? LocalizationString.errorMessage;
        model.message = error;
      } else {
        model.message = LocalizationString.errorMessage;
      }
    }
    return model;
  }

  factory ApiResponseModel.fromUsersJson(dynamic json) {
    ApiResponseModel model = ApiResponseModel();
    model.success = json['status'] == 200;
    dynamic data = json['data'];

    if (model.success) {
      model.message = json['message'];
      if (data != null && data.length > 0) {
        if (data['user'] != null && data['user'].length > 0) {
        }
      }
    } else {
      Map errors = data['errors'];
      var errorsArr = errors[errors.keys.first] ?? [];
      String error = errorsArr.first ?? LocalizationString.errorMessage;
      model.message = error;
    }
    return model;
  }

  factory ApiResponseModel.fromErrorJson(dynamic json) {
    ApiResponseModel model = ApiResponseModel();
    model.success = false;
    model.message = json['message'];
    return model;
  }
}
