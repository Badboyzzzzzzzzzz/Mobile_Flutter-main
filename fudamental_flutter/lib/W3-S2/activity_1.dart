import 'package:flutter/material.dart';

class NewWidget extends StatelessWidget {
  final String label;
  final Color start;
  final Color end;
  const NewWidget({
    super.key, required this.label,required this.start,required this.end
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [start, end]),
          borderRadius: BorderRadius.circular(30)),
      child: Text(label,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 35,
              decoration: TextDecoration.none)),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: Column(
      children: [
        NewWidget(label: "HELLO 1", start: Colors.blue, end: Colors.red),
        NewWidget(label: "HELLO 2", start: Colors.blue, end: Colors.red),
        NewWidget(label: "HELLO 3", start: Colors.blue, end: Colors.red),

       
      ],
    ),
  ));
}
