import 'package:flutter/material.dart';

class AppDialog {
  late BuildContext context;
  AppDialog(this.context);

  Future<dynamic> loadingDialog() {
    return showDialog(
        context: context,
        builder: (context) => Dialog(
              insetPadding: const EdgeInsets.all(0.0),
              backgroundColor: Colors.transparent,
              child: WillPopScope(
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                  onWillPop: () async => false),
            ));
  }

  infoDialog(
    String title,
    String descript, {
    void Function()? firstOnPressed,
    void Function()? secondOnPressed,
    String? firstActionText,
    String? secondActionText,
  }) {
    return showDialog(
        context: context,
        builder: (context) => _defaultAlertDialog(
              title,
              descript,
              firstOnPressed: firstOnPressed,
              secondOnPressed: secondOnPressed,
              firstActionText: firstActionText,
              secondActionText: secondActionText,
            ));
  }

  Widget _defaultAlertDialog(
    String title,
    String descript, {
    void Function()? firstOnPressed,
    void Function()? secondOnPressed,
    String? firstActionText,
    String? secondActionText,
  }) {
    return AlertDialog(
      title: Text(title),
      content: Text(descript),
      actions: [
        if (secondActionText is String)
          TextButton(
            onPressed: secondOnPressed is Function() ? secondOnPressed : null,
            child: Text(
              secondActionText,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        TextButton(
          onPressed: firstOnPressed is Function()
              ? firstOnPressed
              : () {
                  Navigator.pop(context);
                },
          child: Text(
            firstActionText ?? "Kapat",
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
