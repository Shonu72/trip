import 'package:flutter/material.dart';
import 'package:trip/misc/colors.dart';

class ResponsiveButton extends StatelessWidget {
  double? width;
  bool? isResponsive;
  ResponsiveButton({
    Key? key,
    this.width,
    this.isResponsive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.mainColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Image.asset("assets/button-one.png")]),
    );
  }
}
