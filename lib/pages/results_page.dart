import 'package:bmi_calculator_app/components/bottom_button.dart';
import 'package:bmi_calculator_app/components/reusable_cart.dart';
import 'package:bmi_calculator_app/constants.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage(
      {Key? key,
      required this.bmi_result,
      required this.overweight,
      required this.recomendation})
      : super(key: key);

  final String bmi_result;
  final String overweight;
  final String recomendation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Results Page'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(30),
                child: Text(
                  'Resultados',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 50),
                ),
              )),
          Expanded(
            flex: 4,
            child: ReusableCard(
              color: kInactiveContainerColor,
              onPress: () {},
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    overweight.toUpperCase(),
                    style: const TextStyle(
                        color: Colors.greenAccent,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        fontSize: 30),
                  ),
                  Text(bmi_result, style: TextStyle( fontSize: 100, fontWeight: FontWeight.bold)),
                  Text(recomendation, style: TextStyle(fontSize: 20), textAlign: TextAlign.center,),
                ],
              ),
            ),
          ),
          BottomButton(
              text: 'Recalcular',
              onPress: () {
                Navigator.pop(context);
              })
        ],
      ),
    );
  }
}
