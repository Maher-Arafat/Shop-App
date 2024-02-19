import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioHelper {
  static const String baseUrl = "https://student.valuxapps.com/api/";

  static Dio dio = Dio(
    BaseOptions(
      headers: {'Content-Type': 'application/json'},
    ),
  );
  static Future<Response> getData({
    Map<String, dynamic>? query,
    required String endPoint,
    String lang = 'en',
  }) async {
    final SharedPreferences shrdPrfs = await SharedPreferences.getInstance();
    dio.options.headers = {
      'lang': lang,
      'Authorization': shrdPrfs.getString('token')
    };
    return await dio.get(
      "${DioHelper.baseUrl}$endPoint",
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required Map<String, dynamic>? data,
    required String endPoint,
    String lang = 'en',
    String? token,
  }) async {
    final SharedPreferences shrdPrfs = await SharedPreferences.getInstance();
    dio.options.headers = {
      'lang': lang,
      'Authorization': shrdPrfs.getString('token')
    };
    return await dio.post(
      "${DioHelper.baseUrl}$endPoint",
      data: data,
    );
  }
}
