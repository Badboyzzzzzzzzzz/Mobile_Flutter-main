// Start from the exercice 3 code
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomerCard extends StatelessWidget {
  final Color color;
  final String text;
  const CustomerCard({super.key, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Column(
      children: [
        CustomerCard(color:  Colors.blue[100]!, text: 'OOP'),
        CustomerCard(color:  Colors.blue[300]!, text: 'DART'),
        CustomerCard(color: Colors.blue[600]!, text: 'FLUTTER'),
      ],
    ),
  ));
}
