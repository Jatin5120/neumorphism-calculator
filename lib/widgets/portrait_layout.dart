import '../constants/constants.dart';
import '../controllers/controllers.dart';
import '../models/models.dart';
import '../widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PortraitLayout extends StatelessWidget {
  final CalculatorController calculatorController = Get.find();
  final ScreenController screenController = Get.find();

  final List<String> chipList = ['Calculator', 'Unit', 'Currency'];

  final List<ButtonModel> buttons = [
    ButtonModel(text: MyButtons.clear, buttonType: ButtonType.clear),
    ButtonModel(text: MyButtons.back, buttonType: ButtonType.clear),
    ButtonModel(text: MyButtons.power, buttonType: ButtonType.operator),
    ButtonModel(text: MyButtons.root, buttonType: ButtonType.operator),
    ButtonModel(text: MyButtons.seven, buttonType: ButtonType.number),
    ButtonModel(text: MyButtons.eight, buttonType: ButtonType.number),
    ButtonModel(text: MyButtons.nine, buttonType: ButtonType.number),
    ButtonModel(text: MyButtons.add, buttonType: ButtonType.operator),
    ButtonModel(text: MyButtons.four, buttonType: ButtonType.number),
    ButtonModel(text: MyButtons.five, buttonType: ButtonType.number),
    ButtonModel(text: MyButtons.six, buttonType: ButtonType.number),
    ButtonModel(text: MyButtons.subtract, buttonType: ButtonType.operator),
    ButtonModel(text: MyButtons.one, buttonType: ButtonType.number),
    ButtonModel(text: MyButtons.two, buttonType: ButtonType.number),
    ButtonModel(text: MyButtons.three, buttonType: ButtonType.number),
    ButtonModel(text: MyButtons.multiply, buttonType: ButtonType.operator),
    ButtonModel(text: MyButtons.dot, buttonType: ButtonType.number),
    ButtonModel(text: MyButtons.zero, buttonType: ButtonType.number),
    ButtonModel(text: MyButtons.equal, buttonType: ButtonType.operator),
    ButtonModel(text: MyButtons.divide, buttonType: ButtonType.operator),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            flex: 1,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: chipList.length,
              itemBuilder: (context, index) {
                return GetX<ScreenController>(builder: (controller) {
                  return MyChip(
                    title: chipList[index],
                    isSelected: controller.selectedIndex.value == index,
                    onTap: () => controller.changeScreen(index),
                  );
                });
              },
            ),
          ),
          Expanded(
            flex: 3,
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
                      controller.symbol.value +
                          ' ' +
                          controller.expression.value,
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
              padding: const EdgeInsets.only(left: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    child: IconButton(
                      icon: Icon(
                        Icons.screen_rotation_rounded,
                        color: CustomColors.numberColor,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemCount: buttons.length,
                itemBuilder: (context, index) {
                  return BuildButton(
                    buttonModel: buttons[index],
                    index: index,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
