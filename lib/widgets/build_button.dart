import '../constants/constants.dart';
import '../controllers/controllers.dart';
import '../models/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildButton extends StatelessWidget {
  BuildButton({
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
        if (calController.expressionLength < 13) {
          if (isNumberZero & !isDotPressed) {
            calController.setExpression = button;
          } else if (isDotPressed & containsDot) {
            /// No change
          } else {
            /// Inserting numbers to the expression
            calController.expression.value += button;
          }
        } else {
          Get.snackbar(
            'Limit',
            'Cannot enter more than 13 digits at a time',
            backgroundColor: CustomColors.bg.withOpacity(0.5),
            colorText: CustomColors.numberColor,
            icon: Icon(Icons.clear_rounded, color: CustomColors.numberColor),
          );
        }
        break;
      case ButtonType.operator:
        // calController.setHistory = calController.expressionValue;
        final bool isHistoryZero = calController.historyValue == '0';
        if (!isHistoryZero && !calController.isCompletedValue)
          calController.setExpression = calController.secondNumber.toString();
        calController.firstNumber = calController.number;
        calController.calculate(button);
        if (button == MyButtons.equal) {
          calController.setExpression = '0';

          calController.changeCompleted = false;
        } else {
          calController.setExpression = '0';
          calController.changeCompleted = true;
        }
        break;
      case ButtonType.clear:
        if (button == MyButtons.clear) {
          calController.changeCompleted = true;
          calController.setSymbol = '';
          calController.setExpression = '0';
          calController.setHistory = '0';
          calController.secondNumber = 0;
        } else if (button == MyButtons.back) {
          if (calController.expressionLength == 1)
            calController.setExpression = '0';
          else
            calController.setExpression = calController.expression
                .substring(0, calController.expressionLength - 1);
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
