import 'package:flutter/material.dart';
import 'package:minifootballfront/openapifiles/lib/api.dart';

import '../../uihelper.dart';

class CityCard extends StatefulWidget {
  final CityDTO city;
  final CityApi? apiSource;

  CityCard({required this.city, this.apiSource});

  @override
  _CityCardState createState() => _CityCardState();
}

class _CityCardState extends State<CityCard> {
  bool _isExtended = false;
  CityDTO? _currentCity;
  TextEditingController _nameController = TextEditingController();
  bool _nameChanged = false;

  @override
  void initState() {
    super.initState();
    _currentCity = widget.city;
    _nameController.text = _currentCity?.name ?? '';
    _nameController.addListener(_onNameChanged);
  }

  @override
  void dispose() {
    _nameController.removeListener(_onNameChanged);
    _nameController.dispose();
    super.dispose();
  }

  void _onNameChanged() {
    setState(() {
      _nameChanged = _nameController.text != (_currentCity?.name ?? '');
    });
  }

  Widget _buildCard() {
    return Card(
      color: Colors.white, // Ensure the card color is set appropriately
      child: ListTile(
        title: Text(
          _currentCity?.name ?? 'Unknown',
          style: TextStyle(color: Colors.black), // Text color
        ),
        onTap: () {
          setState(() {
            _isExtended = true;
          });
        },
      ),
    );
  }

  Widget _buildExtendedCard() {
    return Card(
      color: Colors.white, // Ensure the card color is set appropriately
      child: Column(
        children: [
          TextField(
            controller: _nameController,
            decoration: InputDecoration(
                labelText: 'Update Name',
                contentPadding: EdgeInsets.fromLTRB(15, 10, 15, 0)),
          ),
          if (_nameChanged)
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _onUpdatePressed();
                  _isExtended = false;
                  _nameChanged = false;
                });
              },
              child: Text('Update'),
            ),
          TextButton(
            onPressed: () {
              setState(() {
                _isExtended = false;
              });
            },
            child: Text('Cancel'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isExtended) {
      return _buildExtendedCard();
    } else {
      return _buildCard();
    }
  }

  void _onUpdatePressed() async {
    try {
      if (_nameController.text.isEmpty) throw Exception("Enter a valid name!");

      if (widget.apiSource == null) throw Exception("Api Source not defined");

      CreateCityDTO obj = CreateCityDTO(name: _nameController.text);

      widget.apiSource != null
          ? await widget.apiSource!
              .apiCityUpdatePut(id: widget.city.id, createCityDTO: obj)
          : MyUiHelper.showSnackBar(context, 'Couldn\'t update', Colors.red);
    } catch (e) {
      MyUiHelper.showSnackBar(context, e.toString(), Colors.red);
    }
  }
}
