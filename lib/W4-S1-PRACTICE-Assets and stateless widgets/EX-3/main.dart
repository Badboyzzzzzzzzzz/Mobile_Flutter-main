import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text(
          'Custom buttons',
          style: TextStyle(fontSize: 40, color: Colors.black),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomButton(
              label: 'Submit',
              icon: Icons.check,
              buttonType: ButtonType.primary,
              iconPosition: IconPosition.left,
            ),
            SizedBox(height: 20),
            CustomButton(
              label: 'Time',
              icon: Icons.access_time,
              buttonType: ButtonType.secondary,
              iconPosition: IconPosition.right,
            ),
            SizedBox(height: 20),
            CustomButton(
              label: 'Disabled',
              icon: Icons.block,
              buttonType: ButtonType.disabled,
              iconPosition: IconPosition.right,
            ),
          ],
        ),
      ),
    ),
  ));
}

class CustomButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final ButtonType buttonType;
  final IconPosition iconPosition;

  const CustomButton({
    super.key,
    required this.label,
    required this.icon,
    this.buttonType = ButtonType.primary,
    this.iconPosition = IconPosition.left,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 50,
      decoration: BoxDecoration(
        color: buttonType.color,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          if (buttonType != ButtonType.disabled)
            BoxShadow(
              color: buttonType.color.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
        ],
      ),
      child: TextButton(
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: iconPosition == IconPosition.left
              ? [
                  Icon(icon, color: Colors.white),
                  const SizedBox(width: 8),
                  Text(
                    label,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ]
              : [
                  Text(
                    label,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  const SizedBox(width: 8),
                  Icon(icon, color: Colors.white),
                ],
        ),
      ),
    );
  }
}

enum ButtonType {
  primary(Colors.blue),
  secondary(Colors.green),
  disabled(Colors.grey);

  final Color color;
  const ButtonType(this.color);
}

enum IconPosition {
  left,
  right,
}
