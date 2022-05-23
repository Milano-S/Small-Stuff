import 'dart:math';

class BmiLogic {
  BmiLogic(this.height, this.weight);

  final int height;
  final int weight;
  double _bmi = 0;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(_bmi >= 25){
      return 'FAT';
    }else if(_bmi > 18.5){
      return 'NORMAL';
    }else{
      return 'UNDERWEIGHT';
    }
  }
  String getInterpretation(){
    if(_bmi >= 25){
      return 'Too fat, exercise more';
    }else if(_bmi > 18.5){
      return 'NORMAL';
    }else{
      return 'Too thin, eat more';
    }
  }
}
