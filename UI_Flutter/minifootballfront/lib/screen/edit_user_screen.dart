import 'package:flutter/material.dart';
import 'package:minifootballfront/openapifiles/lib/api.dart';

class EditUserScreen extends StatefulWidget {
  final UserEntityDTO currentState;

  const EditUserScreen({super.key, required this.currentState});
  @override
  _EditUserScreenState createState() => _EditUserScreenState();
}

class _EditUserScreenState extends State<EditUserScreen> {
  UpdateUserEntityDTO? _userEntityDTO;
  UpdateUserDetailsDTO? _userDetailsDTO;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
