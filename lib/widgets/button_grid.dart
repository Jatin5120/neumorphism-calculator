import 'package:flutter/material.dart';
import '../models/models.dart';
import '../widgets/widgets.dart';

class ButtonGrid extends StatelessWidget {
  const ButtonGrid({
    Key? key,
    required this.buttons,
    required this.crossAxisCount,
    this.isUnit = false,
  }) : super(key: key);

  final List<ButtonModal> buttons;
  final int crossAxisCount;
  final bool isUnit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
        ),
        itemCount: buttons.length,
        itemBuilder: (context, index) {
          return BuildButton(
            buttonModal: buttons[index],
            index: index,
            isUnit: isUnit,
          );
        },
      ),
    );
  }
}
