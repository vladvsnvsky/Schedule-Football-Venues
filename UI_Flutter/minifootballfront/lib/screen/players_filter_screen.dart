import 'package:flutter/material.dart';
import 'package:minifootballfront/screen/custom_field_widgets/select_city_dropdown.dart';
import 'package:minifootballfront/screen/custom_field_widgets/select_country_dropdown.dart';
import 'package:minifootballfront/screen/vaidator.dart';
import 'package:minifootballfront/service/tokenservice.dart';
import 'package:minifootballfront/uihelper.dart';
import 'package:minifootballfront/user_filter.dart';

import '../openapifiles/lib/api.dart';
import '../service/BearerAuthentication.dart';

class PlayersFilterScreen extends StatefulWidget {
  final Function(UserFilter?) onFilterPressed;

  const PlayersFilterScreen({super.key, required this.onFilterPressed});

  @override
  _PlayersFilterScreenState createState() => _PlayersFilterScreenState();
}

class _PlayersFilterScreenState extends State<PlayersFilterScreen> {
  bool _findPlayersByCityOption = false;
  bool _findPlayersByUsernameOption = false;
  bool _findPlayersByEmailOption = false;
  bool _findAdminsOption = false;
  bool _findBannedPlayersOption = false;

  UserApi? _api;
  BearerAuthentication? _auth;
  ApiClient? _apiClient;

  List<UserEntityDTO>? players;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();

  int? _selectedCountryId, _selectedCityId;

  MyUiHelper uiHelper = MyUiHelper();

  @override
  void initState() {
    super.initState();
    authorizeUser();
  }

  authorizeUser() async {
    var jwt = await TokenService().getToken();
    _auth = BearerAuthentication(jwt!);
    _apiClient = ApiClient(authentication: _auth);
    _api = UserApi(_apiClient);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users Filters"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Find users by location.",
                          style: TextStyle(fontSize: 17),
                        ),
                        Checkbox(
                          value: _findPlayersByCityOption,
                          onChanged: (value) {
                            setState(() {
                              _resetFilters();
                              _findPlayersByCityOption = value!;
                            });
                          },
                        ),
                      ],
                    ),
                    if (_findPlayersByCityOption)
                      SelectCountryDropdown(onCountrySelected: (valueId) {
                        setState(() {
                          _selectedCountryId = valueId;
                        });
                      }),
                    if (_findPlayersByCityOption && _selectedCountryId != null)
                      SelectCityDropdown(
                        onCitySelected: (valueId) {
                          _selectedCityId = valueId;
                        },
                        countryId: _selectedCountryId!,
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Find user by email.",
                          style: TextStyle(fontSize: 17),
                        ),
                        Checkbox(
                          value: _findPlayersByEmailOption,
                          onChanged: (value) {
                            setState(() {
                              _resetFilters();
                              _findPlayersByEmailOption = value!;
                            });
                          },
                        ),
                      ],
                    ),
                    if (_findPlayersByEmailOption)
                      Padding(
                        padding: const EdgeInsets.all(14),
                        child: TextField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Enter the email you are looking for.',
                          ),
                        ),
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Find user by username.",
                          style: TextStyle(fontSize: 17),
                        ),
                        Checkbox(
                          value: _findPlayersByUsernameOption,
                          onChanged: (value) {
                            setState(() {
                              _resetFilters();
                              _findPlayersByUsernameOption = value!;
                            });
                          },
                        ),
                      ],
                    ),
                    if (_findPlayersByUsernameOption)
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: TextField(
                          controller: _usernameController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText:
                                'Enter the username you are looking for.',
                          ),
                        ),
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Find admins.",
                          style: TextStyle(fontSize: 17),
                        ),
                        Checkbox(
                          value: _findAdminsOption,
                          onChanged: (value) {
                            setState(() {
                              _resetFilters();
                              _findAdminsOption = value!;
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Find banned users.",
                          style: TextStyle(fontSize: 17),
                        ),
                        Checkbox(
                          value: _findBannedPlayersOption,
                          onChanged: (value) {
                            setState(() {
                              _resetFilters();
                              _findBannedPlayersOption = value!;
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            await _applyFilter();
                          },
                          child: const Text("Apply filter"),
                        ),
                        const SizedBox(width: 20),
                        ElevatedButton(
                          onPressed: _isFilterActive()
                              ? () {
                                  setState(() {
                                    _resetFilters();
                                  });
                                }
                              : null,
                          child: const Text("Clear filter"),
                        ),
                      ],
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

  bool _isFilterActive() {
    return _findPlayersByCityOption ||
        _findPlayersByUsernameOption ||
        _findPlayersByEmailOption ||
        _findAdminsOption ||
        _findBannedPlayersOption;
  }

  void _resetFilters() async {
    _findPlayersByCityOption = false;
    _selectedCityId = null;
    _selectedCountryId = null;
    _findPlayersByUsernameOption = false;
    _findPlayersByEmailOption = false;
    _findAdminsOption = false;
    _findBannedPlayersOption = false;
  }

  Future<void> _fetchAllUsers() async {
    List<UserEntityDTO>? awaitedResult = await _api!.apiUserAllGet();
    setState(() {
      players = awaitedResult!.isEmpty ? null : awaitedResult;
    });
  }

  Future<void> _fetchPlayersByCity() async {
    try {
      if (_selectedCountryId == null) {
        throw Exception("No country and city selected!");
      }

      if (_selectedCityId == null) {
        throw Exception("No city selected!");
      }

      List<UserEntityDTO>? awaitedResult =
          await _api!.apiUserByCityIdGet(cityId: _selectedCityId!);

      setState(() {
        players = awaitedResult!.isEmpty ? null : awaitedResult;
      });
    } catch (e) {
      if (mounted) {
        MyUiHelper.showSnackBar(context, "An error occurred!", Colors.red);
      }
    }
  }

  Future<void> _fetchPlayersByEmail() async {
    try {
      if (!Validator.isEmailValid(_emailController.text)) {
        throw Exception("Enter a valid email address first!");
      }

      UserEntityDTO? result =
          await _api!.apiUserByEmailGet(email: _emailController.text);

      setState(() {
        players = [];
        if (result != null) players?.add(result);
      });
    } catch (e) {
      if (mounted) {
        MyUiHelper.showSnackBar(context, "An error occurred!", Colors.red);
      }
    }
  }

  Future<void> _fetchPlayersByUsername() async {
    try {
      if (_usernameController.text.isEmpty) {
        throw Exception("Enter a valid username first!");
      }

      UserEntityDTO? result =
          await _api!.apiUserByUsernameGet(username: _usernameController.text);

      setState(() {
        players = [];
        if (result != null) players?.add(result);
      });
    } catch (e) {
      if (mounted) {
        MyUiHelper.showSnackBar(context, "An error occurred!", Colors.red);
      }
    }
  }

  Future<void> _fetchAdmins() async {
    try {
      List<UserEntityDTO>? admins = await _api!.apiUserAdminsGet();

      setState(() {
        players = admins;
      });
    } catch (e) {
      if (mounted) {
        MyUiHelper.showSnackBar(context, "An error occurred!", Colors.red);
      }
    }
  }

  Future<void> _fetchBannedUsers() async {
    try {
      List<UserEntityDTO>? bannedUsers = await _api!.apiUserBannedUsersGet();

      setState(() {
        players = bannedUsers;
      });
    } catch (e) {
      if (mounted) {
        MyUiHelper.showSnackBar(context, "An error occurred!", Colors.red);
      }
    }
  }

  Future<void> _applyFilter() async {
    UserFilter userFilter = UserFilter(
      countryId: _selectedCountryId,
      cityId: _selectedCityId,
      isBanned: _findBannedPlayersOption,
      name:
          _usernameController.text.isNotEmpty ? _usernameController.text : null,
      email: _emailController.text.isNotEmpty ? _emailController.text : null,
      dayOfBirth: null,
      monthOfBirth: null,
      yearOfBirth: null,
      isAdmin: _findAdminsOption,
      // orderByAgeAsc:  ?? null,
      // orderByCreationDateAsc: userFilter.orderByCreationDateAsc ?? null
    );

    widget.onFilterPressed(userFilter);
    Navigator.pop(context);
  }
}
