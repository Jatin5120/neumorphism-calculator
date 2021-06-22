import '../constants/constants.dart';
import '../controllers/controllers.dart';
import '../models/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildButton extends StatelessWidget {
  BuildButton({
    Key? key,
    required this.buttonModal,
    required this.index,
    required this.isUnit,
  }) : super(key: key);

  final ButtonModal buttonModal;
  final int index;
  final bool isUnit;

  final CalculatorController calController = Get.find();
  final UnitController unitController = Get.find();

  showSnackBar() {
    Get.snackbar(
      'Limit',
      'Cannot enter more than 13 digits at a time',
      backgroundColor: CustomColors.bg.withOpacity(0.5),
      colorText: CustomColors.numberColor,
      icon: Icon(Icons.clear_rounded, color: CustomColors.numberColor),
      isDismissible: true,
      animationDuration: Duration(milliseconds: 300),
      snackStyle: SnackStyle.GROUNDED,
    );
  }

  void calculatorButtonClick(ButtonModal buttonModal) {
    String button = buttonModal.text;
    final bool isNumberZero = calController.expression.value == '0';
    final bool isDotPressed = button == '.';
    final bool containsDot = calController.expression.value.contains('.');

    switch (buttonModal.buttonType) {
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
          showSnackBar();
        }
        break;
      case ButtonType.operator:
        final bool isHistoryZero = calController.historyValue == '0';
        if (!isHistoryZero && !calController.isCompletedValue)
          calController.setExpression = calController.secondNumber.toString();
        calController.firstNumber = calController.number;
        calController.calculate(button);
        calController.setExpression = '0';
        if (button == MyButtons.equal) {
          calController.changeCompleted = false;
        } else {
          calController.changeCompleted = true;
        }
        break;
      case ButtonType.clear:
        calController.changeCompleted = true;
        calController.setSymbol = '';
        calController.setExpression = '0';
        calController.setHistory = '0';
        calController.secondNumber = 0;

        break;
      default:
    }
  }

  unitButtonClick(ButtonModal buttonModal) {
    String button = buttonModal.text;
    final bool isNumberZero = unitController.firstNumber.value == '0';
    final bool isDotPressed = button == '.';
    final bool containsDot = unitController.firstNumber.value.contains('.');

    switch (buttonModal.buttonType) {
      case ButtonType.number:
        if (unitController.numberLength < 13) {
          if (isNumberZero & !isDotPressed) {
            unitController.setFirstNumber = button;
          } else if (isDotPressed & containsDot) {
            /// No change
          } else {
            /// Inserting numbers to the expression
            unitController.firstNumber.value += button;
          }
        } else {
          showSnackBar();
        }
        break;
      case ButtonType.clear:
        unitController.setFirstNumber = '1';
        break;
      default:
    }
    unitController.convertValue();
  }

  @override
  Widget build(BuildContext context) {
    return GetX<CalculatorController>(builder: (controller) {
      return Listener(
        onPointerDown: (onPointerDown) {
          controller.changePressed(index, true);
        },
        onPointerUp: (onPointerUp) {
          if (isUnit)
            unitButtonClick(buttonModal);
          else
            calculatorButtonClick(buttonModal);
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
            buttonModal.text,
            style: TextStyle(
              color: buttonModal.buttonType == ButtonType.number
                  ? CustomColors.numberColor
                  : buttonModal.buttonType == ButtonType.operator
                      ? buttonModal.text == MyButtons.equal
                          ? CustomColors.equalColor
                          : CustomColors.operatorColor
                      : CustomColors.clearColor,
              fontSize: buttonModal.text == MyButtons.equal ? 36 : 28,
            ),
          ),
        ),
      );
    });
  }
}
