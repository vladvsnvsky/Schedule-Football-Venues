import 'package:flutter/material.dart';

class NavigationButtonWidget extends StatefulWidget {
  final Widget childWidget;

  const NavigationButtonWidget({Key? key, required this.childWidget})
      : super(key: key);

  @override
  State<NavigationButtonWidget> createState() => _NavigationButtonWidgetState();
}

class _NavigationButtonWidgetState extends State<NavigationButtonWidget> {
  void openWidget() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => widget.childWidget));
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: openWidget,
      child: Text('Open Widget'),
    );
  }
}
