// widgets/password_field.dart
import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController? controller;
  final String labelText;

  PasswordField({Key? key, this.controller, required this.labelText})
      : super(key: key);

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = true;
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: TextFormField(
        controller: widget.controller,
        obscureText: _obscureText,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: widget.labelText,
          hintText: 'Enter your password',
          // This is the part where we add the eye icon to toggle the password visibility
          suffixIcon: IconButton(
            icon: Icon(
              // Change the icon based on the visibility state
              _obscureText ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: _togglePasswordVisibility,
          ),
        ),
        // validator: (value) {
        //   if (value == null || value.isEmpty) {
        //     return 'Please enter a password';
        //   } else if (value.length < 8) {
        //     return 'Password must be at least 8 characters long';
        //   }
        //   return null;
        // },
      ),
    );
  }
}
