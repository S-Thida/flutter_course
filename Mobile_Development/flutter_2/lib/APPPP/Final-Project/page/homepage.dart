import "package:flutter/material.dart";

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  void addNewExpense(){
showAboutDialog(context:context,
builder: (context)=>
)
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      floatingActionButton: FloatingActionButton(onPressed: addNewExpense,
      child: const Icon(Icons.add)
      ),
    );
  }
}