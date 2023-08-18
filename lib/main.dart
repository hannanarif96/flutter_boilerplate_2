import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/bindings/home_binding.dart';
import 'package:flutter_boilerplate/screens/home_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'helpers/routes.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const HomeScreen(),
      initialBinding: HomeBinding(),
      getPages: routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
