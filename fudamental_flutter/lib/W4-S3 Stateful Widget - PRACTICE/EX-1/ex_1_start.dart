import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Custom buttons"),
        ),
        body: Column(
          children: [
            ButtonSelected(),
            const SizedBox(
              height: 10,
            ),
            ButtonSelected(),
            const SizedBox(
              height: 10,
            ),
            ButtonSelected(),
            const SizedBox(
              height: 10,
            ),
            ButtonSelected(),
          ],
        ),
      ),
    ));

class ButtonSelected extends StatefulWidget {
  @override
  State<ButtonSelected> createState() => _MyButton();
}

class _MyButton extends State<ButtonSelected> {
  bool isSelected = false;
  String get text => isSelected ? 'Selected' : 'Not Selected';
  Color get textColor => isSelected ? Colors.white : Colors.black;
  Color get backgroundColor =>
      isSelected ? Colors.blue[500]! : Colors.blue[50]!;

  void changeStateOfButton() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 400,
        height: 100,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor,
            ),
            onPressed: changeStateOfButton,
            child: Center(
              child: Text(
                text,
                style: TextStyle(color: textColor),
              ),
            )),
      ),
    );
  }
}
