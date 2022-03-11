import 'package:flutter/material.dart';

void showQuizDialog({
  required BuildContext context,
  required String title,
  required String body,
}) {
  showDialog(
      context: context,
      builder: (_context) {
        return AlertDialog(
          title: Text(title),
          content: Text(body),
          actions: [
            ElevatedButton(
              child: const Text("閉じる"),
              onPressed: () {
                Navigator.pop(_context);
              },
            ),
          ],
        );
      });
}
