import 'package:flutter/foundation.dart';
import 'package:flutter_boilerplate/api/dio_singleton.dart';
import 'package:flutter_boilerplate/helpers/utils.dart';
import 'package:flutter_boilerplate/models/post.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxList<Post> postsList = <Post>[].obs;

  @override
  void onInit() {
    _getPosts();
    super.onInit();
  }

  void _getPosts() {
    buildLoadingDialog();

    DioSingleton().getPostsService().getPosts().then((res) {
      dismissLoadingDialog();

      if (res.statusCode != null &&
          res.statusCode! >= 200 &&
          res.statusCode! < 300) {
        debugPrint("${res.data}");

        postsList.value =
            (res.data as List).map((x) => Post.fromJson(x)).toList();
      }
    }).catchError((error) {
      debugPrint(error);
      dismissLoadingDialog();
    });
  }

}
