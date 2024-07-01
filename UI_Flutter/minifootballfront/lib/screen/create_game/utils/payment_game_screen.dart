import 'package:flutter/material.dart';

class PaymentGameScreen extends StatefulWidget {
  const PaymentGameScreen({Key? key}) : super(key: key);
  @override
  _PaymentGameScreenState createState() => _PaymentGameScreenState();
}

class _PaymentGameScreenState extends State<PaymentGameScreen> {
  TextEditingController _pricePerPlayerController = TextEditingController();

  @override
  void dispose() {
    _pricePerPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Game Payment"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: _pricePerPlayerController,
              decoration: InputDecoration(
                labelText: 'Price Per Player (EUR)',
                hintText: 'Enter the price per player',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Logic to create the game
                print("Game created!");
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              child: Text('Create Game'),
            ),
          ],
        ),
      ),
    );
  }
}
