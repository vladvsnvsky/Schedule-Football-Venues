// signup_screen.dart
import 'package:flutter/material.dart';
import 'package:minifootballfront/openapifiles/lib/api.dart';
import 'package:minifootballfront/screen/custom_field_widgets/birthdate_field.dart';
import 'package:minifootballfront/screen/custom_field_widgets/select_city_dropdown.dart';
import 'package:minifootballfront/screen/custom_field_widgets/select_country_dropdown.dart';
import 'package:minifootballfront/screen/custom_field_widgets/custom_navigator.dart';
import 'package:minifootballfront/screen/custom_field_widgets/email_field.dart';
import 'package:minifootballfront/screen/custom_field_widgets/password_field.dart';
import 'package:minifootballfront/screen/custom_field_widgets/phone_field.dart';
import 'package:minifootballfront/screen/custom_field_widgets/streetandno_field.dart';
import 'package:minifootballfront/screen/custom_field_widgets/username_field.dart';
import 'package:minifootballfront/screen/signinscreen.dart';
import 'package:minifootballfront/service/signup_service.dart';

class SignUpScreen extends StatefulWidget {
  final Function()? successCallback;
  const SignUpScreen({super.key, this.successCallback});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  int? _selectedCountryId, _selectedCityId;

  bool _isLoading = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _streetAndNoController = TextEditingController();
  final TextEditingController _birthdateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (_isLoading)
      return Center(
        child: CircularProgressIndicator(),
      );
    else
      return Scaffold(
        appBar: AppBar(title: const Text("Sign Up")),
        body: SingleChildScrollView(
          child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  EmailField(controller: _emailController),
                  PasswordField(
                      controller: _passwordController, labelText: "Password"),
                  PasswordField(
                      controller: _confirmPasswordController,
                      labelText: "Confirm Password"),
                  UsernameField(controller: _usernameController),
                  PhoneField(controller: _phoneController),
                  BirthdateField(
                    controller: _birthdateController,
                    onDateChanged: (DateTime) {},
                  ),
                  SelectCountryDropdown(
                    onCountrySelected: (int countryId) {
                      setState(() {
                        _selectedCountryId = countryId;
                      });
                    },
                  ),
                  if (_selectedCountryId != null)
                    SelectCityDropdown(
                        countryId: _selectedCountryId!,
                        onCitySelected: (int cityId) {
                          setState(() {
                            _selectedCityId = cityId;
                          });
                        }),
                  if (_selectedCityId != null)
                    StreetAndNoField(controller: _streetAndNoController),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          _handleSubmit();
                          print("Form Submitted Successfully!");
                        },
                        child: Text('Submit'),
                      )),
                ],
              )),
        ),
      );
  }

  Future<void> _handleSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    try {
      if (_passwordController.text != _confirmPasswordController.text)
        throw new Exception("Passwords don't match!");

      DateTime birthdate = DateTime.parse(_birthdateController.text);

      final userDetails = CreateUserDetailsDTO(
          phone: _phoneController.text,
          birthDay: birthdate.day,
          birthMonth: birthdate.month,
          birthYear: birthdate.year); // Ensure proper DateTime parsing

      final address = CreateAddressDTO(
          cityId: _selectedCityId, streetAndNo: _streetAndNoController.text);

      final userEntity = CreateUserEntityDTO(
          email: _emailController.text,
          password: _passwordController.text,
          username: _usernameController.text,
          userDetails: userDetails,
          address: address);

      await SignUpService().createUser(userEntity);

      setState(() {
        _isLoading = true;
      });

      // Display a success message using Snackbar
      ScaffoldMessenger.of(context)
          .showSnackBar(
            SnackBar(
              content: Text('Account created successfully!'),
              backgroundColor: Colors.green,
            ),
          )
          .closed
          .then((reason) {
        widget.successCallback?.call();
      });
    } catch (e) {
      // Display an error message if something goes wrong
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
