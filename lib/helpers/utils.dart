import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void handleResponseErrors(int statusCode) {
  switch (statusCode) {
    case 400:
      Get.snackbar("Error", "User does not exist, please retry");
      break;
    case 401:
      Get.snackbar("Error", "Session expired, please login again");
      // SharedPrefs prefs = SharedPrefs();
      // prefs.clearPrefs().then((value) => Get.offAll(() => SplashPage()));
      break;
    case 403:
      Get.snackbar("Error", "Access to this resource is forbidden");
      break;
    case 404:
      Get.snackbar("Error", "Resource not found, please retry");
      break;
    case 405:
      Get.snackbar("Error", "Method not allowed, please retry");
      break;
    case 408:
      Get.snackbar("Error", "An unexpected timeout occurred, please retry");
      break;
    case 409:
      Get.snackbar("Error", "A conflict occurred, please retry");
      break;
    case 415:
      Get.snackbar("Error", "Unsupported media type, please retry");
      break;
    case 500:
      Get.snackbar(
          "Error", "An internal error occured on the server, please retry");
      break;
    default:
      Get.snackbar("Error", "An unexpected error occurred");
      break;
  }
}

// LoggedInUser getLoggedInUser(){
//   return LoggedInUser.fromJson(jsonDecode(GetStorage().read(PREF_LOGGED_IN_USER)));
// }

Widget getLoadingBar() {
  return const SpinKitWave(
    color: Colors.blueAccent,
  );
}

buildLoadingDialog() {
  Future.delayed(Duration(seconds: 1), (){
    Get.dialog(
        const SpinKitWave(
          color: Colors.blueAccent,
        ),
        barrierDismissible: false);
  });
  // Get.defaultDialog(title: "Test", middleText: "Testing");
}

dismissLoadingDialog() {
  if (Get.isDialogOpen ?? false) {
    Get.back();
  }
}

// logoutAndGoToLogin() {
//   GetStorage().erase().then((value) => Get.offAll(() => LoginScreen(), binding: LoginBinding()));
// }

getAppBar(String title,
    {Function? searchFunc, Function? refreshFunc, Function? plusFunc}) {
  return AppBar(
    title: Text(title),
    centerTitle: true,
    backgroundColor: const Color.fromARGB(255, 82, 174, 213),
    automaticallyImplyLeading: true,
    elevation: 0,
    actions: [
      searchFunc != null
          ? IconButton(
              icon: const Icon(Icons.search, color: Colors.white),
              onPressed: () {
                return searchFunc();
              },
            )
          : const SizedBox.shrink(),
      refreshFunc != null
          ? IconButton(
              icon: const Icon(Icons.refresh, color: Colors.white),
              onPressed: () {
                return refreshFunc();
              },
            )
          : const SizedBox.shrink(),
      plusFunc != null
          ? IconButton(
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () {
                return plusFunc();
              })
          : const SizedBox.shrink()
    ],
  );
}
