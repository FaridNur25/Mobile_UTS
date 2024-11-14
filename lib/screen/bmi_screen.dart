import 'dart:math';
import 'package:flutter/material.dart';
import 'package:kalkulator/widgets/sidebar.dart';

class BMIScreen extends StatefulWidget {
  const BMIScreen({super.key});

  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  int _selectedGender = 0, _height = 170;
  double _weight = 65.0;
  double? _bmi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Kalkulator"),
      ),
      drawer: const Sidebar(),
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return Column(
      children: [
        _genderSelection(),
        _heightInput(),
        _weightAndInputRow(),
        _submitButton(),
        if (_bmi != null) _hasilBmi(),
        if (_bmi != null) _bmiInterpretation(), // Menampilkan interpretasi BMI
      ],
    );
  }

  Widget _genderSelection() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              IconButton(
                iconSize: 60,
                onPressed: () {
                  setState(() {
                    _selectedGender = 0;
                  });
                },
                icon: Icon(
                  Icons.male,
                  color: _selectedGender == 0 ? Colors.blue : Colors.grey[800],
                ),
              ),
              const Text(
                "Pria",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                ),
              ),
            ],
          ),
          Column(
            children: [
              IconButton(
                iconSize: 60,
                onPressed: () {
                  setState(() {
                    _selectedGender = 1;
                  });
                },
                icon: Icon(
                  Icons.female,
                  color: _selectedGender == 1 ? Colors.pink : Colors.grey[800],
                ),
              ),
              const Text(
                "Wanita",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _heightInput() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [
          const Text(
            "Tinggi",
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          Slider(
            min: 0,
            max: 300,
            divisions: 300,
            value: _height.toDouble(),
            onChanged: (value) {
              setState(() {
                _height = value.toInt();
              });
            },
          ),
          Text(
            "$_height cm",
            style: const TextStyle(
              color: Colors.black,
              fontSize: 25,
            ),
          ),
        ],
      ),
    );
  }

  Widget _weightAndInputRow() {
    return Row(
      children: [
        Expanded(child: _weightInput()),
      ],
    );
  }

  Widget _weightInput() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [
          const Text(
            "Berat",
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () {
                  setState(() {
                    if (_weight > 50.0) {
                      _weight -= 0.1;
                    }
                  });
                },
              ),
              Text(
                '${_weight.toStringAsFixed(1)} kg', // Display with one decimal
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    if (_weight < 300.0) {
                      _weight += 0.1;
                    }
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _submitButton() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            _bmi = _weight / pow(_height / 100, 2); // Hitung BMI
          });
        },
        child: const Text(
          "Submit",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _hasilBmi() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        "BMI : ${_bmi?.toStringAsFixed(2)}",
        style: const TextStyle(
          color: Colors.black,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _bmiInterpretation() {
    String interpretation = '';
    Color bgColor = Colors.grey;

    if (_bmi != null) {
      if (_bmi! < 18.5) {
        interpretation = "Berat badan kurang, perbanyak makan!!";
        bgColor = Colors.lightGreen;
      } else if (_bmi! >= 18.5 && _bmi! <= 22.9) {
        interpretation = "Berat badan normal, Pertahankan!!";
        bgColor = Colors.green;
      } else if (_bmi! >= 23 && _bmi! <= 29.9) {
        interpretation = "Berat badan berlebih, kurangi makan!!";
        bgColor = Colors.orange;
      } else if (_bmi! >= 30) {
        interpretation = "Anda mengalami obesitas, Atur Pola Hidup Sehat!!";
        bgColor = Colors.red;
      }
    }

    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        interpretation,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
