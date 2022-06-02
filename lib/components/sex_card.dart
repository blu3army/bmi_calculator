import 'package:bmi_calculator_app/constants.dart';
import 'package:flutter/material.dart';

class SexCard extends StatelessWidget {
  const SexCard({Key? key, required this.icon, required this.text})
      : super(key: key);

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 70),
        SizedBox(
          height: 20,
        ),
        Text(
          text,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}

