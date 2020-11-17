class CalculatorBrain {
  final int height;
  final int weight;
  CalculatorBrain(this.height, this.weight);

  double _bmi;

  String calculateBMI() {
    _bmi = weight / ((height / 100) * (height / 100));
    String stringBMI = "$_bmi".substring(0, 4);
    return stringBMI;
  }

  String getResult() {
    _bmi = weight / ((height / 100) * (height / 100));
    if (_bmi >= 25) {
      return "Overweight";
    } else if (_bmi > 18.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }

  String getInterpretation() {
    _bmi = weight / ((height / 100) * (height / 100));
    if (_bmi >= 25) {
      return "You have a higher than normal body weight. Try to exercise more.";
    } else if (_bmi > 18.5) {
      return "You have a normal body weight. Good job!";
    } else {
      return "You have a lower than normal body weight. You can eat a bit more.";
    }
  }
}
