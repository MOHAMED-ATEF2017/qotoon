import 'package:dio/dio.dart';
import 'package:qotoon/APIs/apis_urls.dart';

import '../../Shared/logger.dart';

abstract class DioHelper {
  //******************* post *********************** */
  static Future<Response> postData(String url,
      {Map<String, dynamic>? data, Map<String, dynamic>? headers}) async {
    Dio dio = Dio();
    Response? response;

    logger.i(
        "Post data url : \n ${ApisStrings.qotoonBaseUrl}$url \n Post data body : \n $data \n Get data headers : \n $headers");
    try {
      response = await dio.post("${ApisStrings.qotoonBaseUrl}$url",
          data: FormData.fromMap(data!),
          options: Options(
            headers: headers,
          ));
      logger.w(
          "Post response data from \n ${ApisStrings.qotoonBaseUrl}$url \n ${response.data}");
      return response;
    } on DioException catch (e) {
      logger.e(e.response, error: "EXCEPTION FROM POST ");
      response = Response(
          statusCode: e.response!.statusCode,
          statusMessage: e.response!.statusMessage,
          data: e.response!.data,
          requestOptions: RequestOptions(data: e.response));
      return response;
    }
  }

  //******************* get *********************** */
  static Future<Response> getData(String url,
      {Map<String, dynamic>? headers}) async {
    Dio dio = Dio();
    late Response response;

    logger.i(
        "Get data url : \n ${ApisStrings.qotoonBaseUrl}$url \n Get data headers : \n $headers");

    try {
      response = await dio.get("${ApisStrings.qotoonBaseUrl}$url",
          options: Options(
            headers: headers,
          ));
      logger.w(
          "Get response data from \n ${ApisStrings.qotoonBaseUrl}$url \n ${response.data}");

      return response;
    } on DioException catch (e) {
      logger.e(e.response, error: "EXCEPTION FROM GET");
      response = Response(
          statusCode: e.response!.statusCode,
          statusMessage: e.response!.statusMessage,
          data: e.response!.data,
          requestOptions: RequestOptions(data: e.response));
      return response;
    }
  }
}
