import 'package:bmi_calculator_app/bmi_brain.dart';
import 'package:bmi_calculator_app/components/bottom_button.dart';
import 'package:bmi_calculator_app/components/my_rounded_button.dart';
import 'package:bmi_calculator_app/components/reusable_cart.dart';
import 'package:bmi_calculator_app/components/sex_card.dart';
import 'package:bmi_calculator_app/constants.dart';
import 'results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender { male, female, unselected }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 170;
  int weight = 60;
  int age = 20;

  Gender genderSelected = Gender.unselected;

  void updateColor(Gender gender) {
    setState(() {
      //Caso de hacer tap en gender ya seleccionado
      if (genderSelected == gender) {
        genderSelected = Gender.unselected;
      } else {
        if (gender == Gender.male) {
          genderSelected = Gender.male;
        } else {
          genderSelected = Gender.female;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI Calculator'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: ReusableCard(
                        onPress: () {
                          updateColor(Gender.male);
                        },
                        color: genderSelected == Gender.male
                            ? kActiveContainerColor
                            : kInactiveContainerColor,
                        child: const SexCard(
                          icon: FontAwesomeIcons.mars,
                          text: 'Male',
                        ),
                  )),
                  Expanded(
                      child: ReusableCard(
                      onPress: () {
                        updateColor(Gender.female);
                      },
                      color: genderSelected == Gender.female
                          ? kActiveContainerColor
                          : kInactiveContainerColor,
                      child: const SexCard(
                      icon: FontAwesomeIcons.venus, text: 'Female'),
                  )),
                ],
              ),
            ),
            Expanded(
                child: ReusableCard(
              onPress: () {},
              color: kInactiveContainerColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Height',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    textBaseline: TextBaseline.alphabetic,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Text(height.toString(), style: kNumberTextStyke),
                      Text('cm', style: kLabelTextStyle)
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.redAccent,
                      inactiveTrackColor: Color(0x60ff6363),
                      thumbColor: Colors.redAccent,
                      overlayColor: Color(0x30ff6363),
                      trackHeight: 5,
                      valueIndicatorColor: Color(0x60ff6363),
                      activeTickMarkColor: Colors.redAccent,
                      inactiveTickMarkColor: Color(0x60ff6363),
                    ),
                    child: Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                        divisions: 20,
                        label: '$height',
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        }),
                  )
                ],
              ),
            )),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: ReusableCard(
                          onPress: () {},
                          color: kInactiveContainerColor,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Weight',
                                  style: kLabelTextStyle,
                                ),
                                Text(
                                  weight.toString(),
                                  style: kNumberTextStyke,
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    MyRoundedButton(
                                      icon: FontAwesomeIcons.minus,
                                      onPress: () {
                                        setState(() {
                                          weight > 50 ? weight-- : weight;
                                        });
                                      },
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    MyRoundedButton(
                                      icon: FontAwesomeIcons.plus,
                                      onPress: () {
                                        setState(() {
                                          weight < 100 ? weight++ : weight;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ]))),
                  Expanded(
                      child: ReusableCard(
                          onPress: () {},
                          color: kInactiveContainerColor,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Age',
                                style: kLabelTextStyle,
                              ),
                              Text(
                                age.toString(),
                                style: kNumberTextStyke,
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MyRoundedButton(
                                    icon: FontAwesomeIcons.minus,
                                    onPress: () {
                                      setState(() {
                                        age > 17 ? age-- : age;
                                      });
                                    },
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  MyRoundedButton(
                                    icon: FontAwesomeIcons.plus,
                                    onPress: () {
                                      setState(() {
                                        age < 100 ? age++ : age;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                  )),
                ],
              ),
            ),
            BottomButton( text: 'Ver resultados', onPress: (){

              var brain = BMIBrain(weight: weight, height: height);

              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> ResultsPage(
                    bmi_result: brain.calculateBMI(),
                    overweight: brain.getResult(),
                    recomendation: brain.getInterpretation(),
                  )));
            },)
          ],
        ));
  }
}




