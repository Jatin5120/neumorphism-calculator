import '../constants/constants.dart';
import 'package:flutter/material.dart';

class MyChip extends StatelessWidget {
  final String? title;
  final bool? isSelected;
  final VoidCallback? onTap;

  const MyChip({Key? key, this.title, this.isSelected, this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: CustomColors.bg,
          boxShadow: isSelected ?? false
              ? Utilities.innerShadow
              : Utilities.outerShadow,
          borderRadius: BorderRadius.circular(20.0),
          gradient: isSelected ?? false
              ? LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                      CustomColors.darkShadow,
                      CustomColors.bg,
                      CustomColors.bg,
                      CustomColors.lightShadow,
                    ],
                  stops: [
                      0.05,
                      0.2,
                      0.8,
                      0.95,
                    ])
              : null,
        ),
        alignment: Alignment.center,
        child: Text(
          title ?? "",
          style: TextStyle(
            color: isSelected!
                ? CustomColors.clearColor
                : CustomColors.numberColor,
          ),
        ),
      ),
    );
  }
}
