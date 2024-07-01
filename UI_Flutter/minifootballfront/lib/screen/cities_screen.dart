import 'package:flutter/material.dart';
import 'package:minifootballfront/openapifiles/lib/api.dart';
import 'package:minifootballfront/screen/my_widgets/city_Card.dart';
import 'package:minifootballfront/service/BearerAuthentication.dart';
import 'package:minifootballfront/uihelper.dart';

import '../service/tokenservice.dart';
import 'custom_field_widgets/select_country_dropdown.dart';

class CitiesScreen extends StatefulWidget {
  @override
  _CitiesScreenState createState() => _CitiesScreenState();
}

class _CitiesScreenState extends State<CitiesScreen> {
  List<CityDTO>? _cities;
  TextEditingController _newCityController = TextEditingController();
  CityApi? _api;
  BearerAuthentication? _auth;
  ApiClient? _apiClient;

  bool _isLoading = false;
  bool _createCityOption = false;

  int? _selectedCountryId;

  @override
  void initState() {
    super.initState();
    _authorizeUser();
  }

  Future<void> _authorizeUser() async {
    var jwt = await TokenService().getToken();
    _auth = BearerAuthentication(jwt!);
    _apiClient = ApiClient(authentication: _auth);
    _api = CityApi(_apiClient);

    _fetchData();
  }

  MyUiHelper uiHelper = MyUiHelper();

  Future<void> _fetchData() async {
    if (_selectedCountryId == null) return;

    setState(() {
      _isLoading = true;
    });

    try {
      List<CityDTO>? response = await _api!.apiCityGet();
      if (response == null)
        throw Exception("Something went wrong loading the data!");

      response =
          response.where((r) => r.countryId == _selectedCountryId).toList();

      setState(() {
        _isLoading = false;
        _cities = response;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      MyUiHelper.showSnackBar(context, e.toString(), Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cities'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _createCityOption = !_createCityOption;
              });
            },
            icon: Icon(_createCityOption ? Icons.minimize : Icons.add),
          ),
        ],
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                SelectCountryDropdown(
                  onCountrySelected: (value) {
                    setState(() {
                      _selectedCountryId = value;
                      _fetchData();
                    });
                  },
                  value: _selectedCountryId,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(6),
                    child: _createCityOption
                        ? Column(
                            children: [
                              TextField(
                                controller: _newCityController,
                                decoration: InputDecoration(
                                  labelText: 'TYPE IN THE NAME',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: _createCityPressed,
                                child: Text("Create"),
                              ),
                            ],
                          )
                        : _selectedCountryId != null
                            ? _cities == null || _cities!.isEmpty
                                ? Center(
                                    child: Text(
                                      'No cities found. You can create one by tapping on +.',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  )
                                : ListView.builder(
                                    itemCount: _cities!.length,
                                    itemBuilder: (context, index) {
                                      return CityCard(
                                        city: _cities![index],
                                        apiSource: _api!,
                                      );
                                    },
                                  )
                            : Center(
                                child: Text(
                                  "Select a country first!",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),
                  ),
                ),
              ],
            ),
    );
  }

  void _createCityPressed() async {
    try {
      if (_newCityController.text.isEmpty)
        throw Exception("Enter a valid name.");

      CreateCityDTO city = CreateCityDTO(
          name: _newCityController.text, countryId: _selectedCountryId);

      CityDTO? resp = await _api!.apiCityCreatePost(createCityDTO: city);

      if (resp != null) {
        MyUiHelper.showSnackBar(context, "City created!", Colors.green);
        _fetchData(); // Refresh the list after creating a new city
      }
    } catch (e) {
      MyUiHelper.showSnackBar(context, e.toString(), Colors.red);
    }
  }
}
