

import 'package:flutter/material.dart';

class MyRoundedButton extends StatelessWidget {
  const MyRoundedButton({Key? key, required this.icon, required this.onPress})
      : super(key: key);

  final IconData icon;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      child: ElevatedButton(
        onPressed: onPress,
        child: Icon(icon),
        style: ElevatedButton.styleFrom(
            primary: Colors.blueAccent, elevation: 10, shape: CircleBorder()),
      ),
    );
  }
}