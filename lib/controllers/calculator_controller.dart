import 'package:get/get.dart';
import 'dart:math';
import '../constants/constants.dart';

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

  bool get isCompletedValue => isCompleted.value;

  set changeCompleted(bool status) => isCompleted.value = status;

  set setExpression(String value) => expression.value = value;

  set setHistory(String value) => history.value = value;

  set setSymbol(String value) => symbol.value = value;

  changePressed(int index, bool pressed) {
    pressedList[index] = pressed;
  }

  backButton() {
    if (expressionLength == 1)
      setExpression = '0';
    else
      setExpression = expression.substring(0, expressionLength - 1);
  }

  calculate(String button) {
    switch (symbolValue) {
      case MyButtons.add:
        secondNumber += firstNumber;
        break;
      case MyButtons.subtract:
        secondNumber -= firstNumber;
        break;
      case MyButtons.multiply:
        secondNumber *= firstNumber;
        break;
      case MyButtons.divide:
        secondNumber /= firstNumber;
        break;
      case MyButtons.power:
      case '^':
        secondNumber = pow(secondNumber, firstNumber).toDouble();
        break;
      case MyButtons.root:
        secondNumber = pow(secondNumber, 1 / firstNumber).toDouble();
        break;
      case MyButtons.percent:
        secondNumber = secondNumber / 100 * firstNumber;
        break;
      case '':
        secondNumber = firstNumber;
        break;
      default:
    }
    bool isInfinite = secondNumber.isInfinite;
    if (!isInfinite) {
      bool hasNoFloatValue = secondNumber == secondNumber.toInt().toDouble();
      if (hasNoFloatValue)
        setHistory = secondNumber.toInt().toString();
      else
        setHistory = secondNumber.toString();
    } else
      setHistory = secondNumber.toString();
    if (button == MyButtons.power)
      setSymbol = '^';
    else if (button == MyButtons.equal)
      setSymbol = '';
    else
      setSymbol = button;
  }
}
