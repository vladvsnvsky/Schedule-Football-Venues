import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class PaymentWidget extends StatefulWidget {
  final Function(double?) onValueChanged;

  const PaymentWidget({Key? key, required this.onValueChanged})
      : super(key: key);

  @override
  _PaymentWidgetState createState() => _PaymentWidgetState();
}

class _PaymentWidgetState extends State<PaymentWidget> {
  late TextEditingController _priceController = new TextEditingController();
  String _selectedCurrency = 'EUR';

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                controller: _priceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Price per player (cash only)',
                    border: OutlineInputBorder()),
                onChanged: (value) {
                  widget.onValueChanged(double.parse(value));
                },
              ),
            ),
            SizedBox(width: 2),
            DropdownButton<String>(
              value: _selectedCurrency,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedCurrency = newValue!;
                });
              },
              items:
                  <String>['EUR'].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            )
          ],
        ));
  }
}
