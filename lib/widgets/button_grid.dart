import 'package:flutter/material.dart';
import '../widgets/widgets.dart';
import '../models/models.dart';

class ButtonGrid extends StatelessWidget {
  const ButtonGrid({Key? key, required this.buttons}) : super(key: key);

  final List<ButtonModal> buttons;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
        itemCount: buttons.length,
        itemBuilder: (context, index) {
          return BuildButton(
            buttonModal: buttons[index],
            index: index,
          );
        },
      ),
    );
  }
}
