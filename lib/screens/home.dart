import 'package:get/get.dart';
import '../screens/screens.dart';
import '../controllers/controllers.dart';
import '../constants/constants.dart';
import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScreenController screenController = Get.find();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (screenController.selectedIndex.value == 1)
          screenController.changeScreen(0);
        else
          return true;
        return false;
      },
      child: Scaffold(
        backgroundColor: CustomColors.bg,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  flex: 1,
                  child: GetX<ScreenController>(builder: (controller) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        for (int i = 0; i < chipList.length; i++)
                          MyChip(
                            title: chipList[i],
                            isSelected: controller.selectedIndex.value == i,
                            onTap: () => controller.changeScreen(i),
                          )
                      ],
                    );
                  }),
                ),
                GetX<ScreenController>(builder: (controller) {
                  return Expanded(
                    flex: 16,
                    child: controller.selectedIndex.value == 0
                        ? CalculatorScreen()
                        : UnitScreen(),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
