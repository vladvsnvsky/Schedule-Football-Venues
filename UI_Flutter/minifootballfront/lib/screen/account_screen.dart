import 'package:flutter/material.dart';
import 'package:minifootballfront/openapifiles/lib/api.dart';
import 'package:minifootballfront/screen/auth_screen.dart';
import 'package:minifootballfront/screen/edit_profile_screen.dart';
import 'package:minifootballfront/screen/my_widgets/my_custom_appbar.dart';
import 'package:minifootballfront/service/authservice.dart';
import 'package:minifootballfront/service/tokenservice.dart';
import 'package:minifootballfront/uihelper.dart';

import '../service/signalr_service.dart';
import '../service/userentityservice.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  UserEntityDTO? _currentUser;
  late UserService _userService;

  bool _isLoading = false;

  double? budget;

  late SignalRService _signalRService;

  @override
  void initState() {
    super.initState();
    _instantiateService().then((_) {
      _loadUserData();
    });
    _setHubConnection();
  }

  void _setHubConnection() {
    _signalRService = SignalRService();

    _signalRService.startConnection().then((_) {
      _signalRService.onPlayerUpdated((userDTO) {
        if (userDTO.id == _currentUser!.id!)
          setState(() {
            _currentUser = userDTO;
          });
      });
    });
  }

  @override
  void dispose() {
    _signalRService.stopConnection();
    super.dispose();
  }

  Future<void> _instantiateService() async {
    setState(() {
      _isLoading = true;
    });
    try {
      String? jwt = await TokenService().getToken();
      if (jwt == null) throw Exception('Error accessing the service.');

      _userService = UserService(jwt: jwt);
    } catch (e) {
      MyUiHelper.showSnackBar(context, e.toString(), Colors.red);
    }
  }

  Future<void> _loadUserData() async {
    setState(() {
      _isLoading = true;
    });
    UserEntityDTO? userFromDB = await _userService.getUserEntity();
    if (userFromDB == null) {
      AuthService().signOut();
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => AuthScreen()),
        (Route<dynamic> route) => false,
      );
    }

    int? budgetUnits;
    double? amountInDollars;
    if (userFromDB != null) {
      budgetUnits = userFromDB.budgetUnits ?? 0;
      amountInDollars = budgetUnits.toDouble() / 100;
    }

    setState(() {
      _currentUser = userFromDB;
      budget = amountInDollars;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _isLoading
          ? MyCustomAppBar(
              title: 'Account',
            )
          : MyCustomAppBar(
              title: 'Account',
              budget: budget,
            ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : buildContent(),
    );
  }

  Widget buildContent() {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
                radius: 50,
                backgroundImage:
                    AssetImage("lib/assets/images/user-image.png")),
            SizedBox(height: 20),
            Text(
              _currentUser!.username!,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              _currentUser!.email!,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => EditProfileScreen()),
                  (Route<dynamic> route) => false,
                );
              },
              child: Text('Edit Profile'),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  await AuthService().signOut();
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => AuthScreen()),
                    (Route<dynamic> route) => false,
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Authentication failed: ${e.toString()}')));
                }
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, foregroundColor: Colors.white),
              child: Text('Log Out'),
            ),
          ],
        ),
      ),
    );
  }
}
