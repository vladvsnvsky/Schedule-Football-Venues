// widgets/username_field.dart
import 'package:flutter/material.dart';

class UsernameField extends StatelessWidget {
  final TextEditingController? controller;

  UsernameField({Key? key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Username',
          hintText: 'Enter your username',
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter a username';
          } else if (value.length < 4) {
            return 'Username must be at least 4 characters long';
          }
          return null;
        },
      ),
    );
  }
}
