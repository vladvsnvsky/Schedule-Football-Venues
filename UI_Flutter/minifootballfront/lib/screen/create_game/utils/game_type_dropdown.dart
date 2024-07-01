import 'package:flutter/material.dart';

class GameType {
  String name;
  int value;
  GameType({required this.name, required this.value});
}

List<GameType> gameTypes = [
  new GameType(name: '5 a side', value: 10),
  new GameType(name: '6 a side', value: 12),
  new GameType(name: '7 a side', value: 14),
  new GameType(name: '8 a side', value: 16),
  new GameType(name: '9 a side', value: 18),
  new GameType(name: '10 a side', value: 20),
  new GameType(name: '11 a side', value: 22)
];

class GameTypeDropdown extends StatefulWidget {
  final Function(GameType) onGameTypeSelected;
  const GameTypeDropdown({Key? key, required this.onGameTypeSelected})
      : super(key: key);
  @override
  _GameTypeDropdownState createState() => _GameTypeDropdownState();
}

class _GameTypeDropdownState extends State<GameTypeDropdown> {
  GameType? _selectedGameType;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: DropdownButtonFormField<GameType>(
          value: _selectedGameType,
          items: gameTypes.map((gameType) {
            return DropdownMenuItem<GameType>(
              value: gameType,
              child: Text(gameType.name),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              _selectedGameType = value;
            });
            widget.onGameTypeSelected(_selectedGameType!);
          },
          decoration: InputDecoration(
            labelText: 'Select Game Type',
            border: OutlineInputBorder(),
          ),
        ));
  }
}
