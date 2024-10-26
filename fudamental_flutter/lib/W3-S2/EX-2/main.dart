import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
    
      home: Container(
        padding: const EdgeInsets.all(50),
        margin: const EdgeInsets.all(40),
        color: Colors.blue[300],
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(1),
            color: Colors.blue[600],
          ),
          child: const Center(
            child: Text(
              "CADT STUDENT",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
