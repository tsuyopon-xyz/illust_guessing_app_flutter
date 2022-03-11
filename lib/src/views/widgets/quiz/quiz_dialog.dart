import 'package:flutter/material.dart';

void showQuizDialog({
  required BuildContext context,
  required String title,
  String? body,
}) {
  String _body = body ?? '';

  showDialog(
      context: context,
      builder: (_context) {
        return AlertDialog(
          title: Text(title),
          content: Text(_body),
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
