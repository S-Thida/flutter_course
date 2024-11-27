import 'package:flutter/material.dart';

enum Type {
  primary(
    color: Colors.blue,
  ),
  secondary(
    color: Colors.green,
  ),
  disabled(
    color: Colors.grey,
  );

  final Color color;
  const Type({required this.color});
}

enum IconPosition {
  left,
  right,
}

class CustomButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Type type;
  final IconPosition position;

  const CustomButton({super.key,required this.label,required this.icon,this.position = IconPosition.left,this.type = Type.primary,});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: type.color,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: position == IconPosition.left
            ? [
                Icon(icon, color: Colors.white),
                const SizedBox(width: 8.0),
                Text(label, style: const TextStyle(color: Colors.white, fontSize: 20.0)),
              ]
            : [
                Text(label,style: const TextStyle(color: Colors.white, fontSize: 20.0)),
                const SizedBox(width: 8.0),
                Icon(icon, color: Colors.white),
              ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("Custom Buttons"),
      ),
      body: const Padding(
        padding:  EdgeInsets.all(20.0),
        child: Column(
          children: [
            CustomButton(label: 'Submit', icon: Icons.check),
             SizedBox(height: 10),
            CustomButton(label: 'Time',icon: Icons.access_time,position: IconPosition.right, type: Type.secondary),
           SizedBox(height: 10),
            CustomButton(label: 'Account',icon: Icons.account_tree,position: IconPosition.right,type: Type.disabled),
          ],
        ),
      ),
    ),
  ));
}
