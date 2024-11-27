

import 'package:flutter/material.dart';

class SelectButton extends StatefulWidget {
  
const SelectButton({super.key});

  @override
  State<SelectButton> createState() => _SelectButtonState();
}

class _SelectButtonState extends State<SelectButton> {
  bool _isSelected = true;

  void _toSelect() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  Color get _backgroundColor =>_isSelected ? Colors.blue[500]! : Colors.blue[50]!;
  Color get _textColor => _isSelected ? Colors.white : Colors.black;
  String get _buttonText => _isSelected ? "Selected" : "Not Selected";

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 600,
      height: 100,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: _backgroundColor,
        ),
        onPressed: _toSelect,
        child: Text(
          _buttonText,
          style: TextStyle(color: _textColor, fontSize: 20.0),
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Stateful Widget Button"),
        ),
        body: const Center(
          child: Column(
            children: [
              SelectButton(),
              SizedBox(height: 20),
              SelectButton(),
              SizedBox(height: 20)
            ],
          )
          
        ),
      ),
    ));

