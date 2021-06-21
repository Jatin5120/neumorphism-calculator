import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../widgets/widgets.dart';

class UnitScreen extends StatelessWidget {
  const UnitScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          flex: 10,
          child: ButtonGrid(buttons: unitButtons),
        ),
      ],
    );
  }
}
