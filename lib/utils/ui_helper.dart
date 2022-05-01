import 'package:get/get.dart';

void showSnackBar(String msg, {String? title}) {
  Get.snackbar("$title", msg, snackPosition: SnackPosition.BOTTOM);
}
