import 'package:flutter/material.dart';

class CustomNavigator extends StatelessWidget {
  final String message;
  final Widget destinationScreen;

  const CustomNavigator(this.message, this.destinationScreen, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => destinationScreen),
      ),
      child: Text(
        message,
        style: TextStyle(
          color: Theme.of(context)
              .primaryColor, // Use the primary color from the theme
          decoration: TextDecoration
              .underline, // Underline the text to indicate it's clickable
        ),
      ),
    );
  }
}
