import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/models.dart';
import '../controllers/controllers.dart';
import '../constants/constants.dart';
import '../widgets/widgets.dart';

class UnitScreen extends StatelessWidget {
  UnitScreen({Key? key}) : super(key: key);

  final UnitController unitController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          flex: 2,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: unitList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final String name = unitNames[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: GetX<UnitController>(builder: (controller) {
                  return MyChip(
                    title: name,
                    isSelected: index == controller.selectedIndex.value,
                    onTap: () => controller.changeUnitType(index),
                  );
                }),
              );
            },
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 16),
                child: GetX<UnitController>(builder: (controller) {
                  return DropdownButton<UnitModal>(
                    dropdownColor: CustomColors.lightShadow,
                    value: controller.firstUnit().value,
                    items: controller
                        .currentUnitType()
                        .map<DropdownMenuItem<UnitModal>>(
                            (UnitModal unitModal) {
                      return DropdownMenuItem(
                        value: unitModal,
                        child: Text(
                          '${unitModal.name} (${unitModal.unit})',
                        ),
                      );
                    }).toList(),
                    underline: Container(
                      height: 0,
                    ),
                    style: TextStyle(
                      color: CustomColors.numberColor,
                    ),
                    onChanged: (UnitModal? unitModal) {
                      controller.selectUnit(unitModal!, changeFirst: true);
                    },
                  );
                }),
              ),
              SizedBox(),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GetX<UnitController>(builder: (controller) {
              return Text(
                '1 ${controller.firstUnit().value.unit}',
                style: TextStyle(color: Colors.white),
              );
            }),
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 16),
                child: GetX<UnitController>(builder: (controller) {
                  return DropdownButton<UnitModal>(
                    dropdownColor: CustomColors.lightShadow,
                    value: controller.secondUnit().value,
                    items: controller
                        .currentUnitType()
                        .map<DropdownMenuItem<UnitModal>>(
                            (UnitModal unitModal) {
                      return DropdownMenuItem(
                        value: unitModal,
                        child: Text(
                          '${unitModal.name} (${unitModal.unit})',
                        ),
                      );
                    }).toList(),
                    underline: Container(
                      height: 0,
                    ),
                    style: TextStyle(
                      color: CustomColors.numberColor,
                    ),
                    onChanged: (UnitModal? unitModal) {
                      controller.selectUnit(unitModal!);
                    },
                  );
                }),
              ),
              SizedBox(),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GetX<UnitController>(builder: (controller) {
              return Text(
                '1 ${controller.secondUnit().value.unit}',
                style: TextStyle(color: Colors.white),
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
              children: [
                SizedBox(),
                GestureDetector(
                  child: Icon(
                    Icons.backspace_rounded,
                    color: CustomColors.clearColor,
                  ),
                  onTap: () => {},
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 17,
          child:
              ButtonGrid(buttons: unitButtons, crossAxisCount: 3, isUnit: true),
        ),
      ],
    );
  }
}
