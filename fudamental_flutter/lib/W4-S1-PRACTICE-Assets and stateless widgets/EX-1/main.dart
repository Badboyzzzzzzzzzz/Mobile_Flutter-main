import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home: Scaffold(
    appBar: AppBar(
      title: const Text("My Hobby"),
      centerTitle: true,
      titleTextStyle: const TextStyle(color: Colors.black),
      backgroundColor: Colors.orange,
    ),
    body: const Padding(
      padding: EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          HobbyCard(hobbyICON: Icons.travel_explore, title: "Travelling",cardColor: Colors.green,),
          SizedBox(height: 10,),
          HobbyCard(hobbyICON: Icons.skateboarding, title: "Skating",cardColor: Color.fromARGB(255, 123, 186, 236),),
        ],
      ),
    ),
  )));
}

class HobbyCard extends StatelessWidget {
  const HobbyCard({super.key, required this.hobbyICON, required this.title,required this.cardColor});
  final String title;
  final IconData hobbyICON;
  final Color cardColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(hobbyICON,color: Colors.white,),
          const SizedBox(width: 20),
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
