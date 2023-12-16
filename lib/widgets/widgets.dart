import 'package:flutter/material.dart';

class Widgets {
  static areYouSureDialogBox(
      {required BuildContext context,
      required Function() onSuccess,
      required String keyword}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog.adaptive(
          title: const Text("Are You sure?"),
          content: Text("Are you sure want to $keyword?"),
          actions: [
            ElevatedButton(onPressed: onSuccess, child: const Text("OK")),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Cancel")),
          ],
        );
      },
    );
  }
}

