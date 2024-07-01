import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:minifootballfront/openapifiles/lib/api.dart';
import 'package:minifootballfront/screen/update_venue_screen.dart';
import 'package:minifootballfront/service/BearerAuthentication.dart';
import 'package:minifootballfront/service/tokenservice.dart';
import 'package:minifootballfront/service/userentityservice.dart';
import 'package:minifootballfront/service/venue_service.dart';
import 'package:minifootballfront/uihelper.dart';
import 'custom_field_widgets/select_city_dropdown.dart';
import 'custom_field_widgets/select_country_dropdown.dart';
import 'my_widgets/venue_card.dart';

class VenuesScreen extends StatefulWidget {
  const VenuesScreen({Key? key}) : super(key: key);

  @override
  _VenuesScreenState createState() => _VenuesScreenState();
}

class _VenuesScreenState extends State<VenuesScreen> {
  final int _pageSize = 5;
  int _currentPage = 1;
  int totalPages = 1;

  VenueService? _venueService;
  FieldApi? _api;
  bool isLoading = false;
  bool _isAdmin = false;
  bool? _createVenueOption;

  List<VenueDetailsDTO>? _venues;
  int? _selectedCountryId;
  int? _selectedCityId;

  String _sortType = 'name';

  final TextEditingController _venueNameController = TextEditingController();
  final TextEditingController _venueDescriptionController =
      TextEditingController();
  final TextEditingController _venueCapacityController =
      TextEditingController();
  final TextEditingController _venueWidthController = TextEditingController();
  final TextEditingController _venueLengthController = TextEditingController();
  final TextEditingController _venuePricePerHourController =
      TextEditingController();
  final TextEditingController _venuePhoneController = TextEditingController();
  final TextEditingController _venueEmailController = TextEditingController();
  final TextEditingController _venueStreetAndNoController =
      TextEditingController();
  final TextEditingController _venueGoogleMapsLatitudeController =
      TextEditingController();
  final TextEditingController _venueGoogleMapsLongitudeController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    _venueService = VenueService();
    _initialize();
  }

  Future<void> _initialize() async {
    await authorizeClient();
    await _fetchClientData();
    _fetchData();
  }

  Future<void> authorizeClient() async {
    final jwt = await TokenService().getToken();
    final auth = BearerAuthentication(jwt!);
    final apiClient = ApiClient(authentication: auth);
    _api = FieldApi(apiClient);
  }

  Future<void> _fetchClientData() async {
    setState(() => isLoading = true);

    try {
      final token = await TokenService().getToken();
      final roles = TokenService().getRoles(token!);
      final isAdmin = roles?.contains("ADMIN") ?? false;

      setState(() {
        isLoading = false;
        _isAdmin = isAdmin;
        _createVenueOption = isAdmin ? false : null;
      });
    } catch (e) {
      MyUiHelper.showSnackBar(context, e.toString(), Colors.red);
      setState(() => isLoading = false);
    }
  }

  Future<void> _fetchData() async {
    if (_selectedCityId == null) return;

    setState(() => isLoading = true);

    try {
      final response = await _venueService!.getVenuesByCityIdPaginatedSorted(
        _selectedCityId!,
        _currentPage,
        _pageSize,
        _sortType,
      );

      if (response == null) throw Exception("No venues found!");

      setState(() {
        _venues = response.items;
        _currentPage = response.currentPage!;
        totalPages = response.totalPages!;
        isLoading = false;
      });
    } catch (e) {
      MyUiHelper.showSnackBar(context, e.toString(), Colors.red);
      setState(() => isLoading = false);
    }
  }

  void _nextPage() {
    if (_currentPage < totalPages) {
      setState(() => _currentPage++);
      _fetchData();
    }
  }

  void _previousPage() {
    if (_currentPage > 1) {
      setState(() => _currentPage--);
      _fetchData();
    }
  }

  void _onCountrySelected(int countryId) {
    setState(() {
      _selectedCountryId = countryId;
      _selectedCityId = null; // Reset city selection
    });
  }

  void _onCitySelected(int cityId) {
    if (_createVenueOption == null || _createVenueOption == false)
      setState(() {
        _selectedCityId = cityId;
        _currentPage = 1; // Reset to first page
        _fetchData();
      });
    else {
      setState(() {
        _selectedCityId = cityId;
      });
    }
  }

  void _changeSort(String type) {
    setState(() {
      _sortType = type;
      isLoading = true;
    });
    _fetchData();
  }

  void _toggleCreateVenueOption() {
    setState(() {
      _createVenueOption = !_createVenueOption!;
    });
  }

  Future<void> createVenue() async {
    try {
      bool clientConfirms = await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Create venue?'),
              content: Text('You are about to create a new venue.'),
              actions: [
                TextButton(
                    child: Text('Cancel'),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    }),
                TextButton(
                    child: Text('Confirm'),
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    }),
              ],
            );
          });

      if (clientConfirms) {
        final fieldDTO = CreateFieldDTO(
          name: _venueNameController.text.isNotEmpty
              ? _venueNameController.text
              : null,
          description: _venueDescriptionController.text.isNotEmpty
              ? _venueDescriptionController.text
              : null,
          capacity: _venueCapacityController.text.isNotEmpty
              ? int.tryParse(_venueCapacityController.text)
              : null,
          width: _venueWidthController.text.isNotEmpty
              ? double.tryParse(_venueWidthController.text) ?? 0
              : 0,
          length: _venueLengthController.text.isNotEmpty
              ? double.tryParse(_venueLengthController.text) ?? 0
              : 0,
          pricePerHourUnits: _venuePricePerHourController.text.isNotEmpty
              ? (double.tryParse(_venuePricePerHourController.text)! * 100)
                  .toInt()
              : null,
          phone: _venuePhoneController.text,
          email: _venueEmailController.text.isNotEmpty
              ? _venueEmailController.text
              : null,
          cityId: _selectedCityId!,
          streetAndNo: _venueStreetAndNoController.text,
          googleMapsLatitude: _venueGoogleMapsLatitudeController.text.isNotEmpty
              ? double.parse(_venueGoogleMapsLatitudeController.text)
              : null,
          googleMapsLongitude:
              _venueGoogleMapsLongitudeController.text.isNotEmpty
                  ? double.parse(_venueGoogleMapsLongitudeController.text)
                  : null,
        );

        final response = await _api!
            .apiFieldCreatePostWithHttpInfo(createFieldDTO: fieldDTO);
        if (response.statusCode != 200)
          throw Exception("Something went wrong!");

        MyUiHelper.showSnackBar(
            context, "Venue created successfully!", Colors.green[600]);
        setState(() {
          _createVenueOption = false;
        });
      }
    } catch (e) {
      MyUiHelper.showSnackBar(
          context, "Something went wrong. Try again!", Colors.red[600]);
    }
  }

  Widget textField(TextEditingController controller, String hintText,
      {bool isNumber = false, bool isEmail = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: hintText,
        ),
        keyboardType: isNumber
            ? TextInputType.number
            : isEmail
                ? TextInputType.emailAddress
                : TextInputType.text,
      ),
    );
  }

  Widget createVenueWidget() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SelectCountryDropdown(onCountrySelected: _onCountrySelected),
          if (_selectedCountryId != null)
            SelectCityDropdown(
              countryId: _selectedCountryId!,
              onCitySelected: _onCitySelected,
            ),
          if (_selectedCityId != null) ...[
            textField(_venueNameController, "Venue Name"),
            textField(_venueDescriptionController, "Description"),
            textField(_venueCapacityController, "Capacity", isNumber: true),
            textField(_venueWidthController, "Width", isNumber: true),
            textField(_venueLengthController, "Length", isNumber: true),
            textField(_venuePricePerHourController, "Price per Hour",
                isNumber: true),
            textField(_venuePhoneController, "Phone"),
            textField(_venueEmailController, "Email", isEmail: true),
            textField(_venueStreetAndNoController, "Street and No"),
            textField(
                _venueGoogleMapsLatitudeController, "Google Maps Latitude"),
            textField(
                _venueGoogleMapsLongitudeController, "Google Maps Longitude"),
          ],
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: createVenue,
            child: Text('Create Venue'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Venues"),
        actions: [
          PopupMenuButton<String>(
            onSelected: _changeSort,
            itemBuilder: (BuildContext context) {
              return [
                CheckedPopupMenuItem(
                  checked: _sortType == 'name',
                  value: 'name',
                  child: Text('Sort by Name'),
                )
              ];
            },
            icon: Icon(Icons.sort),
          ),
          if (_createVenueOption != null)
            ElevatedButton(
              onPressed: _toggleCreateVenueOption,
              child: _createVenueOption!
                  ? Icon(Icons.arrow_upward)
                  : Icon(Icons.add),
            ),
        ],
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                if (_createVenueOption != null && _createVenueOption == true)
                  Expanded(child: createVenueWidget()),
                if (_createVenueOption == null || _createVenueOption == false)
                  SelectCountryDropdown(onCountrySelected: _onCountrySelected),
                if (_createVenueOption == null || _createVenueOption == false)
                  if (_selectedCountryId != null)
                    SelectCityDropdown(
                      countryId: _selectedCountryId!,
                      onCitySelected: _onCitySelected,
                    ),
                if (_createVenueOption == null || _createVenueOption == false)
                  Expanded(
                    child: _venues == null
                        ? Center(
                            child: Text(
                                'Select a country and city to view venues'))
                        : ListView.builder(
                            itemCount: _venues?.length ?? 0,
                            itemBuilder: (context, index) {
                              return VenueCard(
                                venueInfo: _venues![index],
                                actions: [
                                  if (_isAdmin)
                                    ElevatedButton(
                                        style: adminButtonStyle(),
                                        onPressed: () async {
                                          bool _clientConfirms =
                                              await showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      title: Text(
                                                          'Update this venue?'),
                                                      content: Text(
                                                          'Click on Proceed to go further'),
                                                      actions: [
                                                        TextButton(
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop(false);
                                                            },
                                                            child:
                                                                Text('Cancel')),
                                                        TextButton(
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop(true);
                                                            },
                                                            child: Text(
                                                                'Proceed')),
                                                      ],
                                                    );
                                                  });
                                          if (_clientConfirms)
                                            _updateVenue(_venues![index]);
                                        },
                                        child: Text('Update Info')),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  if (_isAdmin)
                                    ElevatedButton(
                                        style: adminButtonStyle(),
                                        onPressed: () async {
                                          bool _clientConfirms =
                                              await showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      title: Text(_venues![
                                                                  index]
                                                              .isActive!
                                                          ? 'Deactivate this venue?'
                                                          : 'Activate this venue?'),
                                                      content: Text(_venues![
                                                                  index]
                                                              .isActive!
                                                          ? 'Click on Proceed to deactivate the venue. People won\'t be able to organize games at this field anymore. Games already scheduled won\'t be canceled.'
                                                          : 'Click on Proceed to activate the venue. People will be able to organize games at this field.'),
                                                      actions: [
                                                        TextButton(
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop(false);
                                                            },
                                                            child:
                                                                Text('Cancel')),
                                                        TextButton(
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop(true);
                                                            },
                                                            child: Text(
                                                                'Proceed')),
                                                      ],
                                                    );
                                                  });
                                          if (_clientConfirms)
                                            _activateDeactivateVenue(
                                                _venues![index]);
                                        },
                                        child: Text(_venues![index].isActive!
                                            ? 'Deactivate Venue'
                                            : 'Activate Venue'))
                                ],
                              );
                            },
                          ),
                  ),
                _buildPaginationControls(),
              ],
            ),
    );
  }

  ButtonStyle adminButtonStyle() {
    return ButtonStyle(
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))),
        elevation: WidgetStateProperty.all<double>(10.0),
        backgroundColor: WidgetStateProperty.all<Color>(Colors.black),
        foregroundColor: WidgetStateProperty.all<Color>(Colors.white));
  }

  Widget _buildPaginationControls() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
              onPressed: _currentPage > 1 ? _previousPage : null,
              child: Text("Previous")),
          Text("Page $_currentPage of $totalPages"),
          ElevatedButton(
              onPressed: _currentPage < totalPages ? _nextPage : null,
              child: Text("Next")),
        ],
      ),
    );
  }

  _updateVenue(VenueDetailsDTO venueDetailsDTO) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => UpdateVenueScreen(
                  oldInfo: venueDetailsDTO,
                )));
  }

  _activateDeactivateVenue(VenueDetailsDTO venueDetailsDTO) async {
    try {
      int? venueId = venueDetailsDTO.venueId;
      if (venueId == null) throw Exception('Venue cannot be modified.');

      if (venueDetailsDTO.isActive == true)
        await _api!.apiFieldSetInactivePut(fieldId: venueId);
      else
        await _api!.apiFieldSetActivePut(fieldId: venueId);

      setState(() {
        venueDetailsDTO.isActive = !venueDetailsDTO.isActive!;
      });

      MyUiHelper.showSnackBar(context, 'Action completed', Colors.green);
    } catch (e) {
      MyUiHelper.showSnackBar(context, 'Error occured', Colors.red);
    }
  }
}
