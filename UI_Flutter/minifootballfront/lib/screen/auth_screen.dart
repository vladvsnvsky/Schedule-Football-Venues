import 'package:flutter/material.dart';
import 'package:minifootballfront/screen/signinscreen.dart';
import 'package:minifootballfront/screen/signupscreen.dart';

class Destination {
  const Destination({
    required this.label,
    required this.icon,
    required this.selectedIcon,
    required this.screen,
  });

  final String label;
  final Widget icon;
  final Widget selectedIcon;
  final Widget screen;
}

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    destinations = <Destination>[
      Destination(
          label: 'Sign In',
          icon: Icon(Icons.login),
          selectedIcon: Icon(Icons.login),
          screen: SignInScreen()),
      Destination(
        label: 'Sign Up',
        icon: Icon(Icons.add_circle_outline_outlined),
        selectedIcon: Icon(Icons.add_circle_outline_outlined),
        screen: SignUpScreen(
          successCallback: () {
            _returnToSignIn();
          },
        ),
      )
    ];
  }

  // List of destinations
  List<Destination>? destinations;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Image.asset(
                    'lib/assets/images/goaloclock_logo_white.png',
                    width: 250,
                    height: 100,
                  ),
                  Text(
                    'Welcome',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: destinations![_selectedIndex].screen,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: destinations!
            .map((destination) => BottomNavigationBarItem(
                  icon: destination.icon,
                  label: destination.label,
                  activeIcon: destination.selectedIcon,
                ))
            .toList(),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
      ),
    );
  }

  void _returnToSignIn() {
    setState(() {
      _selectedIndex = 0;
    });
  }
}
