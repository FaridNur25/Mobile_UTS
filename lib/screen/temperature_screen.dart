import 'package:flutter/material.dart';
import 'package:kalkulator/widgets/sidebar.dart';

import 'package:flutter/material.dart';

class TemperatureScreen extends StatefulWidget {
  @override
  _TemperatureScreenState createState() => _TemperatureScreenState();
}

class _TemperatureScreenState extends State<TemperatureScreen> {
  final TextEditingController _controller = TextEditingController();
  String _selectedUnit = 'Celsius';
  double? _convertedTemperatureC;
  double? _convertedTemperatureF;
  double? _convertedTemperatureK;

  void _convertTemperature() {
    double input = double.tryParse(_controller.text) ?? 0.0;
    setState(() {
      if (_selectedUnit == 'Celsius') {
        _convertedTemperatureF = input * 9 / 5 + 32;
        _convertedTemperatureK = input + 273.15;
        _convertedTemperatureC = input;
      } else if (_selectedUnit == 'Fahrenheit') {
        _convertedTemperatureC = (input - 32) * 5 / 9;
        _convertedTemperatureK = _convertedTemperatureC! + 273.15;
        _convertedTemperatureF = input;
      } else if (_selectedUnit == 'Kelvin') {
        _convertedTemperatureC = input - 273.15;
        _convertedTemperatureF = _convertedTemperatureC! * 9 / 5 + 32;
        _convertedTemperatureK = input;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Konversi Suhu'),
        backgroundColor: Colors.orange,
      ),
      drawer: const Sidebar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextField(
                      controller: _controller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Enter Temperature',
                        labelStyle: TextStyle(color: Colors.orange),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    DropdownButtonFormField<String>(
                      value: _selectedUnit,
                      items: ['Celsius', 'Fahrenheit', 'Kelvin']
                          .map((unit) => DropdownMenuItem(
                        value: unit,
                        child: Text(unit),
                      ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedUnit = value!;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Select Unit',
                        labelStyle: TextStyle(color: Colors.orange),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _convertTemperature,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                      ),
                      child: Text(
                        'Konversi',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            if (_convertedTemperatureC != null ||
                _convertedTemperatureF != null ||
                _convertedTemperatureK != null)
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hasil Konversi',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                      SizedBox(height: 10),
                      if (_convertedTemperatureC != null)
                        Text(
                          'Celsius: ${_convertedTemperatureC!.toStringAsFixed(2)} °C',
                          style: TextStyle(fontSize: 16),
                        ),
                      if (_convertedTemperatureF != null)
                        Text(
                          'Fahrenheit: ${_convertedTemperatureF!.toStringAsFixed(2)} °F',
                          style: TextStyle(fontSize: 16),
                        ),
                      if (_convertedTemperatureK != null)
                        Text(
                          'Kelvin: ${_convertedTemperatureK!.toStringAsFixed(2)} K',
                          style: TextStyle(fontSize: 16),
                        ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
