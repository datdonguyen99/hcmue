import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

showSnackBar(String content, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
    ),
  );
}

showErrorDialog(String msg) {
  EasyLoading.show(
    status: msg,
    indicator: const Icon(
      Icons.cancel,
      size: 50.0,
      color: Colors.red,
    ),
  );
}

showWarningDialog(String msg) {
  EasyLoading.show(
    status: msg,
    indicator: const Icon(
      Icons.warning,
      size: 50.0,
      color: Colors.orange,
    ),
  );
}

showInforDialog(String msg) {
  EasyLoading.show(
    status: msg,
    indicator: const Icon(
      Icons.info,
      size: 50.0,
      color: Colors.blue,
    ),
  );
}
