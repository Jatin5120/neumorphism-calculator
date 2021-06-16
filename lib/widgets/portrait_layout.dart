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
    ButtonModel(text: 'AC', buttonType: ButtonType.clear),
    ButtonModel(text: '←', buttonType: ButtonType.clear),
    ButtonModel(text: 'xⁿ', buttonType: ButtonType.operator),
    ButtonModel(text: '%', buttonType: ButtonType.operator),
    ButtonModel(text: '7', buttonType: ButtonType.number),
    ButtonModel(text: '8', buttonType: ButtonType.number),
    ButtonModel(text: '9', buttonType: ButtonType.number),
    ButtonModel(text: '+', buttonType: ButtonType.operator),
    ButtonModel(text: '4', buttonType: ButtonType.number),
    ButtonModel(text: '5', buttonType: ButtonType.number),
    ButtonModel(text: '6', buttonType: ButtonType.number),
    ButtonModel(text: '-', buttonType: ButtonType.operator),
    ButtonModel(text: '1', buttonType: ButtonType.number),
    ButtonModel(text: '2', buttonType: ButtonType.number),
    ButtonModel(text: '3', buttonType: ButtonType.number),
    ButtonModel(text: '×', buttonType: ButtonType.operator),
    ButtonModel(text: '.', buttonType: ButtonType.number),
    ButtonModel(text: '0', buttonType: ButtonType.number),
    ButtonModel(text: '=', buttonType: ButtonType.operator),
    ButtonModel(text: '/', buttonType: ButtonType.operator),
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
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.menu_rounded,
                    color: CustomColors.numberColor,
                  ),
                  onPressed: () {},
                ),
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
              ],
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
                    Text(
                      controller.history.value + ' ' + controller.symbol.value,
                      style: TextStyle(
                        fontSize: controller.isCompleted.value ? 28.0 : 48.0,
                        color: CustomColors.numberColor,
                      ),
                    ),
                    Text(
                      controller.expression.value,
                      style: TextStyle(
                        fontSize: controller.isCompleted.value ? 48.0 : 28.0,
                        color: CustomColors.numberColor,
                      ),
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
                  return MyButton(
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
