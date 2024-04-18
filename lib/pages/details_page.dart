import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip/cubit/app_cubit.dart';
import 'package:trip/misc/colors.dart';
import 'package:trip/widgets/app_button.dart';
import 'package:trip/widgets/app_large_text.dart';
import 'package:trip/widgets/app_text.dart';
import 'package:trip/widgets/responsive_button.dart';

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
    return BlocBuilder<AppCubit, CubitState>(
      builder: (context, state) {
        DetailedState detail = state as DetailedState;
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
                        // image: AssetImage("assets/mountain.jpeg"),
                        image: NetworkImage(
                            "http://mark.bslmeiyu.com/uploads/${detail.place.img}"),
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
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          BlocProvider.of<AppCubit>(context).goHome();
                        },
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 320,
                  child: Container(
                    padding:
                        const EdgeInsets.only(top: 20, left: 20, right: 20),
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
                              text: detail.place.name,
                              color: Colors.black.withOpacity(0.8),
                            ),
                            AppLargeText(
                                text: "\$${detail.place.price}",
                                color: AppColors.textColor1),
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
                              text: detail.place.location,
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
                                  color: index < detail.place.stars
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
                        ),
                        const SizedBox(height: 20),
                        AppLargeText(
                          text: "Description",
                          color: Colors.black.withOpacity(0.8),
                          size: 24,
                        ),
                        const SizedBox(height: 10),
                        AppText(text: detail.place.description)
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppButtons(
                        size: 50,
                        color: AppColors.textColor2,
                        backgroundcolor: Colors.white,
                        borderColor: AppColors.textColor2,
                        icon: Icons.favorite,
                        isIcon: true,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                          style: ButtonStyle(
                              minimumSize: MaterialStateProperty.all<Size>(
                                  const Size(200, 50)),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0))),
                              backgroundColor: MaterialStateProperty.all(
                                  AppColors.mainColor)),
                          onPressed: () {
                            BlocProvider.of<AppCubit>(context).paymentPage();
                          },
                          child: const Text("Book Trip Now",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20))),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
