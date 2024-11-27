import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton(
    this.label, {
    super.key,
    required this.onTap,
    this.icon,
  });

  final IconData? icon;
  final String label;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      
      children: [
        
        ElevatedButton.icon(
          icon: Icon(icon),
          label: Text(label),
          onPressed: onTap,
          
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 40,
              
            ),
          ),
        ),
        const SizedBox(height: 16), // Adjust the height as needed
      ],
    );
  }
}