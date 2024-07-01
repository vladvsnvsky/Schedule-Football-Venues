import 'package:flutter/material.dart';
import 'package:minifootballfront/service/venue_service.dart';

class SelectHourDropdown extends StatefulWidget {
  final Function(int) onHourSelected;

  final int day, month, year, fieldId;

  const SelectHourDropdown(
      {Key? key,
      required this.day,
      required this.month,
      required this.year,
      required this.fieldId,
      required this.onHourSelected})
      : super(key: key);

  @override
  State<SelectHourDropdown> createState() => _SelectHourDropdownState();
}

class _SelectHourDropdownState extends State<SelectHourDropdown> {
  List<int> _hours = [];
  int? _selectedHour;

  @override
  void didUpdateWidget(covariant SelectHourDropdown oldWidget) {
    super.didUpdateWidget(oldWidget);
    _loadHours();
  }

  @override
  void initState() {
    super.initState();
    _loadHours();
  }

  _loadHours() async {
    try {
      int selectedDay = widget.day;
      var hours = await VenueService().getAvailableHoursByDay(
          selectedDay, widget.month, widget.year, widget.fieldId);

      setState(() {
        _hours = hours;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: DropdownButtonFormField<int>(
          value: _selectedHour,
          onChanged: (newValue) {
            setState(() {
              _selectedHour = newValue;
            });
            widget.onHourSelected(newValue!);
          },
          items: _hours.isNotEmpty
              ? _hours.map((hour) {
                  return DropdownMenuItem<int>(
                    value: hour,
                    child: Text("${hour}:00"),
                  );
                }).toList()
              : [
                  DropdownMenuItem<int>(
                    value: null,
                    child: Text("No hours available!"),
                  )
                ],
          decoration: InputDecoration(
            labelText: 'Hour',
            border: OutlineInputBorder(),
          ),
          disabledHint: _hours.isEmpty ? Text('Select an hour first') : null,
        ));
  }
}
