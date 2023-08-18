import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/api/services/posts_service.dart';
import 'package:flutter_boilerplate/helpers/constants.dart';
import 'package:get_storage/get_storage.dart';

class DioSingleton {
  static final DioSingleton _dio_singleton = DioSingleton._internal();

  factory DioSingleton() {
    return _dio_singleton;
  }

  DioSingleton._internal();

  static Dio? dio;

  Dio getDio() {

    if (dio == null) {
      dio = Dio(BaseOptions(
          connectTimeout: 20000, receiveTimeout: 20000, baseUrl: GLOBAL_IP));

      dio!
        ..interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
          requestInterceptor(options);

          print("${options.uri}");

          return handler.next(options);
        }, onResponse: (response, handler) {
          print(response.runtimeType);
          return handler.next(response);
        }, onError: (DioError e, handler) {
          if (e.response != null) {
            // handleResponseErrors(e.response!.statusCode!);
          }
          return handler.next(e); //continue
        }));
    }
    return dio!;
  }

  dynamic requestInterceptor(RequestOptions options) {
    if (GetStorage().read(PREF_AUTH_KEY) != null) {
      options.headers["authorization"] =
          "Bearer " + GetStorage().read(PREF_AUTH_KEY);
    }

    print(options.headers["authorization"]);

    return options;
  }

  PostsService getPostsService() {
    return PostsService();
  }
}
