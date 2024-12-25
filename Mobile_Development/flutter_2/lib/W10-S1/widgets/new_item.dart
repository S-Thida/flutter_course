import 'package:flutter/material.dart';
import 'package:flutter_2/W10-S1/models/grocery_item.dart';
import 'package:uuid/uuid.dart';
import '../models/grocery_category.dart';

enum Mode { creating, editing, normal, selectionMode}

class NewItem extends StatefulWidget {
  final GroceryItem? editedItem;
  final Mode mode;

  NewItem({
    super.key,
    this.editedItem,
    required this.mode,
  }) {
    if (mode == Mode.editing && editedItem == null) {
      throw Exception("Editon mode required a non null grocery item");
    }
  }

  @override
  State<NewItem> createState() {
    return _NewItemState();
  }
}

class _NewItemState extends State<NewItem> {
  // We create a key to access and control the state of the Form.
  final _formKey = GlobalKey<FormState>();
  final _uuid = const Uuid();

  late String _enteredName;
  late int _enterQuanity = 1;
  late GroceryCategory? _defaultCategory = GroceryCategory.fruit;

  void _saveItem() {
    // 1 - Validate the form
    bool isValid = _formKey.currentState!.validate();
    if (isValid) {
      // 2 - Save the form to get last entered values
      _formKey.currentState!.save();

      final newItem = GroceryItem(
        id: _uuid.v4(),
        name: _enteredName,
        quantity: _enterQuanity,
        category: _defaultCategory!,
      );
      Navigator.pop(context, newItem);
    }
  }

  @override
  void initState() {
    super.initState();

    if (onEditionMode) {
      _enteredName = widget.editedItem!.name;
      _enterQuanity = widget.editedItem!.quantity;
      _defaultCategory = widget.editedItem!.category;
    } else {
      _enteredName = "";
      _enterQuanity = 1;
      _defaultCategory = GroceryCategory.fruit;
    }
  }

  bool get onEditionMode => widget.mode == Mode.editing;

  void _resetForm() {
    _formKey.currentState!.reset();
  }

  String? validateTitle(String? value) {
    if (value == null ||
        value.isEmpty ||
        value.trim().length <= 1 ||
        value.trim().length > 50) {
      return 'Must be between 1 and 50 characters.';
    }
    return null;
  }

  String? validateQuantity(String? value) {
    if (value == null || int.tryParse(value) == null || int.parse(value) <= 0) {
      return 'Must be a valid, positive number.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(widget.mode == Mode.creating ? 'Add a new item' : 'Edit item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
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
                validator: validateTitle,
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
                        label: Text('Quantity'),
                      ),
                      initialValue: _enterQuanity.toString(),
                      keyboardType: TextInputType.number,
                      validator: validateQuantity,
                      onSaved: (value) {
                        _enterQuanity = int.parse(value!);
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: DropdownButtonFormField<GroceryCategory>(
                      value: _defaultCategory,
                      items: [
                        for (final category in GroceryCategory.values)
                          DropdownMenuItem<GroceryCategory>(
                            value: category,
                            child: Row(
                              children: [
                                Container(
                                  width: 16,
                                  height: 16,
                                  color: category.color,
                                ),
                                const SizedBox(width: 6),
                                Text(category.label),
                              ],
                            ),
                          ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _defaultCategory = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: _resetForm,
                    child: const Text('Reset'),
                  ),
                  ElevatedButton(
                    onPressed: _saveItem,
                    child: Text(widget.mode == Mode.creating
                        ? 'Add Item'
                        : 'Save Changes'),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
