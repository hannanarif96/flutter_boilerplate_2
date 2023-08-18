import 'package:flutter_boilerplate/bindings/home_binding.dart';
import 'package:flutter_boilerplate/screens/home_screen.dart';
import 'package:get/get.dart';

final routes = [
  GetPage(name: '/', page: () => HomeScreen(), binding: HomeBinding()),
  // GetPage(name: '/second', page: () => Second()),
  // GetPage(name: '/third', page: () => Third()),
  // GetPage(name: "/fourth", page: () => Fourth()),
];
