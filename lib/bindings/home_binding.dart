import 'package:flutter_boilerplate/controllers/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.replace(HomeController());
  }
}