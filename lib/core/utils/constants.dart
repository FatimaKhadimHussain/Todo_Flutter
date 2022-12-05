
import 'package:flutter/material.dart';

void showAlertwDialog(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) =>
        AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Ok'))
          ],
        ),
  );
}