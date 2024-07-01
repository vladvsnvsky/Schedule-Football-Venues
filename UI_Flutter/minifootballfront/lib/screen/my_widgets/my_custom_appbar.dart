import 'package:flutter/material.dart';
import 'package:minifootballfront/screen/auth_screen.dart';
import 'package:minifootballfront/screen/signinscreen.dart';
import 'package:minifootballfront/screen/wrapper.dart';
import 'package:minifootballfront/service/authservice.dart';

class MyCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final double? budget;
  final List<Widget>? actions;

  const MyCustomAppBar({super.key, this.title, this.budget, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          if (title != null)
            Row(
              children: [Text(title!)],
            ),
          Row(children: [
            Icon(
              Icons.wallet,
              size: 20,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Account balance: \$${budget?.toStringAsFixed(2) ?? '0.00'}',
              style: TextStyle(fontSize: 13),
            ),
          ])
        ],
      ),
      actions: actions,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 20);
}
