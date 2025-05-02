import 'dart:math';

class CalculatorBrain {
  final int height;
  final int weight;
  late double bmi;

  CalculatorBrain({required this.height, required this.weight});

  String CalculateBmi() {
    bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(1);
  }

  String GetResult() {
    if (bmi >= 25) {
      return "Over Weight";
    } else if (bmi > 18.5 && bmi < 25) {
      return 'Normal';
    } else {
      return 'Under Weight';
    }
  }

  String GetInterpretation() {
    if (bmi >= 25) {
      return "U hv a higher than normal bdy weight try to exercise more";
    } else if (bmi > 18.5 && bmi < 25) {
      return 'U hv a normal bdy weight : Good Job';
    } else {
      return 'U have lower than normal bdy weght eat more';
    }
  }
}
