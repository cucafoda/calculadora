import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorPage(),
    );
  }
}

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String display = "0";
  double? num1;
  double? num2;
  String? operation;

  void buttonPressed(String value) {
    setState(() {
      if (value == "C") {
        display = "0";
        num1 = null;
        num2 = null;
        operation = null;
      } else if (value == "+" || value == "-" || value == "x" || value == "/") {
        num1 = double.tryParse(display);
        operation = value;
        display = "0";
      } else if (value == "=") {
        num2 = double.tryParse(display);
        if (num1 != null && num2 != null && operation != null) {
          switch (operation) {
            case "+":
              display = (num1! + num2!).toString();
              break;
            case "-":
              display = (num1! - num2!).toString();
              break;
            case "x":
              display = (num1! * num2!).toString();
              break;
            case "/":
              display = (num2! != 0) ? (num1! / num2!).toString() : "Erro";
              break;
          }
        }
        num1 = null;
        num2 = null;
        operation = null;
      } else {
        if (display == "0") {
          display = value;
        } else {
          display += value;
        }
      }
    });
  }

  Widget buildButton(String text) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => buttonPressed(text),
        child: Text(
          text,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Calculadora Talento Tech")),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(20),
              child: Text(
                display,
                style: const TextStyle(fontSize: 40),
              ),
            ),
          ),
          Row(
            children: [
              buildButton("7"),
              buildButton("8"),
              buildButton("9"),
              buildButton("/")
            ],
          ),
          Row(
            children: [
              buildButton("4"),
              buildButton("5"),
              buildButton("6"),
              buildButton("x")
            ],
          ),
          Row(
            children: [
              buildButton("1"),
              buildButton("2"),
              buildButton("3"),
              buildButton("-")
            ],
          ),
          Row(
            children: [
              buildButton("C"),
              buildButton("0"),
              buildButton("="),
              buildButton("+")
            ],
          ),
        ],
      ),
    );
  }
}