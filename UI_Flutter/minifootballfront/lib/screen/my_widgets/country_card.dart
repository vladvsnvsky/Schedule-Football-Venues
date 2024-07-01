import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../openapifiles/lib/api.dart';
import '../../uihelper.dart';

class CountryCard extends StatefulWidget {
  final CountryDTO country;
  final CountryApi? apiSource;

  CountryCard({required this.country, this.apiSource});

  @override
  _CountryCardState createState() => _CountryCardState();
}

class _CountryCardState extends State<CountryCard> {
  bool _isExtended = false;
  CountryDTO? _currentCountry;
  TextEditingController _nameController = TextEditingController();
  bool _nameChanged = false;

  @override
  void initState() {
    super.initState();
    _currentCountry = widget.country;
    _nameController.text = _currentCountry?.name ?? '';
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
      _nameChanged = _nameController.text != (_currentCountry?.name ?? '');
    });
  }

  Widget _buildCard() {
    return Card(
      color: Colors.white, // Ensure the card color is set appropriately
      child: ListTile(
        title: Text(
          _currentCountry?.name ?? 'Unknown',
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

      CreateCountryDTO obj = CreateCountryDTO(name: _nameController.text);

      var result = await widget.apiSource!
          .apiCountryUpdateIdPut(_currentCountry!.id!, createCountryDTO: obj);

      if (result != null)
        MyUiHelper.showSnackBar(context, "Country Updated", Colors.green);
      else
        throw Exception("Something went wrong!");

      setState(() {
        _currentCountry = result;
      });
    } catch (e) {
      MyUiHelper.showSnackBar(context, e.toString(), Colors.red);
    }
  }
}
