import 'package:flutter/material.dart';
import 'package:minifootballfront/openapifiles/lib/api.dart';
import 'package:minifootballfront/service/venue_service.dart';
import 'package:minifootballfront/uihelper.dart';

class SelectVenueDropdown extends StatefulWidget {
  final int? cityId;
  final Function(int) onVenueSelected;
  final int? value;

  const SelectVenueDropdown(
      {Key? key,
      required this.cityId,
      required this.onVenueSelected,
      this.value})
      : super(key: key);

  @override
  State<SelectVenueDropdown> createState() => _SelectVenueDropdownState();
}

class _SelectVenueDropdownState extends State<SelectVenueDropdown> {
  List<FieldDTO>? _venues = [];
  int? _selectedVenueId;
  MyUiHelper uiHelper = MyUiHelper();

  @override
  void didUpdateWidget(covariant SelectVenueDropdown oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.cityId != widget.cityId && widget.cityId != null) {
      _loadVenues();
    }
    if (widget.value != oldWidget.value) {
      setState(() {
        _selectedVenueId = widget.value;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _selectedVenueId = widget.value;
    if (widget.cityId != null) _loadVenues();
  }

  _loadVenues() async {
    try {
      final venues = await VenueService().getVenuesByCityId(widget.cityId!);
      setState(() {
        _venues = venues?.where((v) => v.isActive == true).toList() ?? [];
        if (_venues!.any((venue) => venue.id == _selectedVenueId)) {
          _selectedVenueId = null;
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
        value: _selectedVenueId,
        onChanged: (newValue) {
          setState(() {
            _selectedVenueId = newValue;
          });
          widget.onVenueSelected(newValue!);
        },
        items: _venues?.map((venue) {
          return DropdownMenuItem<int>(
            value: venue.id,
            child: Text(venue.name!),
          );
        }).toList(),
        decoration: InputDecoration(
          labelText: 'Venue',
          border: OutlineInputBorder(),
        ),
        disabledHint: _venues == null || _venues!.isEmpty
            ? Text('No venues available')
            : null,
      ),
    );
  }
}
