import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showSnackBar(String msg, {String title = ''}) {
  Get.snackbar(title, msg, snackPosition: SnackPosition.BOTTOM);
}


BuildContext? _dialogContext;

closeLoader() {
  if (_dialogContext != null) {
    Navigator.pop(_dialogContext!);
    _dialogContext = null;
  }
}

Future<void> startLoader(BuildContext context) async {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (buildContext) {
      _dialogContext = buildContext;
      return const SizedBox(
          height: 50,
          width: 50,
          child: Center(child: CircularProgressIndicator()));
    },
  );
}
