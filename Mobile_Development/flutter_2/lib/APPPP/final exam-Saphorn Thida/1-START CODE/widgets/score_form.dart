import 'package:flutter/material.dart';
import 'package:flutter_2/final%20exam/1-START%20CODE/models/course.dart';

class ScoreForm extends StatefulWidget {
  final Function(StudentScore) onCreated;

  const ScoreForm({super.key, required this.onCreated});

  @override
  State<ScoreForm> createState() => _ScoreFormState();
}

class _ScoreFormState extends State<ScoreForm> {
  final _formKey = GlobalKey<FormState>();

  late String _enteredName;
  late double _enterScore = 0.0;

  void _saveItem() {
    bool isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();

      final newScore = StudentScore(
        name: _enteredName,
        score: _enterScore,
      );
      Navigator.pop(context, newScore);
    }
  }

  String? validateName(String? value) {
    if (value == null ||
        value.isEmpty ||
        value.trim().length <= 1 ||
        value.trim().length > 50) {
      return 'Must be between 1 and 50 characters.';
    }
    return null;
  }

  String? validateScore(String? value) {
    if (value == null ||
        double.tryParse(value) == null ||
        double.parse(value) < 0 ||
        double.parse(value) > 100) {
      return 'Must be the score between 0 and 100';
    }
    return null;
  }
// widget.onCreated(course);
// Navigator.pop(context);

  @override
  void initState() {
    super.initState();

    _enteredName = "";
    _enterScore = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _enteredName,
                maxLength: 50,
                decoration: const InputDecoration(
                  label: Text('Name'),
                ),
                validator: validateName,
                onSaved: (value) {
                  _enteredName = value!;
                },
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        label: Text('Score'),
                      ),
                      initialValue: _enterScore.toString(),
                      keyboardType: TextInputType.number,
                      validator: validateScore,
                      onSaved: (value) {
                        _enterScore = double.parse(value!);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 25.5),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 20),
              ElevatedButton(
                  onPressed: _saveItem, child: const Text('Add score')),
            ],
          
          ),
        )
      );
  }
}
