import 'package:flutter/material.dart';
import 'package:minifootballfront/openapifiles/lib/api.dart';
import 'package:minifootballfront/screen/wrapper.dart';
import 'package:minifootballfront/service/authservice.dart';
import 'package:minifootballfront/screen/custom_field_widgets/email_field.dart';
import 'package:minifootballfront/screen/custom_field_widgets/password_field.dart';
import 'package:minifootballfront/uihelper.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign In")),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              EmailField(controller: _emailController),
              PasswordField(
                  labelText: "Password", controller: _passwordController),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: _handleSubmit,
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleSubmit() async {
    // Ensure that the form fields are valid before proceeding.
    if (!_formKey.currentState!.validate()) return;

    try {
      // Create a new UserSignIn instance with the user's input.
      UserSignIn userSignIn = UserSignIn(
          email: _emailController.text, password: _passwordController.text);

      // Attempt to sign in the user with the provided credentials.
      String msg = await AuthService().signIn(userSignIn);

      // Check if the sign in was successful.
      if (msg == 'Success') {
        // Navigate to the Wrapper screen and remove all previous routes.
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Wrapper()),
          (Route<dynamic> route) => false,
        );
      } else {
        // If sign in was not successful, show a snackbar with the error message.
        MyUiHelper.showSnackBar(context, 'SignIn failed!', Colors.grey);
      }
    } catch (e) {
      MyUiHelper.showSnackBar(context, 'SignIn failed!', Colors.grey);
    }
  }
}
