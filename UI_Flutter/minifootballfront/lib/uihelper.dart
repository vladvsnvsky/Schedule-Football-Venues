import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyUiHelper {
  static void showSnackBar(
      BuildContext context, String message, Color? backgroundColor) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor:
            backgroundColor ?? Theme.of(context).colorScheme.primary,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  static void showAlertDialog(
      BuildContext context, String title, String message, Function actionToDo) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
                child: Text("Cancel"),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
            TextButton(
              child: Text('OK'),
              onPressed: () {
                actionToDo();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void showToast(BuildContext context, String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Theme.of(context).colorScheme.primary,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  // Method to show a custom bottom sheet
  void showBottomSheet(BuildContext context, Widget content) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: content,
        );
      },
    );
  }

  void showCustomDialog(
    BuildContext context, {
    required String title,
    required String message,
    required List<Widget> actions,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: actions,
        );
      },
    );
  }

  void navigateWithGoBackOption(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    ).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Returned from ${screen.runtimeType}')),
      );
    });
  }

  Widget createCardButton(
      String? text,
      MaterialColor? backgroundColor,
      MaterialColor? foregroundColor,
      double? textSize,
      double? borderRadius,
      Function()? onPressed) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor:
            WidgetStateProperty.all<Color>(backgroundColor ?? Colors.red),
        foregroundColor:
            WidgetStateProperty.all<Color>(foregroundColor ?? Colors.white),
        padding: WidgetStateProperty.all<EdgeInsets>(
            EdgeInsets.symmetric(horizontal: 20, vertical: 12)),
        textStyle: WidgetStateProperty.all<TextStyle>(
          TextStyle(
            fontSize: textSize ?? 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 8),
          ),
        ),
      ),
      onPressed: onPressed ?? null,
      child: Text(text ?? "Action"),
    );
  }
}
