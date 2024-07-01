import 'package:flutter/material.dart';

class PhoneField extends StatefulWidget {
  final TextEditingController? controller;

  PhoneField({Key? key, this.controller}) : super(key: key);

  @override
  _PhoneFieldState createState() => _PhoneFieldState();
}

class _PhoneFieldState extends State<PhoneField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Phone Number',
        ),
        keyboardType: TextInputType.phone,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your phone number';
          }
          // Further validation can be added here
          return null;
        },
      ),
    );
  }
}
