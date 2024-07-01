import 'package:flutter/material.dart';
import 'package:minifootballfront/openapifiles/lib/api.dart';
import 'package:minifootballfront/screen/custom_field_widgets/select_country_dropdown.dart';
import 'package:minifootballfront/screen/custom_field_widgets/select_city_dropdown.dart';
import 'package:minifootballfront/screen/custom_field_widgets/select_venue_dropdown.dart';

class WhereScreen extends StatefulWidget {
  final GameDetailsDTO initialGameState;
  final Function(GameDetailsDTO) updateGameState;

  const WhereScreen({
    Key? key,
    required this.initialGameState,
    required this.updateGameState,
  }) : super(key: key);

  @override
  _WhereScreenState createState() => _WhereScreenState();
}

class _WhereScreenState extends State<WhereScreen> {
  int? _countryId;
  int? _cityId;
  int? _venueId;

  GameDetailsDTO? _currentGameState;

  @override
  void initState() {
    super.initState();
    _currentGameState = widget.initialGameState;
    _loadLocationIfExists();
  }

  void _loadLocationIfExists() {
    if (widget.initialGameState.countryId != null &&
        widget.initialGameState.cityId != null &&
        widget.initialGameState.fieldId != null) {
      setState(() {
        _countryId = widget.initialGameState.countryId;
        _cityId = widget.initialGameState.cityId;
        _venueId = widget.initialGameState.fieldId;
      });
    }
  }

  Widget getWhereWidget() {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SelectCountryDropdown(
              onCountrySelected: (int newVal) {
                setState(() {
                  _countryId = newVal;
                });
              },
            ),
            if (_countryId != null)
              SelectCityDropdown(
                countryId: _countryId!,
                onCitySelected: (int newVal) {
                  setState(() {
                    _cityId = newVal;
                  });
                },
              ),
            if (_cityId != null)
              SelectVenueDropdown(
                cityId: _cityId!,
                onVenueSelected: (int newVal) {
                  setState(() {
                    _venueId = newVal;
                    _updateGameState();
                  });
                },
              ),
          ],
        ),
      ),
    );
  }

  void _updateGameState() {
    _currentGameState!.countryId = _countryId;
    _currentGameState!.cityId = _cityId;
    _currentGameState!.fieldId = _venueId;
    widget.updateGameState(_currentGameState!);
  }

  void _handleNextClicked() {
    widget.updateGameState(_currentGameState!);
  }

  @override
  Widget build(BuildContext context) {
    return getWhereWidget();
  }
}
