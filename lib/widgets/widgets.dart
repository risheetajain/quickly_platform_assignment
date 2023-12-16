import 'package:flutter/material.dart';

class Widgets {
  static areYouSureDialogBox(
      {required BuildContext context,
      required Function() onSuccess,
      required String keyword}) {
    showDialog(
      context: context,
      useSafeArea: true,
      builder: (BuildContext context) {
        return AlertDialog.adaptive(
          alignment: Alignment.center,
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

