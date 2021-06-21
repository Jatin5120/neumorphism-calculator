import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/constants.dart';
import '../controllers/controllers.dart';
import '../widgets/widgets.dart';

class CalculatorScreen extends StatelessWidget {
  CalculatorScreen({Key? key}) : super(key: key);

  final CalculatorController calculatorController = Get.find();
  final ScreenController screenController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          flex: 5,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            margin: const EdgeInsets.only(right: 20.0),
            child: GetX<CalculatorController>(builder: (controller) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SelectableText(
                    controller.history.value,
                    style: TextStyle(
                      fontSize: controller.isCompleted.value ? 28.0 : 48.0,
                      color: CustomColors.numberColor,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  SelectableText(
                    controller.symbol.value + ' ' + controller.expression.value,
                    style: TextStyle(
                      fontSize: controller.isCompleted.value ? 48.0 : 28.0,
                      color: CustomColors.numberColor,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ],
              );
            }),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 42.0, vertical: 14.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                  child: Icon(
                    Icons.insert_chart_outlined_rounded,
                    color: CustomColors.clearColor,
                  ),
                  onTap: () => screenController.changeScreen(1),
                ),
                GestureDetector(
                  child: Icon(
                    Icons.backspace_rounded,
                    color: CustomColors.clearColor,
                  ),
                  onTap: () => calculatorController.backButton(),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 10,
          child: ButtonGrid(buttons: calculatorButtons),
        ),
      ],
    );
  }
}
