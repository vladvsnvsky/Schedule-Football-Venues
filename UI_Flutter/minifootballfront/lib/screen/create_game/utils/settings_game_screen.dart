import 'package:flutter/material.dart';

class SettingsGameScreen extends StatefulWidget {
  const SettingsGameScreen({Key? key}) : super(key: key);
  @override
  _SettingsGameScreenState createState() => _SettingsGameScreenState();
}

class _SettingsGameScreenState extends State<SettingsGameScreen> {
  bool _playerCanJoin = true;

  TextEditingController _nrOfPlayersRequiredController =
      TextEditingController();

  @override
  void dispose() {
    _nrOfPlayersRequiredController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Game Settings"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SwitchListTile(
              title: Text("Players can join"),
              value: _playerCanJoin,
              onChanged: (bool value) {
                setState(() {
                  _playerCanJoin = value;
                });
              },
            ),
            TextField(
              controller: _nrOfPlayersRequiredController,
              decoration: InputDecoration(
                labelText: 'Number of Players Required',
                hintText: 'Enter the number of players required for the game',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () =>
                  Navigator.pushNamed(context, '/payment_game_screen'),
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
