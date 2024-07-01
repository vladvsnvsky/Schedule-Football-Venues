import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:minifootballfront/openapifiles/lib/api.dart';
import 'package:minifootballfront/screen/account_screen.dart';
import 'package:minifootballfront/screen/wrapper.dart';
import 'package:minifootballfront/service/tokenservice.dart';
import 'package:minifootballfront/service/userentityservice.dart';
import 'package:minifootballfront/uihelper.dart';

import '../service/authservice.dart';
import '../service/signalr_service.dart';
import 'auth_screen.dart';
import 'signinscreen.dart';

class UserInfo {
  UserEntityDTO? oldInfo;
  UserEntityDTO? newInfo;
  UserDetailsDTO? oldDetails;
  UserDetailsDTO? newDetails;
  AddressDTO? oldAddress;
  AddressDTO? newAddress;
}

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  bool _isLoading = false;
  int _completedChanges = 0;

  double FONT_SIZE = 20;

  late SignalRService _signalRService;

  UserInfo info = UserInfo();
  UserService? userService;

  bool _editUsername = false;
  TextEditingController _usernameController = TextEditingController();
  bool _editEmail = false;
  TextEditingController _emailController = TextEditingController();
  bool _editPassword = false;
  bool _editBirthdate = false;
  bool _editPhone = false;
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  TextEditingController _birthdateController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _streetAndNo = TextEditingController();

  @override
  void initState() {
    super.initState();
    _signalRService = SignalRService();
    _instantiateService();
  }

  @override
  void dispose() {
    _signalRService.stopConnection();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildEditableField(
                      label: 'Username',
                      controller: _usernameController,
                      isEditing: _editUsername,
                      onEditPressed: () => _toggleEditing('username'),
                      onConfirmPressed: () => _toggleEditing('username'),
                    ),
                    SizedBox(height: 16),
                    _buildEditableField(
                      label: 'Email',
                      controller: _emailController,
                      isEditing: _editEmail,
                      onEditPressed: () => _toggleEditing('email'),
                      onConfirmPressed: () => _toggleEditing('email'),
                    ),
                    SizedBox(height: 16),
                    _buildDatePickerField(
                      label: 'Birthdate',
                      controller: _birthdateController,
                      isEditing: _editBirthdate,
                      onEditPressed: () => _toggleEditing('birthdate'),
                      onConfirmPressed: () => _toggleEditing('birthdate'),
                    ),
                    SizedBox(height: 16),
                    _buildEditableField(
                      label: 'Phone',
                      controller: _phoneController,
                      isEditing: _editPhone,
                      onEditPressed: () => _toggleEditing('phone'),
                      onConfirmPressed: () => _toggleEditing('phone'),
                    ),
                    SizedBox(height: 16),
                    _buildPasswordFields(),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () async {
                        if (_completedChanges > 0) {
                          // Show a dialog that will ask the user to sign in again
                          bool signOut = await showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Sign In Again'),
                                content: Text(
                                    'You need to sign in again after updating your profile information.'),
                                actions: <Widget>[
                                  TextButton(
                                    child: Text('Cancel'),
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pop(false); // Return false
                                    },
                                  ),
                                  TextButton(
                                    child: Text('OK'),
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pop(true); // Return true
                                    },
                                  ),
                                ],
                              );
                            },
                          );

                          if (signOut) {
                            await AuthService().signOut();
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => AuthScreen()),
                              (Route<dynamic> route) => false,
                            );
                          }
                        } else {
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) => Wrapper()),
                            (Route<dynamic> route) => false,
                          );
                        }
                      },
                      child: Text('Complete changes'),
                    )
                  ],
                ),
              ),
            ),
    );
  }

  Future<bool> _showSignInDialog() async {
    return await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Sign In Required'),
              content: Text(
                  'You need to sign in again after updating your information.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SignInScreen()),
                    );
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        ) ??
        false;
  }

  Widget _buildDatePickerField({
    required String label,
    required TextEditingController controller,
    required bool isEditing,
    required VoidCallback onEditPressed,
    required VoidCallback onConfirmPressed,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () async {
              if (isEditing) {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2101),
                );
                if (pickedDate != null) {
                  controller.text = "${pickedDate.toLocal()}".split(' ')[0];
                }
              }
            },
            child: AbsorbPointer(
              child: TextField(
                controller: controller,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.greenAccent, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: isEditing ? Colors.red : Colors.white,
                        width: isEditing ? 2.0 : 0.0),
                  ),
                  hintText: 'Select Birthdate',
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 8),
        ElevatedButton(
          onPressed: isEditing ? onConfirmPressed : onEditPressed,
          child: Icon(isEditing ? Icons.check : Icons.edit),
        ),
      ],
    );
  }

  Widget _buildEditableField({
    required String label,
    required TextEditingController controller,
    required bool isEditing,
    required VoidCallback onEditPressed,
    required VoidCallback onConfirmPressed,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: isEditing
              ? TextField(
                  controller: controller,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.greenAccent, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 2.0),
                    ),
                    hintText: label,
                  ),
                )
              : Text(
                  controller.text.isNotEmpty ? controller.text : label,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: FONT_SIZE),
                ),
        ),
        SizedBox(width: 8),
        ElevatedButton(
          onPressed: isEditing ? onConfirmPressed : onEditPressed,
          child: Icon(isEditing ? Icons.check : Icons.edit),
        ),
      ],
    );
  }

  Widget _buildPasswordFields() {
    return _editPassword
        ? Column(
            children: [
              _buildPasswordField(
                controller: _passwordController,
                hintText: 'New Password',
              ),
              SizedBox(height: 8),
              _buildPasswordField(
                controller: _confirmPasswordController,
                hintText: 'Confirm Password',
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () async {
                  if (_passwordController.text.isNotEmpty &&
                      _passwordController.text ==
                          _confirmPasswordController.text) {
                    await _updatePassword();
                  } else {
                    MyUiHelper.showSnackBar(
                        context, "Passwords do not match", Colors.red);
                  }
                  _toggleEditing('password');
                },
                child: Icon(Icons.check),
              ),
            ],
          )
        : _buildEditableField(
            label: 'Password',
            controller: TextEditingController(text: '********'),
            isEditing: _editPassword,
            onEditPressed: () => _toggleEditing('password'),
            onConfirmPressed: () => _toggleEditing('password'),
          );
  }

  Future<void> _updatePassword() async {
    try {
      await userService!
          .updatePasswordAsync(newPassword: _passwordController.text);
      MyUiHelper.showSnackBar(
          context, "Password updated successfully", Colors.green);
      _completedChanges++;
    } catch (e) {
      MyUiHelper.showSnackBar(context, e.toString(), Colors.red);
    }
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required String hintText,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.greenAccent, width: 2.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 2.0),
              ),
              hintText: hintText,
            ),
            obscureText: true,
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons(String option) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Go Back'),
        ),
        SizedBox(width: 20),
        ElevatedButton(
          onPressed: () => {_updatePressed(option)},
          child: Text('Update'),
        ),
      ],
    );
  }

  void _instantiateService() async {
    setState(() {
      _isLoading = true;
    });
    try {
      String? jwt = await TokenService().getToken();
      if (jwt == null) throw Exception("Invalid Token!");
      userService = UserService(jwt: jwt);

      _loadUserData();
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      MyUiHelper.showSnackBar(context, e.toString(), Colors.red);
    }
  }

  Future<void> _loadUserData() async {
    setState(() {
      _isLoading = true;
    });
    try {
      UserEntityDTO? result = await userService!.getUserEntity();
      if (result == null) throw Exception("User information not loaded!");

      AddressDTO? address =
          await AddressApi().apiAddressGetGet(id: result.addressId);

      if (address == null) throw Exception("User address not loaded!");

      UserDetailsDTO? details = await userService!.getUserDetails();

      setState(() {
        _isLoading = false;
        info.oldAddress = address;
        info.oldDetails = details;
        info.oldInfo = result;
        _usernameController.text = result.username ?? '';
        _emailController.text = result.email ?? '';
        _birthdateController.text = details?.birthdate != null
            ? "${details!.birthdate!.toLocal()}".split(' ')[0]
            : '';
        _phoneController.text = details?.phone ?? '';
        _streetAndNo.text = address.streetAndNo ?? '';
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      MyUiHelper.showSnackBar(context, e.toString(), Colors.red);
    }
  }

  void _toggleEditing(String field) async {
    if (field == 'username') {
      var editState = !_editUsername;
      if (!editState && info.oldInfo!.username != _usernameController.text) {
        await _updatePressed('username');
      }
      setState(() {
        _editUsername = editState;
      });
    }
    if (field == 'email') {
      var editState = !_editEmail;
      if (!editState && info.oldInfo!.email != _emailController.text) {
        await _updatePressed('email');
      }
      setState(() {
        _editEmail = editState;
      });
    }
    if (field == 'birthdate') {
      var editState = !_editBirthdate;
      if (!editState &&
          DateTime.parse(_birthdateController.text) !=
              info.oldDetails!.birthdate) {
        await _updatePressed('birthdate');
      }
      setState(() {
        _editBirthdate = editState;
      });
    }
    if (field == 'phone') {
      var editState = !_editPhone;
      if (!editState && info.oldDetails!.phone != _phoneController.text) {
        await _updatePressed('phone');
      }
      setState(() {
        _editPhone = editState;
      });
    }
    if (field == 'password') {
      var editState = !_editPassword;
      setState(() {
        _editPassword = editState;
      });
    }
  }

  Future<UserEntityDTOUpdateRequestResponse?> _updatePressed(
      String option) async {
    try {
      if (option == 'username' &&
          _usernameController.text.isNotEmpty &&
          _usernameController.text != info.oldInfo!.username) {
        await userService!
            .updateUsernameAsync(newUsername: _usernameController.text);
        _completedChanges++;
      }
      if (option == 'email' &&
          _emailController.text.isNotEmpty &&
          _emailController.text != info.oldInfo!.email) {
        await userService!.updateEmailAsync(newEmail: _emailController.text);
        _completedChanges++;
      }
      if (option == 'birthdate' &&
          _birthdateController.text.isNotEmpty &&
          DateTime.parse(_birthdateController.text) !=
              info.oldDetails!.birthdate) {
        DateTime birthdate =
            DateFormat('yyyy-MM-dd').parse(_birthdateController.text);
        await userService!.updateBirthdateAsync(
          day: birthdate.day,
          month: birthdate.month,
          year: birthdate.year,
        );
        _completedChanges++;
      }
      if (option == 'phone' &&
          _phoneController.text.isNotEmpty &&
          _phoneController.text != info.oldDetails!.phone) {
        await userService!.updatePhoneAsync(phone: _phoneController.text);
        _completedChanges++;
      }
      if (option == 'password') {
        if (_passwordController.text.isNotEmpty) {
          if (_confirmPasswordController.text.isEmpty) {
            MyUiHelper.showSnackBar(
                context, 'You must confirm your new password.', Colors.red);
          } else {
            if (_confirmPasswordController.text != _passwordController.text) {
              MyUiHelper.showSnackBar(
                  context, 'Passwords don\'t match', Colors.red);
            } else {
              await userService!
                  .updatePasswordAsync(newPassword: _passwordController.text);
              _completedChanges++;
            }
          }
        }
      }
    } catch (e) {
      MyUiHelper.showSnackBar(context, e.toString(), Colors.red);
    }
    return null;
  }
}
