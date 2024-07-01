import 'package:flutter/material.dart';
import 'package:minifootballfront/openapifiles/lib/api.dart';
import 'package:minifootballfront/screen/edit_address_screen.dart';
import 'package:minifootballfront/uihelper.dart';

import '../service/BearerAuthentication.dart';
import '../service/tokenservice.dart';

class UpdateVenueScreen extends StatefulWidget {
  final VenueDetailsDTO? oldInfo;

  const UpdateVenueScreen({super.key, this.oldInfo});
  @override
  _UpdateVenueScreenState createState() => _UpdateVenueScreenState();
}

class _UpdateVenueScreenState extends State<UpdateVenueScreen> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController descriptionController;

  late TextEditingController widthController;
  late TextEditingController lengthController;
  late TextEditingController capacityController;
  late TextEditingController pricePerHourUnitsController;
  bool? isActive;

  FieldApi? _api;
  BearerAuthentication? _auth;
  ApiClient? _apiClient;

  Future<void> _authorizeUser() async {
    var jwt = await TokenService().getToken();
    _auth = BearerAuthentication(jwt!);
    _apiClient = ApiClient(authentication: _auth);
    _api = FieldApi(_apiClient);
  }

  @override
  void initState() {
    super.initState();
    _authorizeUser();
    nameController = TextEditingController(text: widget.oldInfo?.name ?? '');
    emailController = TextEditingController(text: widget.oldInfo?.email ?? '');
    phoneController = TextEditingController(text: widget.oldInfo?.phone ?? '');
    descriptionController =
        TextEditingController(text: widget.oldInfo?.description ?? '');

    widthController =
        TextEditingController(text: widget.oldInfo?.width?.toString() ?? '');
    lengthController =
        TextEditingController(text: widget.oldInfo?.length?.toString() ?? '');
    capacityController =
        TextEditingController(text: widget.oldInfo?.capacity?.toString() ?? '');
    pricePerHourUnitsController = TextEditingController(
        text: ((widget.oldInfo?.pricePerHourUnits!.toDouble() ?? 0.0) / 100)
            .toStringAsFixed(2));
    isActive = widget.oldInfo?.isActive ?? false;
  }

  Future<void> saveVenueDetails() async {
    try {
      VenueDetailsDTO updatedVenue = VenueDetailsDTO(
        venueId: widget.oldInfo!.venueId,
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        description: descriptionController.text,
        streetAndNo: widget.oldInfo!.streetAndNo,
        cityId: widget.oldInfo!.cityId,
        cityName: widget.oldInfo!.cityName,
        countryId: widget.oldInfo!.countryId,
        countryName: widget.oldInfo!.countryName,
        width: int.tryParse(widthController.text),
        length: int.tryParse(lengthController.text),
        capacity: int.tryParse(capacityController.text),
        latitude: widget.oldInfo!.latitude,
        longitude: widget.oldInfo!.longitude,
        pricePerHourUnits:
            ((double.tryParse(pricePerHourUnitsController.text) ?? 0.0) * 100)
                .toInt(),
        isActive: isActive,
      );

      FieldDTO? result = await _api?.apiFieldUpdateByIdPut(
          id: widget.oldInfo!.venueId, venueDetailsDTO: updatedVenue);

      if (result != null)
        MyUiHelper.showSnackBar(context, 'Venue Updated', Colors.green);
      else
        MyUiHelper.showSnackBar(context, 'Something went wrong!', Colors.red);
    } catch (e) {
      print(e.toString());
      MyUiHelper.showSnackBar(context, e.toString(), Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Venue Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(labelText: 'Phone'),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            TextField(
              controller: widthController,
              decoration: InputDecoration(labelText: 'Width'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: lengthController,
              decoration: InputDecoration(labelText: 'Length'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: capacityController,
              decoration: InputDecoration(labelText: 'Capacity'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: pricePerHourUnitsController,
              decoration: InputDecoration(labelText: 'Price Per Hour \$'),
              keyboardType: TextInputType.number,
            ),
            SwitchListTile(
              title: Text('Is Active'),
              value: isActive ?? false,
              onChanged: (value) {
                setState(() {
                  isActive = value;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: saveVenueDetails,
              child: Text('Save'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _editVenueAddressScreen,
              child: Text('Edit address'),
            ),
          ],
        ),
      ),
    );
  }

  void _editVenueAddressScreen() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => EditAddressScreen.forVenue(
                  venueId: widget.oldInfo!.venueId,
                )));
  }
}
