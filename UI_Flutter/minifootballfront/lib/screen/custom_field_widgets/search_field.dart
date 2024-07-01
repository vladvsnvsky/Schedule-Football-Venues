import 'package:flutter/material.dart';

class SearchFieldWidget extends StatefulWidget {
  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xff302360),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none),
          hintText: "eg. Field Of Bucharest",
          prefixIcon: Icon(Icons.search),
          prefixIconColor: Colors.purple.shade900),
    );
  }
}
