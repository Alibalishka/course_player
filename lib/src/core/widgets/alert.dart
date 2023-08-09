import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppAlertWidgets {
  static Future<dynamic> customAlert(BuildContext context) {
    return showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text("Вниимание"),
        content: const Text('Ошибка! Неверный URL-адрес'),
        actions: [
          GestureDetector(
              onTap: () => context.router.pop(),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Ok',
                  textAlign: TextAlign.center,
                ),
              )),
        ],
      ),
    );
  }
}
