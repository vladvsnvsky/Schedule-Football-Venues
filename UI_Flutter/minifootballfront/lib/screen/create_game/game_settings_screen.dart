import 'package:flutter/material.dart';
import 'package:minifootballfront/openapifiles/lib/api.dart';
import 'package:minifootballfront/screen/create_game/utils/game_type_dropdown.dart';
import 'package:minifootballfront/service/venue_service.dart';
import 'package:minifootballfront/uihelper.dart';

class GameSettingsScreen extends StatefulWidget {
  final GameDetailsDTO initialGameState;
  final Function(GameDetailsDTO) updateGameState;

  const GameSettingsScreen({
    Key? key,
    required this.initialGameState,
    required this.updateGameState,
  }) : super(key: key);

  @override
  _GameSettingsScreenState createState() => _GameSettingsScreenState();
}

class _GameSettingsScreenState extends State<GameSettingsScreen> {
  int? _pricePerPlayerUnits;
  int? _nrOfPlayersRequired;

  late GameDetailsDTO _currentGameState;

  final TextEditingController nrPlayersReqController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  FieldDTO? _selectedVenue;

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _currentGameState = widget.initialGameState;
    _fetchFieldData();
  }

  @override
  Widget build(BuildContext context) {
    return getGameSettingsWidget();
  }

  Future<void> _fetchFieldData() async {
    setState() {
      _isLoading = true;
    }

    try {
      FieldDTO venue =
          await VenueService().getVenueById(_currentGameState.fieldId!);
      if (venue != null) {
        _selectedVenue = venue;
      }
    } catch (e) {
      MyUiHelper.showSnackBar(context, e.toString(), Colors.red);
    }
  }

  Widget getGameSettingsWidget() {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (_currentGameState.day != null &&
                _currentGameState.startHour != null)
              GameTypeDropdown(
                onGameTypeSelected: (GameType gameType) {
                  setState(() {
                    _nrOfPlayersRequired = gameType.value;
                    _pricePerPlayerUnits =
                        ((_selectedVenue!.pricePerHourUnits! /
                                _nrOfPlayersRequired!))
                            .toInt();
                  });
                },
              ),
            if (_nrOfPlayersRequired != null)
              Row(
                children: [
                  Expanded(
                    child: Text(
                        'The price per player will be \$${(_pricePerPlayerUnits!.toDouble() / 100).toStringAsFixed(2)}'),
                  ),
                ],
              ),
            const SizedBox(height: 20),
            if (_pricePerPlayerUnits == null || _nrOfPlayersRequired == null)
              OutlinedButton(onPressed: null, child: const Text("Proceed"))
            else
              ElevatedButton(
                onPressed: _handleNextClicked,
                child: const Text("Proceed"),
              ),
          ],
        ),
      ),
    );
  }

  void _updateGameState() {
    try {
      _currentGameState.pricePerPlayerUnits = _pricePerPlayerUnits;
      _currentGameState.nrOfPlayersRequired = _nrOfPlayersRequired;
    } catch (e) {
      print(e.toString());
    }
  }

  void _handleNextClicked() {
    try {
      _updateGameState();
      widget.updateGameState(_currentGameState);
    } catch (e) {
      print(e.toString());
    }
  }

  bool isValidated() {
    return _pricePerPlayerUnits != null && _nrOfPlayersRequired != null;
  }
}
