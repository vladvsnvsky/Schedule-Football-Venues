import 'package:flutter/material.dart';
import 'package:minifootballfront/openapifiles/lib/api.dart';
import 'package:minifootballfront/screen/cities_screen.dart';
import 'package:minifootballfront/screen/countries_screen.dart';
import 'package:minifootballfront/screen/my_scheduled_games.dart';
import 'package:minifootballfront/screen/my_widgets/my_custom_appbar.dart';
import 'package:minifootballfront/screen/users_screen.dart';
import 'package:minifootballfront/service/tokenservice.dart';
import 'package:minifootballfront/service/userentityservice.dart';
import 'package:minifootballfront/uihelper.dart';
import 'create_game_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String username = "Unknown User";
  String email = "No Email";
  bool isLoading = true;

  double? budget;

  bool _userIsAdmin = false;

  @override
  void initState() {
    super.initState();
    _loadDataRequired();
  }

  Future<void> _loadDataRequired() async {
    setState(() {
      isLoading = true;
    });
    try {
      TokenService ts = TokenService();
      String? token = await ts.getToken();
      // Extract user details from the decoded token
      String usernameFromToken = ts.getUsername(token!) ?? "Unknown User";
      String emailFromToken = ts.getEmail(token) ?? "No Email";
      var roles = TokenService().getRoles(token);
      bool userIsAdmin = false;
      if (roles != null)
        for (var r in roles!) {
          if (r == "ADMIN") {
            userIsAdmin = true;
            break;
          }
        }

      UserEntityDTO? user = await UserService(jwt: token).getUserEntity();
      int? budgetUnits;
      if (user != null) {
        budgetUnits = user.budgetUnits;
      }

      double amountInDollars = budgetUnits!.toDouble() / 100;

      setState(() {
        username = usernameFromToken;
        email = emailFromToken;
        isLoading = false;
        budget = amountInDollars;
        _userIsAdmin = userIsAdmin;
      });
    } catch (e) {
      MyUiHelper.showSnackBar(context, e.toString(), Colors.red);
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isLoading
          ? MyCustomAppBar(
              title: 'Home',
            )
          : MyCustomAppBar(
              title: 'Home',
              budget: budget,
            ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : buildContent(),
    );
  }

  Widget buildContent() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'lib/assets/images/goaloclock_logo_white.png',
                width: 250,
                height: 250,
              ),
              SizedBox(height: 20),
              Text(
                "Welcome, $username",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "Email: $email",
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: _handleCreateGamePressed,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  textStyle: TextStyle(fontSize: 18),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.sports_soccer),
                    SizedBox(width: 8),
                    Text('Create Game'),
                  ],
                ),
              ),
              SizedBox(height: 12),
              ElevatedButton(
                onPressed: _handleMyScheduledGamesPressed,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  textStyle: TextStyle(fontSize: 18),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.calendar_month),
                    SizedBox(width: 8),
                    Text('My Scheduled Games'),
                  ],
                ),
              ),
              SizedBox(height: 12),
              if (_userIsAdmin)
                ElevatedButton(
                  onPressed: _openEditUsersScreen,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.supervised_user_circle_outlined),
                      SizedBox(width: 8),
                      Text('Edit Users'),
                    ],
                  ),
                ),
              SizedBox(height: 12),
              if (_userIsAdmin)
                ElevatedButton(
                  onPressed: _openEditCountriesScreen,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.flag),
                      SizedBox(width: 8),
                      Text('Edit Countries'),
                    ],
                  ),
                ),
              SizedBox(height: 12),
              if (_userIsAdmin)
                ElevatedButton(
                  onPressed: _openEditCitiesScreen,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.location_city),
                      SizedBox(width: 8),
                      Text('Edit Cities'),
                    ],
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _handleCreateGamePressed() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CreateGameScreen.empty()),
    );
  }

  Future<void> _handleMyScheduledGamesPressed() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyScheduledGamesScreen()),
    );
  }

  Future<void> _openEditUsersScreen() async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => UsersScreen.empty()));
  }

  Future<void> _openEditCountriesScreen() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CountriesScreen()),
    );
  }

  Future<void> _openEditCitiesScreen() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CitiesScreen()),
    );
  }
}
