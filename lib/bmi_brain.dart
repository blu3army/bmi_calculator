

import 'dart:math';

class BMIBrain{

  final int weight;
  final int height;

  double _bmi = 0.0;

  BMIBrain({required this.weight, required this.height});

  String calculateBMI(){
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(_bmi >= 25){
      return 'Sobrepeso';
    }
    else if( _bmi > 18){
      return 'Peso normal';
    }
    else{
      return 'Falta peso';
    }
  }


  String getInterpretation(){
    if(_bmi >= 25){
      return 'Tienes un peso mayor a lo normal, prueba hacer ejercicios';
    }
    else if( _bmi > 18){
      return 'Tienes un peso normal. Sigue así';
    }
    else{
      return 'Tienes un peso menor a lo normal, prueba comer más';
    }
  }


}