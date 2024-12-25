import 'package:flutter/material.dart';
import 'package:flutter_2/Money_tracker/screens/expenses/expenses.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(image: AssetImage('assets/W7-S2/chill_guy.jpg'),width: 400,  height: 250,),
            const Text('Hello Thida, Welcome to your Money Tracker!', style: TextStyle(fontSize: 15.0)),
            const SizedBox(height: 20.0,),
            ElevatedButton(
              onPressed: ()  {
                 Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Expenses()),
                );
              },
             style: ElevatedButton.styleFrom(
    backgroundColor: const Color.fromARGB(255, 206, 206, 206), // Change this to your desired color
    foregroundColor: const Color.fromARGB(255, 33, 33, 33), // Text color
    padding: const EdgeInsets.symmetric(
      horizontal: 24.0,
      vertical: 24.0,
    ),
    textStyle: const TextStyle(
      fontSize: 16.0,
      
    ),
  ),
              child: const Text('Click to continue'),
            
            ),
          ],
        ),
      ),
    );
  }
}