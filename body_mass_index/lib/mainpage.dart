import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TextEditingController _heightContoller = TextEditingController();
  TextEditingController _masstContoller = TextEditingController();
  double _result = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "BMI",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontStyle: FontStyle.italic,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              _result.toStringAsFixed(2),
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              controller: _heightContoller,
              decoration: InputDecoration(
                label: Text("height"),
                suffixText: "m",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              controller: _masstContoller,
              decoration: InputDecoration(
                label: Text("mass"),
                suffixText: "kg",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                onPressed: _calculate,
                child: const Text(
                  "calculate",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ))
          ],
        ),
      ),
    );
  }

  void _calculate() {
    String heightText = _heightContoller.text.trim();
    String massText = _masstContoller.text.trim();

    try {
      double height = double.parse(heightText);
      double mass = double.parse(massText);

      setState(() {
        _result = mass / (height * height);
      });
    } catch (e) {
      print("error ${e.toString()}");
    }
  }
}
