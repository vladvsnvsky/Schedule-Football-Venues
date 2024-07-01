import 'package:flutter/material.dart';
import 'package:minifootballfront/screen/account_screen.dart';
import 'package:minifootballfront/screen/games_screen.dart';
import 'package:minifootballfront/screen/homescreen.dart';
import 'package:minifootballfront/screen/venues_screen.dart';

// Assuming you already have this part
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

// List of destinations
const List<Destination> destinations = <Destination>[
  Destination(
      label: 'Home',
      icon: Icon(Icons.home),
      selectedIcon: Icon(Icons.home),
      screen: HomeScreen()),
  Destination(
      label: 'Venues',
      icon: Icon(Icons.location_on),
      selectedIcon: Icon(Icons.location_on),
      screen: VenuesScreen()),
  Destination(
      label: 'Games',
      icon: Icon(Icons.search),
      selectedIcon: Icon(Icons.search),
      screen: GamesScreen()),
  Destination(
      label: 'Account',
      icon: Icon(Icons.account_circle),
      selectedIcon: Icon(Icons.account_circle),
      screen: AccountScreen()),
];

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: destinations[_selectedIndex].screen),
      bottomNavigationBar: BottomNavigationBar(
        items: destinations
            .map((destination) => BottomNavigationBarItem(
                  icon: destination.icon,
                  label: destination.label,
                  activeIcon: destination.selectedIcon,
                ))
            .toList(),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType
            .fixed, // Optional: if you have more than 3 items
      ),
    );
  }
}
