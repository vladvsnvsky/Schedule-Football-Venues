import 'package:flutter/material.dart';
import 'package:minifootballfront/openapifiles/lib/api.dart';
import 'package:minifootballfront/screen/custom_field_widgets/select_country_dropdown.dart';
import 'package:minifootballfront/screen/my_widgets/my_custom_appbar.dart';
import 'package:minifootballfront/service/BearerAuthentication.dart';
import 'package:minifootballfront/service/addressservice.dart';
import 'package:minifootballfront/service/tokenservice.dart';
import 'package:minifootballfront/uihelper.dart';

import 'custom_field_widgets/select_city_dropdown.dart';

class EditAddressScreen extends StatefulWidget {
  final int? venueId;
  final int? userId;
  final int? addressId;

  const EditAddressScreen.forUser({
    Key? key,
    required this.userId,
  })  : venueId = null,
        addressId = null,
        super(key: key);

  const EditAddressScreen.forVenue({
    Key? key,
    required this.venueId,
  })  : userId = null,
        addressId = null,
        super(key: key);

  const EditAddressScreen.forAddress({
    Key? key,
    required this.addressId,
  })  : userId = null,
        venueId = null,
        super(key: key);

  @override
  _EditAddressScreenState createState() => _EditAddressScreenState();
}

class _EditAddressScreenState extends State<EditAddressScreen> {
  bool _isLoading = false;
  AddressApi? _api;
  BearerAuthentication? _auth;
  ApiClient? _apiClient;

  AddressDTO? oldInfo;

  late TextEditingController latitudeController,
      longitudeController,
      streetAndNoController;
  int? _selectedCountryId;
  int? _selectedCityId;
  double? _latitude, _longitude;

  @override
  void initState() {
    super.initState();
    if (_api == null)
      _authorizeUser();
    else
      _fetchData();
  }

  @override
  void dispose() {
    streetAndNoController.dispose();

    super.dispose();
  }

  Future<void> _authorizeUser() async {
    var jwt = await TokenService().getToken();
    _auth = BearerAuthentication(jwt!);
    _apiClient = ApiClient(authentication: _auth);
    _api = AddressApi(_apiClient);

    _fetchData();
  }

  Future<void> _fetchData() async {
    setState(() {
      _isLoading = true;
    });
    try {
      if (_api == null) {
        MyUiHelper.showSnackBar(context, 'Api not accessible!', Colors.grey);
        _authorizeUser();
      } else {
        AddressDTO? address;
        if (widget.userId != null)
          address = await _api?.apiAddressByUserIdGet(id: widget.userId!);
        else if (widget.addressId != null)
          address = await _api?.apiAddressGetGet(id: widget.addressId);
        else
          address = await _api?.apiAddressByVenueIdGet(id: widget.venueId);

        setState(() {
          oldInfo = address;
          if (oldInfo != null) {
            streetAndNoController =
                TextEditingController(text: oldInfo!.streetAndNo);
            _selectedCountryId = oldInfo!.countryId;
            _selectedCityId = oldInfo!.cityId;
            _latitude = oldInfo!.latitude;
            _longitude = oldInfo!.longitude;
            latitudeController =
                TextEditingController(text: _latitude.toString());
            longitudeController =
                TextEditingController(text: _longitude.toString());
          }
        });
      }
    } catch (e) {
      MyUiHelper.showSnackBar(context, e.toString(), Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Address'),
      ),
      body: updateAddressFieldsColumn(),
    );
  }

  Widget updateAddressFieldsColumn() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SelectCountryDropdown(
            onCountrySelected: _newCountrySelected,
            value: _selectedCountryId,
          ),
          if (_selectedCountryId != null)
            SelectCityDropdown(
              countryId: _selectedCountryId!,
              onCitySelected: _newCitySelected,
              value: oldInfo?.cityId,
            ),
          if (_selectedCityId != null) ...[
            TextField(
                controller: streetAndNoController,
                decoration: InputDecoration(labelText: 'Street and Number')),
            TextField(
                controller: latitudeController,
                decoration: InputDecoration(labelText: 'Latitude')),
            TextField(
                controller: longitudeController,
                decoration: InputDecoration(labelText: 'Longitude')),
          ],
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                  onPressed: _goBack, child: Text("Cancel and go back!")),
              ElevatedButton(
                  onPressed: _saveChanges, child: Text("Update Address!")),
            ],
          )
        ],
      ),
    );
  }

  _newCitySelected(int newCityId) {
    if (newCityId != oldInfo!.cityId) {
      setState(() {
        _selectedCityId = newCityId;
      });
    }
  }

  _newCountrySelected(int newCountryId) {
    if (newCountryId != oldInfo!.countryId) {
      setState(() {
        _selectedCountryId = newCountryId;
      });
    }
  }

  Future<void> _saveChanges() async {
    CreateAddressDTO dto = CreateAddressDTO(
      cityId: _selectedCityId,
      streetAndNo: streetAndNoController.text,
      latitude: double.tryParse(latitudeController.text) ?? oldInfo!.latitude,
      longitude:
          double.tryParse(longitudeController.text) ?? oldInfo!.longitude,
    );

    try {
      AddressDTO? response = await _api?.apiAddressUpdatePut(
          id: oldInfo!.id, createAddressDTO: dto);

      if (response == null)
        MyUiHelper.showSnackBar(context, "No server response!", Colors.grey);
      else
        MyUiHelper.showSnackBar(context, "Address updated!", Colors.green);
    } catch (e) {
      MyUiHelper.showSnackBar(context, "Something went wrong", Colors.red);
    }
  }

  void _goBack() {
    Navigator.of(context).pop(false);
  }
}
