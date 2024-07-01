import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyDatePicker extends StatefulWidget {
  final TextEditingController? controller;
  final Function(DateTime) onDateChanged;
  final String initialText;

  const MyDatePicker(
      {super.key,
      this.controller,
      required this.initialText,
      required this.onDateChanged});

  @override
  _MyDatePickerState createState() => _MyDatePickerState();
}

class _MyDatePickerState extends State<MyDatePicker> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
  }

  @override
  void dispose() {
    // Only dispose the controller if it was created by this widget
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 50)),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light(), // This could be customized as needed
            child: child!,
          );
        });

    if (picked != null) {
      setState(() {
        _controller.text = DateFormat('yyyy-MM-dd').format(picked);
      });
      widget.onDateChanged(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: TextFormField(
        controller: _controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: widget.initialText,
          hintText: 'Choose the date of the game',
          suffixIcon: IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: () => _selectDate(context),
          ),
        ),
        readOnly: true, // Prevents keyboard from appearing
        validator: (value) {
          if (value == null || value.isEmpty) {
            return widget.initialText;
          }
          return null;
        },
      ),
    );
  }
}
