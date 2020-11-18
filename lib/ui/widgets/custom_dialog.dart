import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

customDialog(BuildContext context) {
  if (Platform.isIOS) {
    showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text('Coming Soon!'),
          content: Text('This feature will be coming soon!'),
          actions: [
            CupertinoDialogAction(
              child: Text('Ok'),
              onPressed: () {
                Get.back();
              },
            ),
          ],
        );
      },
    );
  } else {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Coming Soon!'),
          content: Text('This feature will be coming soon!'),
          actions: [
            FlatButton(
              onPressed: () {
                Get.back();
              },
              child: Text('Ok'),
            ),
          ],
        );
      },
    );
  }
}
