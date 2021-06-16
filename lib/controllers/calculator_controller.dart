import 'package:get/get.dart';
import 'dart:math';

class CalculatorController extends GetxController {
  RxString expression = "0".obs;
  RxString history = "0".obs;
  RxList<bool> pressedList = List.generate(20, (index) => false).obs;
  RxBool isCompleted = false.obs;
  double get number => double.parse(expression.value);
  double firstNumber = 0;
  double secondNumber = 0;
  RxString symbol = ''.obs;

  bool isPressed(int index) => pressedList[index];

  int get expressionLength => expression.value.length;

  int get historyLength => history.value.length;

  String get expressionValue => expression.value;

  String get historyValue => history.value;

  String get symbolValue => symbol.value;

  set changeCompleted(bool status) => isCompleted.value = status;

  set setExpression(String value) => expression.value = value;

  set setHistory(String value) => history.value = value;

  set setSymbol(String value) => symbol.value = value;

  changePressed(int index, bool pressed) {
    pressedList[index] = pressed;
  }

  calculate(String button) {
    switch (symbolValue) {
      case '+':
        secondNumber += firstNumber;
        break;
      case '-':
        secondNumber -= firstNumber;
        break;
      case '×':
        secondNumber *= firstNumber;
        break;
      case '/':
        secondNumber /= firstNumber;
        break;
      case '%':
        secondNumber %= firstNumber;
        break;
      case 'xⁿ':
        secondNumber = pow(firstNumber, secondNumber).toDouble();
        break;
      case '':
        secondNumber = firstNumber;
        break;
      default:
    }
    setHistory = secondNumber.toString();
    if (button == 'xⁿ')
      setSymbol = '^';
    else if (button == '=')
      setSymbol = '';
    else
      setSymbol = button;
  }
}
