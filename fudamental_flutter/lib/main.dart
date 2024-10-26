import 'package:flutter/material.dart';

void main() {
  //Ex1
  // runApp(const MaterialApp(
  //   home: Scaffold(
  //       body: Center(
  //     child: Text(
  //       "overconfident",
  //       style: TextStyle(
  //           color: Colors.purple, fontSize: 20, fontWeight: FontWeight.bold),
  //     ),
  //   )),
  // ));

  //Ex2
  runApp(
    MaterialApp(
      home: Container(
        padding: const EdgeInsets.all(50),
        margin: const EdgeInsets.all(40),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Center(
            child: Text(
              "CADT STUDENT",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
