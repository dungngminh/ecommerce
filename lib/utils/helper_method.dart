import 'package:flutter/material.dart';

class HelperMethod{
  Future<void> showAlertDialog({
        required String title, String? subtitle, required Function() callBackFunc, required BuildContext context}) async {
      showDialog(
        context: (context),
        builder: (context) {
          return AlertDialog(
            title: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    right: 10,
                  ),
                  child: Placeholder(
                    // ICON
                    fallbackWidth: 20,
                    fallbackHeight: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            content: subtitle == null ? null : Text(subtitle),
            actions: [
              TextButton(
                onPressed: () {
                  callBackFunc();
                  Navigator.pop(context);
                },
                child: Text(
                  'OK',
                ),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'Cancel',
                ),
              ),
            ],
          );
        },
      );
    }
}