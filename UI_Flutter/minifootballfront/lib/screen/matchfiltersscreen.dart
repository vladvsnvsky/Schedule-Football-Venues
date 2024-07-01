import 'package:flutter/material.dart';
import 'package:minifootballfront/openapifiles/lib/api.dart';
import 'package:minifootballfront/screen/custom_field_widgets/select_city_dropdown.dart';
import 'package:minifootballfront/screen/custom_field_widgets/select_country_dropdown.dart';
import 'package:minifootballfront/screen/custom_field_widgets/select_venue_dropdown.dart';

import '../matchfilters.dart';

class MatchFiltersScreen extends StatefulWidget {
  final Function(MatchFilters)? filtersSelected;

  const MatchFiltersScreen({super.key, this.filtersSelected});

  @override
  _MatchFiltersScreenState createState() => _MatchFiltersScreenState();
}

class _MatchFiltersScreenState extends State<MatchFiltersScreen> {
  final _formKey = GlobalKey<FormState>();
  MatchFilters _filters = MatchFilters();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Filters'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildSectionTitle('Filter by location'),
              SelectCountryDropdown(
                onCountrySelected: (value) {
                  setState(() {
                    _filters.countryId = value;
                  });
                },
                value: _filters.countryId,
              ),
              if (_filters.countryId != null)
                SelectCityDropdown(
                  countryId: _filters.countryId,
                  onCitySelected: (value) {
                    setState(() {
                      _filters.cityId = value;
                    });
                  },
                  value: _filters.cityId,
                ),
              if (_filters.cityId != null)
                SelectVenueDropdown(
                  cityId: _filters.cityId,
                  onVenueSelected: (value) {
                    setState(() {
                      _filters.fieldId = value;
                    });
                  },
                  value: _filters.fieldId,
                ),
              _buildDivider(),
              _buildSectionTitle('Filter by Date Range'),
              _buildDatePickerField(
                label: _filters.startDateFrom != null
                    ? _filters.startDateFrom!.year.toString() +
                        '-' +
                        _filters.startDateFrom!.month.toString() +
                        '-' +
                        _filters.startDateFrom!.day.toString()
                    : 'From',
                onChanged: (value) => setState(() {
                  _filters.startDateFrom = value;
                }),
              ),
              _buildDatePickerField(
                label: _filters.endDateTo != null
                    ? _filters.endDateTo!.year.toString() +
                        '-' +
                        _filters.endDateTo!.month.toString() +
                        '-' +
                        _filters.endDateTo!.day.toString()
                    : 'To',
                onChanged: (value) => setState(() {
                  _filters.endDateTo = value;
                }),
              ),
              _buildDivider(),
              _buildSectionTitle('Filter by Players'),
              _buildTextField(
                label: 'Min Players Required',
                onChanged: (value) =>
                    _filters.minPlayersRequired = int.tryParse(value),
              ),
              _buildTextField(
                label: 'Max Players Required',
                onChanged: (value) =>
                    _filters.maxPlayersRequired = int.tryParse(value),
              ),
              _buildDivider(),
              _buildSectionTitle('Additional Filters'),
              _buildCheckbox(
                label: 'Player Can Join',
                value: _filters.playerCanJoin ?? false,
                onChanged: (value) =>
                    setState(() => _filters.playerCanJoin = value),
              ),
              _buildCheckbox(
                label: 'Finished',
                value: _filters.finished ?? false,
                onChanged: (value) => setState(() => _filters.finished = value),
              ),
              _buildCheckbox(
                label: 'Cancelled',
                value: _filters.cancelled ?? false,
                onChanged: (value) =>
                    setState(() => _filters.cancelled = value),
              ),
              _buildDivider(),
              _buildSectionTitle('Availability'),
              _buildTextField(
                label: 'Min Spots Available',
                onChanged: (value) =>
                    _filters.minSpotsAvailable = int.tryParse(value),
              ),
              _buildTextField(
                label: 'Max Spots Available',
                onChanged: (value) =>
                    _filters.maxSpotsAvailable = int.tryParse(value),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _resetFilters,
                    child: Text('Reset Filters'),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: _completeAction,
                    child: Text('Apply Filters'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required Function(String) onChanged,
  }) {
    return TextFormField(
      decoration: InputDecoration(labelText: label),
      keyboardType: TextInputType.number,
      onChanged: onChanged,
    );
  }

  Widget _buildDatePickerField({
    required String label,
    required Function(DateTime?) onChanged,
  }) {
    return GestureDetector(
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(2101),
        );
        onChanged(pickedDate);
      },
      child: AbsorbPointer(
        child: TextFormField(
          decoration: InputDecoration(labelText: label),
        ),
      ),
    );
  }

  Widget _buildCheckbox({
    required String label,
    required bool value,
    required void Function(bool?)? onChanged,
  }) {
    return CheckboxListTile(
      title: Text(label),
      value: value,
      onChanged: onChanged,
    );
  }

  Widget _buildSectionTitle(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Widget _buildDivider() {
    return Divider();
  }

  void _completeAction() {
    if (_formKey.currentState!.validate()) {
      widget.filtersSelected!(_filters);
      Navigator.pop(context);
    }
  }

  void _resetFilters() {
    setState(() {
      _filters = MatchFilters();
    });
  }
}
