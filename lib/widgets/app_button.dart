import 'package:flutter/material.dart';
import 'package:trip/widgets/app_text.dart';

class AppButtons extends StatelessWidget {
  final Color color;
  final Color backgroundcolor;
  final Color borderColor;
  final double size;
  final String? text;
  final IconData? icon;
  final bool? isIcon;

  const AppButtons(
      {super.key,
      this.isIcon = false,
      this.text = "0",
      this.icon,
      required this.size,
      required this.color,
      required this.backgroundcolor,
      required this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 1.5),
        borderRadius: BorderRadius.circular(15),
        color: backgroundcolor,
      ),
      child: isIcon == false
          ? Center(
              child: AppText(
                text: text!,
                color: color,
              ),
            )
          : Center(
              child: Icon(
                icon,
                color: color,
              ),
            ),
    );
  }
}
