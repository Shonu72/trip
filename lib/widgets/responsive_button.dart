import 'package:flutter/material.dart';
import 'package:trip/misc/colors.dart';
import 'package:trip/widgets/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  final double? width;
  final bool? isResponsive;
  const ResponsiveButton({
    Key? key,
    this.width = 120,
    this.isResponsive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isResponsive == true ? double.maxFinite : width,
        height: 55,
        decoration: BoxDecoration(
          color: AppColors.mainColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
            mainAxisAlignment: isResponsive == true
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.center,
            children: [
              isResponsive == true
                  ? Container(
                      padding: const EdgeInsets.only(left: 30),
                      child: const AppText(
                          text: "Book Trip Now", color: Colors.white))
                  : Container(),
              Image.asset("assets/button-one.png"),
            ]),
      ),
    );
  }
}
