import 'dart:convert';
import 'api_response_model.dart';

class ApiController {
  final JsonDecoder _decoder = const JsonDecoder();

  Future<ApiResponseModel> getResponse(String res, String url) async {
    try {
      dynamic data = _decoder.convert(res);
      if (data['status'] == 401 && data['data'] == null) {
        return ApiResponseModel.fromJson(
            {"message": data['message'], "isInvalidLogin": true}, url);
      } else {
        return ApiResponseModel.fromJson(data, url);
      }
    } catch (e) {
      return ApiResponseModel.fromJson({"message": e.toString()}, url);
    }
  }

  Future<ApiResponseModel> getArrayResponse(String res, String url) async {
    try {
      dynamic data = _decoder.convert(res);

      if (data['status'] == 401 && data['data'] == null) {
        // SharedPrefs().clearPreferences();
        // NavigationService.instance
        //     .navigateToReplacementWithScale(ScaleRoute(page: TutorialScreen()));
        return ApiResponseModel.fromJson(
            {"message": data['message'], "isInvalidLogin": true}, url);
      } else {
        return ApiResponseModel.fromUsersJson(data);
      }
    } catch (e) {
      return ApiResponseModel.fromJson({"message": e.toString()}, url);
    }
  }
}
