import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const CalculatorHomePage(title: 'Calculator'),
    );
  }
}

class CalculatorHomePage extends StatefulWidget {
  const CalculatorHomePage({super.key, required this.title});

  final String title;

  @override
  State<CalculatorHomePage> createState() => _CalculatorHomePageState();
}

class _CalculatorHomePageState extends State<CalculatorHomePage> {
  String _output = "0";
  String _input = "";
  List<String> _history = [];

  void _onButtonPressed(String value) {
    setState(() {
      if (value == "C") {
        _output = "0";
        _input = "";
      } else if (value == "X") {
        // Backspace functionality
        if (_input.isNotEmpty) {
          _input = _input.substring(0, _input.length - 1);
          _output = _input.isEmpty ? "0" : _input;
        }
      } else if (value == "=") {
        try {
          final result = _calculateResult(_input);
          _output = result.toString();
          _history.add("$_input = $_output"); // Add to history
        } catch (e) {
          _output = e.toString();
        }
      } else if (value == "History") {
        _showHistoryDialog(); // Show history dialog
      } else {
        _input += value;
        _output = _input; // Show current input for user feedback
      }
    });
  }

  double _calculateResult(String expression) {
    try {
      // Using RegExp to match numbers and operators
      final regex = RegExp(r'(\d+(\.\d*)?|\.\d+)|([+\-*/])');
      final matches = regex.allMatches(expression);

      // Prepare a list to store numbers and operators
      List<String> tokens = [];
      for (final match in matches) {
        tokens.add(match.group(0)!);
      }

      // Process the expression tokens
      double result = double.parse(tokens[0]);

      for (int i = 1; i < tokens.length; i += 2) {
        final operator = tokens[i];
        final operand = double.parse(tokens[i + 1]);

        switch (operator) {
          case '+':
            result += operand;
            break;
          case '-':
            result -= operand;
            break;
          case '*':
            result *= operand;
            break;
          case '/':
            if (operand == 0) throw Exception("Division by zero");
            result /= operand;
            break;
        }
      }

      return result;
    } catch (e) {
      throw Exception("Error parsing the expression: $e");
    }
  }

  void _showHistoryDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Calculation History"),
          content: SizedBox(
            height: 200,
            width: 300,
            child: ListView.builder(
              itemCount: _history.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_history[index]),
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: const Text("Close"),
            ),
          ],
        );
      },
    );
  }

  Widget _buildButton(String value, {IconData? icon}) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => _onButtonPressed(value),
        child: icon != null
            ? Icon(icon, size: 24)
            : Text(value, style: const TextStyle(fontSize: 24)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(16.0),
              child: Text(
                _output,
                style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  _buildButton("7"),
                  _buildButton("8"),
                  _buildButton("9"),
                  _buildButton("C"),
                ],
              ),
              Row(
                children: [
                  _buildButton("4"),
                  _buildButton("5"),
                  _buildButton("6"),
                  _buildButton("/"),
                ],
              ),
              Row(
                children: [
                  _buildButton("1"),
                  _buildButton("2"),
                  _buildButton("3"),
                  _buildButton("*"),
                ],
              ),
              Row(
                children: [
                  _buildButton("0"),
                  _buildButton("="),
                  _buildButton("+"),
                  _buildButton("-"),
                ],
              ),
              Row(
                children: [
                  _buildButton("X", icon: Icons.backspace), // Backspace button
                  _buildButton("History", icon: Icons.history), // History button
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
