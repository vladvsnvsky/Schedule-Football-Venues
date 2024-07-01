// widgets/streetandno_field.dart
import 'package:flutter/material.dart';

class StreetAndNoField extends StatelessWidget {
  final TextEditingController? controller;

  StreetAndNoField({Key? key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Street and Number',
          hintText: 'Enter your street and number',
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your street and number';
          }
          return null;
        },
      ),
    );
  }
}
