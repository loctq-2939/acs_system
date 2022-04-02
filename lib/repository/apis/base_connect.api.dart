
import 'package:get/get.dart';
import 'package:global_configuration/global_configuration.dart';

import '../../@share/constants/value.constant.dart';
import '../../@share/utils/util.dart';
import '../response/base.response.dart';
import '../storage/data.storage.dart';


class BaseConnect extends GetConnect {
  @override
  void onInit() {
    httpClient
      ..baseUrl = GlobalConfiguration().get(BASE_URL)
      ..maxAuthRetries = MAX_AUTH_RETRIES
      ..timeout = const Duration(seconds: MAX_TIME_OUT)
      ..defaultContentType = CONTENT_TYPE
      ..addAuthenticator<dynamic>((request) {
        var token = Get.find<DataStorage>().getToken();
        if (token != null) request.headers[AUTHORIZATION] = "$BEARER $token";

        Get.log('[HEADER] : ${request.headers.toString()}');

        return request;
      });
  }

  Future<BaseResponse?> getResponse(String url, {dynamic query}) async {
    Get.log('[QUERY] : $query');
    var response = await get(url,
        query: query, decoder: (map) => BaseResponse.fromMap(map));
    if (response.isOk) {
      Get.log('[RESPONSE] : ${response.body?.toMap()}');
      return response.body;
    } else {
      dispose();
      hideLoading();
      return BaseResponse(
          success: false,
          message: response.statusText,
          code: response.status.code);
    }
  }

  Future<BaseResponse?> postRequest(String url, {dynamic body}) async {
    Get.log('[BODY] : ${body.toString()}');
    var response =
    await post(url, body, decoder: (map) => BaseResponse.fromMap(map));
    if (response.isOk) {
      Get.log('[RESPONSE] : ${response.body?.toMap()}');
      return response.body;
    } else {
      dispose();
      hideLoading();
      return BaseResponse(
          success: false,
          message: response.statusText,
          code: response.status.code);
    }
  }
}