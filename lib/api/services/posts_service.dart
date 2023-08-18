import 'dart:io';

import 'package:dio/dio.dart';

import '../dio_singleton.dart';

class PostsService {
  Future<Response<dynamic>> getPosts() {
    return DioSingleton().getDio().get(
      "posts/",
    );
  }

  Future<Response<dynamic>> getSinglePost(int id) {
    return DioSingleton().getDio().get(
      "posts/$id",
    );
  }

  Future<Response<dynamic>> savePost(jsonObject) {
    return DioSingleton().getDio().post(
      "posts/",
      data: jsonObject,
    );
  }

  Future<Response<dynamic>> updatePost(int id, jsonObject) {
    return DioSingleton().getDio().put(
      "posts/$id",
      data: jsonObject,
    );
  }

  Future<Response<dynamic>> deletePost(int id) {
    return DioSingleton().getDio().put(
      "posts/$id",
    );
  }

}
