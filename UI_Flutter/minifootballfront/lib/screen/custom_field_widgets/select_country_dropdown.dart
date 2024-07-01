import 'package:flutter/material.dart';

import '../../openapifiles/lib/api.dart';
import '../../service/countryservice.dart';
import '../../uihelper.dart';

class SelectCountryDropdown extends StatefulWidget {
  final Function(int) onCountrySelected;
  final int? value;

  const SelectCountryDropdown(
      {Key? key, required this.onCountrySelected, this.value})
      : super(key: key);

  @override
  State<SelectCountryDropdown> createState() => _SelectCountryDropdownState();
}

class _SelectCountryDropdownState extends State<SelectCountryDropdown> {
  List<CountryDTO>? _countries = [];
  int? _selectedCountryId;

  @override
  void initState() {
    super.initState();
    _selectedCountryId = widget.value;
    _loadCountries();
  }

  @override
  void didUpdateWidget(SelectCountryDropdown oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      setState(() {
        _selectedCountryId = widget.value;
      });
    }
  }

  _loadCountries() async {
    try {
      final countries = await CountryService().getCountries();
      setState(() {
        _countries = countries;
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
        value: _selectedCountryId,
        onChanged: (newValue) {
          setState(() {
            _selectedCountryId = newValue;
          });
          widget.onCountrySelected(newValue!);
        },
        items: _countries?.map((country) {
          return DropdownMenuItem<int>(
            value: country.id,
            child: Text(country.name!),
          );
        }).toList(),
        decoration: InputDecoration(
          labelText: 'Country',
          border: OutlineInputBorder(),
        ),
        disabledHint: _countries == null || _countries!.isEmpty
            ? Text('Loading countries...')
            : null,
      ),
    );
  }
}
