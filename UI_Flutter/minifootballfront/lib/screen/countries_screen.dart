import 'package:flutter/material.dart';
import 'package:minifootballfront/openapifiles/lib/api.dart';

import '../service/BearerAuthentication.dart';
import '../service/tokenservice.dart';
import '../uihelper.dart';
import 'my_widgets/country_card.dart';

class CountriesScreen extends StatefulWidget {
  @override
  _CountriesScreenState createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  List<CountryDTO>? _countries;
  TextEditingController _newCountryController = TextEditingController();
  CountryApi? _api;
  BearerAuthentication? _auth;
  ApiClient? _apiClient;

  bool _isLoading = false;
  bool _createCountryOption = false;

  @override
  void initState() {
    super.initState();
    if (_api == null)
      _authorizeUser();
    else
      _fetchData();
  }

  Future<void> _authorizeUser() async {
    var jwt = await TokenService().getToken();
    _auth = BearerAuthentication(jwt!);
    _apiClient = ApiClient(authentication: _auth);
    _api = CountryApi(_apiClient);

    _fetchData();
  }

  MyUiHelper uiHelper = MyUiHelper();

  Future<void> _fetchData() async {
    setState(() {
      _isLoading = true;
    });
    if (_api != null)
      try {
        List<CountryDTO>? response = await _api!.apiCountryGet();
        if (response == null)
          throw Exception("Something went wrong loading the data!");

        setState(() {
          _isLoading = false;
          _countries = response;
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
        title: Text('Countries'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _createCountryOption = !_createCountryOption;
              });
            },
            icon: Icon(_createCountryOption ? Icons.minimize : Icons.add),
          ),
        ],
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: EdgeInsets.all(16),
              child: _createCountryOption == false
                  ? _countries == null || _countries!.isEmpty
                      ? Center(
                          child: Text(
                            'No countries found. You can create one by tapping on +.',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18),
                          ),
                        )
                      : ListView.builder(
                          itemCount: _countries!.length,
                          itemBuilder: (context, index) {
                            return CountryCard(
                              country: _countries![index],
                              apiSource: _api!,
                            );
                          },
                        )
                  : Column(
                      children: [
                        Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                TextField(
                                  controller: _newCountryController,
                                  decoration: InputDecoration(
                                    labelText: 'Type in the name',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                SizedBox(height: 16),
                                ElevatedButton(
                                  onPressed: _createCountryPressed,
                                  child: Text("Create"),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
    );
  }

  void _createCountryPressed() async {
    try {
      if (_newCountryController.text.isEmpty)
        throw Exception("Enter a valid name.");

      CreateCountryDTO country =
          CreateCountryDTO(name: _newCountryController.text);

      CountryDTO? resp =
          await _api!.apiCountryCreatePost(createCountryDTO: country);

      if (resp != null) {
        MyUiHelper.showSnackBar(context, "Country created!", Colors.green);
        _fetchData(); // Refresh the list after creating a new country
      }
    } catch (e) {
      MyUiHelper.showSnackBar(context, e.toString(), Colors.red);
    }
  }
}
