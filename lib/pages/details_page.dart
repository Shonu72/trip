import 'package:flutter/material.dart';
import 'package:trip/misc/colors.dart';
import 'package:trip/widgets/app_button.dart';
import 'package:trip/widgets/app_large_text.dart';
import 'package:trip/widgets/app_text.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int gottenStar = 4;
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 350,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/mountain.jpeg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: 50,
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Positioned(
              top: 320,
              child: Container(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                width: MediaQuery.of(context).size.width,
                height: 600,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppLargeText(
                          text: "Manali",
                          color: Colors.black.withOpacity(0.8),
                        ),
                        AppLargeText(
                            text: "₹ 6999", color: AppColors.textColor1),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(
                          Icons.location_pin,
                          color: AppColors.mainColor,
                        ),
                        const SizedBox(width: 5),
                        AppText(
                          text: "Himachal Pradesh",
                          color: AppColors.textColor1,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(5, (index) {
                            return Icon(
                              Icons.star,
                              color: index < gottenStar
                                  ? AppColors.starColor
                                  : AppColors.textColor1,
                            );
                          }),
                        ),
                        const SizedBox(width: 5),
                        AppText(
                          text: " 4.0 (110 Reviews)",
                          color: AppColors.textColor2,
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    AppLargeText(
                      text: "People",
                      color: Colors.black.withOpacity(0.8),
                      size: 24,
                    ),
                    const SizedBox(height: 5),
                    AppText(
                      text: "Number of people in your group",
                      color: AppColors.mainTextColor,
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      children: List.generate(5, (index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.only(right: 5),
                            child: AppButtons(
                              size: 55,
                              color: selectedIndex == index
                                  ? Colors.white
                                  : AppColors.bigTextColor,
                              backgroundcolor: selectedIndex == index
                                  ? AppColors.mainColor
                                  : AppColors.buttonBackground,
                              borderColor: selectedIndex == index
                                  ? AppColors.mainColor
                                  : AppColors.buttonBackground,
                              text: (index + 1).toString(),
                            ),
                          ),
                        );
                      }),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
