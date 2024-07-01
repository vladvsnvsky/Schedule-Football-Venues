import 'package:flutter/material.dart';
import 'package:minifootballfront/openapifiles/lib/api.dart';
import 'package:minifootballfront/screen/custom_field_widgets/select_hour_dropdown.dart';

import '../custom_field_widgets/custom_datepicker.dart';

class WhenScreen extends StatefulWidget {
  final GameDetailsDTO initialGameState;
  final Function(GameDetailsDTO) updateGameState;

  const WhenScreen(
      {Key? key, required this.initialGameState, required this.updateGameState})
      : super(key: key);

  @override
  _WhenScreenState createState() => _WhenScreenState();
}

class _WhenScreenState extends State<WhenScreen> {
  int? _selectedHour;
  int? _selectedDay;
  int? _selectedMonth;
  int? _selectedYear;

  GameDetailsDTO? _currentGameState;

  @override
  Widget build(BuildContext context) {
    return getWhenWidget();
  }

  void initState() {
    super.initState();
    _currentGameState = widget.initialGameState;
  }

  Widget getWhenWidget() {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  if (_currentGameState!.fieldId != null)
                    MyDatePicker(
                        initialText: 'Select the game time',
                        onDateChanged: (DateTime newVal) {
                          setState(() {
                            _selectedDay = newVal.day;
                            _selectedMonth = newVal.month;
                            _selectedYear = newVal.year;
                          });
                        }),
                  if (_selectedDay != null &&
                      _selectedMonth != null &&
                      _selectedYear != null)
                    SelectHourDropdown(
                        day: _selectedDay!,
                        month: _selectedMonth!,
                        year: _selectedYear!,
                        fieldId: _currentGameState!.fieldId!,
                        onHourSelected: (int newVal) {
                          try {
                            DateTime date = DateTime(_selectedYear!,
                                _selectedMonth!, _selectedDay!, newVal);
                            Duration distance = date.difference(DateTime.now());
                            if (distance.inHours < 24) {
                              _showSnackBar(
                                  "There must be more than 24 hours until the game starts!",
                                  Colors.yellow[600]!);
                            } else
                              setState(() {
                                _selectedHour = newVal;
                                _updateGameState();
                              });
                          } catch (e) {
                            _showSnackBar(e.toString(), Colors.red[600]!);
                          }
                        }),
                ])));
  }

  void _showSnackBar(String message, Color backgroundColor) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: backgroundColor,
    ));
  }

  _updateGameState() {
    _currentGameState!.startHour = _selectedHour!;
    _currentGameState!.endHour = _selectedHour! + 1;
    _currentGameState!.day = _selectedDay;
    _currentGameState!.month = _selectedMonth;
    _currentGameState!.year = _selectedYear;
    widget.updateGameState(_currentGameState!);
  }

  _handleNextClicked() {
    widget.updateGameState(_currentGameState!);
  }

  bool isValidated() {
    return _selectedHour != null &&
        _selectedDay != null &&
        _selectedMonth != null &&
        _selectedYear != null;
  }
}
