import 'package:bmi_calculator_app/constants.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({Key? key,required this.text,required this.onPress}) : super(key: key);

  final String text;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.only(bottom: 15),
        color: kBottomContainerColor,
        height: kBottomContainerHeigth,
        child: Center( child:Text(text.toUpperCase(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),)),
      ),
    );
  }
}
