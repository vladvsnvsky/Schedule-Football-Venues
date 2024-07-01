import 'package:flutter/material.dart';
import 'package:minifootballfront/openapifiles/lib/api.dart';
import 'package:minifootballfront/service/cityservice.dart';
import 'package:minifootballfront/uihelper.dart';

class SelectCityDropdown extends StatefulWidget {
  final int? countryId;
  final Function(int) onCitySelected;
  final int? value;

  const SelectCityDropdown(
      {Key? key,
      required this.countryId,
      required this.onCitySelected,
      this.value})
      : super(key: key);

  @override
  State<SelectCityDropdown> createState() => _SelectCityDropdownState();
}

class _SelectCityDropdownState extends State<SelectCityDropdown> {
  List<CityDTO>? _cities = [];
  int? _selectedCityId;

  @override
  void didUpdateWidget(covariant SelectCityDropdown oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.countryId != widget.countryId && widget.countryId != null) {
      _loadCities();
    }
    if (widget.value != oldWidget.value) {
      setState(() {
        _selectedCityId = widget.value;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _selectedCityId = widget.value;
    if (widget.countryId != null) _loadCities();
  }

  _loadCities() async {
    try {
      final cities =
          await CityService().getCitiesByCountryId(widget.countryId!);
      setState(() {
        _cities = cities ?? [];
        if (!cities.any((city) => city.id == _selectedCityId)) {
          _selectedCityId = null;
        }
      });
    } catch (e) {
      if (mounted) MyUiHelper.showSnackBar(context, e.toString(), Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: DropdownButtonFormField<int>(
        value: _selectedCityId,
        onChanged: (newValue) {
          setState(() {
            _selectedCityId = newValue;
          });
          widget.onCitySelected(newValue!);
        },
        items: _cities?.map((city) {
          return DropdownMenuItem<int>(
            value: city.id,
            child: Text(city.name!),
          );
        }).toList(),
        decoration: InputDecoration(
          labelText: 'City',
          border: OutlineInputBorder(),
        ),
        disabledHint: _cities == null || _cities!.isEmpty
            ? Text('Select a country first')
            : null,
      ),
    );
  }
}
