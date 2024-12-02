import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Favorite cards"),
        ),
        body: const Column(
          children: [
            Card(),
            Card(),
            Card(),
            Card(),
          ],
        ),
      ),
    ));

class Card extends StatefulWidget {
  const Card({
    super.key,
  });

  @override
  State<Card> createState() => _CardState();
}

class _CardState extends State<Card> {
  bool isClicked = false;
  Color get favoriteColor => isClicked ? Colors.red : Colors.grey;
  IconData get favoriteIcon =>
      isClicked ? Icons.favorite : Icons.favorite_border_outlined;
  void click() {
    setState(() {
      isClicked = !isClicked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: .5, color: Colors.grey),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'title',
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.w800),
                ),
                SizedBox(height: 10.0),
                Text('description')
              ],
            ),
          ),
          IconButton(
              onPressed: click,
              icon: Icon(
                favoriteIcon,
                color: favoriteColor,
              ))
        ],
      ),
    );
  }
}
