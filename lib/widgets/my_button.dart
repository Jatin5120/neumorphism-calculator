import '../constants/constants.dart';
import '../controllers/controllers.dart';
import '../models/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyButton extends StatelessWidget {
  MyButton({
    Key? key,
    required this.buttonModel,
    required this.index,
  }) : super(key: key);

  final ButtonModel buttonModel;
  final int index;

  final CalculatorController calController = Get.find();

  void buttonClick(ButtonModel buttonModel) {
    String button = buttonModel.text;
    final bool isNumberZero = calController.expression.value == '0';
    final bool isDotPressed = button == '.';
    final bool containsDot = calController.expression.value.contains('.');

    switch (buttonModel.buttonType) {
      case ButtonType.number:
        calController.changeCompleted = true;
        if (isNumberZero & !isDotPressed) {
          calController.setExpression = button;
        } else if (isDotPressed & containsDot) {
          /// No change
        } else {
          /// Inserting numbers to the expression
          calController.expression.value += button;
        }
        break;
      case ButtonType.operator:
        // calController.setHistory = calController.expressionValue;
        if (button == '=') {
          calController.calculate(button);
          if (calController.symbolValue != '') {
            calController.setExpression = calController.historyValue;
            calController.setHistory = '0';
          }

          calController.changeCompleted = true;
          calController.setSymbol = '';
          //   calController.setHistory = '0';
        } else {
          calController.firstNumber = calController.number;
          calController.calculate(button);
          calController.setExpression = '0';
        }
        break;
      case ButtonType.clear:
        if (button == 'AC') {
          calController.changeCompleted = false;
          calController.setSymbol = '';
          calController.setExpression = '0';
          calController.setHistory = '0';
          calController.secondNumber = 0;
        } else if (button == '←') {
          if (calController.isCompleted.value) {
            if (calController.expressionLength == 1)
              calController.setExpression = '0';
            else
              calController.setExpression = calController.expression
                  .substring(0, calController.expressionLength - 1);
          } else {
            if (calController.historyLength == 1)
              calController.setHistory = '0';
            else
              calController.setHistory = calController.history
                  .substring(0, calController.historyLength - 1);
          }
        }
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetX<CalculatorController>(builder: (controller) {
      return Listener(
        onPointerDown: (onPointerDown) {
          controller.changePressed(index, true);
        },
        onPointerUp: (onPointerUp) {
          buttonClick(buttonModel);
          controller.changePressed(index, false);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          margin: const EdgeInsets.all(10.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: CustomColors.bg,
            boxShadow: controller.isPressed(index)
                ? Utilities.innerShadow
                : Utilities.outerShadow,
            gradient: controller.isPressed(index)
                ? LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      CustomColors.darkShadow,
                      CustomColors.bg,
                      CustomColors.bg,
                      CustomColors.lightShadow,
                    ],
                  )
                : null,
          ),
          child: Text(
            buttonModel.text,
            style: TextStyle(
              color: buttonModel.buttonType == ButtonType.number
                  ? CustomColors.numberColor
                  : buttonModel.buttonType == ButtonType.operator
                      ? CustomColors.operatorColor
                      : CustomColors.clearColor,
              fontSize: 28,
            ),
          ),
        ),
      );
    });
  }
}
