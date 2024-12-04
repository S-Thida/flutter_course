
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum Category {
  euro(name: "EURO"),
  riel(name: "RIEL"),
  dong(name: "DONG");

  final String name;
  const Category({required this.name});
}

class DeviceConverter extends StatefulWidget {
  const DeviceConverter({super.key});

  @override
  State<DeviceConverter> createState() => _DeviceConverterState();
}

class _DeviceConverterState extends State<DeviceConverter> {
  final TextEditingController _usdController = TextEditingController();
  final BoxDecoration textDecoration = BoxDecoration(
    color: Colors.white.withOpacity(0.2),
    borderRadius: BorderRadius.circular(12),
  );

  Category? selectedCategory;
  double? convertedAmount;

  // Conversion rates
  final double euroRate = 0.93;
  final double rielRate = 4100;
  final double dongRate = 24000;

  void convert() {
    double usdAmount = double.tryParse(_usdController.text) ?? 0;

    setState(() {
      switch (selectedCategory) {
        case Category.euro:
          convertedAmount = usdAmount * euroRate;
          break;
        case Category.riel:
          convertedAmount = usdAmount * rielRate;
          break;
        case Category.dong:
          convertedAmount = usdAmount * dongRate;
          break;
        default:
          convertedAmount = null; 
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Icon(
            Icons.money,
            size: 60,
            color: Colors.white,
          ),
              const Center(
                child: Text(
                  "Converter",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
              const SizedBox(height: 50),
              const Text(
                "Amount in dollars:",
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _usdController,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                ],
                decoration: InputDecoration(
                  prefix: const Text(
                    '\$ ',
                    style: TextStyle(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.white, width: 1.0),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: 'Enter an amount in dollars',
                  hintStyle: const TextStyle(color: Colors.black),
                ),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 30),
              const Text(
                "Currency:",
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 10),
              DropdownButton<Category>(
                hint: const Text(
                  'Select Currency',
                  style: TextStyle(color: Colors.white),
                ),
                value: selectedCategory,
                dropdownColor: Colors.orange,
                onChanged: (Category? newValue) {
                  setState(() {
                    selectedCategory = newValue;
                    convert();
                  });
                },
                items: Category.values
                    .map<DropdownMenuItem<Category>>((Category category) {
                  return DropdownMenuItem<Category>(
                    value: category,
                    child: Text(
                      category.name,
                      style: const TextStyle(color: Colors.white),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 30),
              const Text(
                "Amount in selected currency:",
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: textDecoration,
                child: Text(
                  convertedAmount != null
                      ? convertedAmount!.toStringAsFixed(2)
                      : '0',
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      );
  
  }
}
