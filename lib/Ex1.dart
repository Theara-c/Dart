import 'package:flutter/material.dart';

class Custom extends StatelessWidget {
  const new({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My hobbies")),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
        ),
        padding: EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 10,
          children: [
            card(text: "Travelling", color: Colors.green, icon: Icons.search),
            card(text: "Skating", color: const Color.fromARGB(255, 18, 57, 90), icon: Icons.skateboarding),
          ],
        ),
      ),
    );
  }
}

Widget card({
  required String text,
  required Color color,
  required IconData icon,
}) {
  return Container(
    padding: EdgeInsets.all(30),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Row(
      children: [
        Icon(icon, color: Colors.white, size: 16),
        SizedBox(width: 20),
        Text(text, style: TextStyle(color: Colors.white)),
      ],
    ),
  );
}
