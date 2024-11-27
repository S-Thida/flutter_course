import 'package:flutter/material.dart';

class HobbyCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color backgroundColor;

  const HobbyCard({
    super.key,
    required this.title,
    required this.icon,
    this.backgroundColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: backgroundColor,
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 30),
            Icon(
              icon,
              color: Colors.white,
            ),
            const SizedBox(width: 20),
            Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 25.5),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: const Text(" Thida's Hobbies"),
        ),
        body: const Padding(
          padding: EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              HobbyCard(
                  title: 'Travelling',
                  icon: Icons.travel_explore,
                  backgroundColor: Colors.green),
              SizedBox(height: 10),
              HobbyCard(title: 'Skating', icon: Icons.skateboarding),
              SizedBox(height: 10),
              HobbyCard(
                  title: 'Reading',
                  icon: Icons.book,
                  backgroundColor: Color.fromARGB(255, 222, 117, 152)),
            ],
          ),
        ),
      ),
    ),
  );
}
