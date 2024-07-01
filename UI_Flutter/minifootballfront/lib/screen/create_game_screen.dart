import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:minifootballfront/openapifiles/lib/api.dart';
import 'package:minifootballfront/screen/create_game/game_settings_screen.dart';
import 'package:minifootballfront/screen/create_game/summary_screen.dart';
import 'package:minifootballfront/screen/create_game/when_screen.dart';
import 'package:minifootballfront/screen/create_game/where_screen.dart';

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

class CreateGameScreen extends StatefulWidget {
  final GameDetailsDTO? initialGame;

  const CreateGameScreen.empty({super.key}) : initialGame = null;

  const CreateGameScreen(this.initialGame, {super.key});

  @override
  _CreateGameState createState() => _CreateGameState();
}

class _CreateGameState extends State<CreateGameScreen>
    with SingleTickerProviderStateMixin {
  GameDetailsDTO? _currentGameState;
  late TabController _tabController;

  int _selectedTabIndex = 0;

  bool? _gameBuilt;

  bool _snackBarShown = false;

  @override
  void initState() {
    super.initState();
    _currentGameState = widget.initialGame ?? new GameDetailsDTO();
    _tabController = TabController(length: 3, vsync: this);
    _gameBuilt = false;
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    if (_snackBarShown) return; // Skip if snackbar already shown

    if (_currentGameState?.fieldId == null && _tabController.index == 1) {
      _tabController.index = 0;
      _showSnackBar('Complete location first!', Colors.red[600]!);
      return;
    }

    if ((_currentGameState?.day == null ||
            _currentGameState?.startHour == null) &&
        _tabController.index == 2) {
      _tabController.index = 1;
      _showSnackBar('Set the date and time!', Colors.red[600]!);
      return;
    }

    if (_tabController.indexIsChanging) {
      setState(() {
        _selectedTabIndex = _tabController.index;
      });
    }

    _snackBarShown = true;
    Future.delayed(Duration(milliseconds: 300), () {
      _snackBarShown = false;
    });
  }

  void _showSnackBar(String message, Color backgroundColor) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: backgroundColor,
    ));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Create game!'),
          bottom: TabBar(
            controller: _tabController,
            tabs: [
              Tab(text: "Where", icon: Icon(Icons.location_city)),
              Tab(text: "When", icon: Icon(Icons.watch_later_outlined)),
              Tab(text: "Payment", icon: Icon(Icons.settings))
            ],
          ),
        ),
        body: _gameBuilt == false
            ? _currentScreen()
            : GameSummaryScreen(
                gameDetails: _currentGameState!,
                cancelButtonClicked: () => {
                  setState(() {
                    _gameBuilt = false;
                  })
                },
              ),
      ),
    );
  }

  Widget _currentScreen() {
    if (_selectedTabIndex == 0) {
      return WhereScreen(
          initialGameState: _currentGameState!,
          updateGameState: (newGameState) {
            setState(() {
              _currentGameState = newGameState;
            });
          });
    } else if (_selectedTabIndex == 1) {
      return WhenScreen(
          initialGameState: _currentGameState!,
          updateGameState: (newGameState) {
            setState(() {
              _currentGameState = newGameState;
            });
          });
    } else {
      return GameSettingsScreen(
          initialGameState: _currentGameState!,
          updateGameState: (newGameState) {
            setState(() {
              _currentGameState = newGameState;
              _currentGameState!.isCancelled = false;
              _gameBuilt = true;
            });
          });
    }
  }
}
