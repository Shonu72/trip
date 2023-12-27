// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip/cubit/app_cubit.dart';
import 'package:trip/misc/colors.dart';

import 'package:trip/widgets/app_large_text.dart';
import 'package:trip/widgets/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var images = {
    "balloning.png": "Balloning",
    "hiking.png": "Hiking",
    "kayaking.png": "Kayaking",
    "snorkling.png": "Snorkling",
    "tent.png": "Camping",
    "paragliding.png": "Paragliding",
    "climb.png": "Rock Climbing",
    "bike.png": "Mountain Biking",
  };
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(
          Icons.menu,
          color: Colors.black,
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey,
              image: const DecorationImage(
                image: AssetImage("assets/balloning.png"),
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
      body: BlocBuilder<AppCubit, CubitState>(
        builder: (context, state) {
          if (state is LoadedState) {
            var info = state.places;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                Container(
                  padding: const EdgeInsets.only(left: 20),
                  child: AppLargeText(text: "Discover"),
                ),
                const SizedBox(height: 10),
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                        labelPadding:
                            const EdgeInsets.only(left: 20, right: 20),
                        controller: _tabController,
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.grey,
                        isScrollable: true,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicator: CircleTabIndicator(
                            color: AppColors.mainColor, radius: 4),
                        tabs: const [
                          Tab(text: "Places"),
                          Tab(text: "Inspiration"),
                          Tab(text: "Emotions"),
                        ]),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  height: 400,
                  width: double.maxFinite,
                  child: TabBarView(controller: _tabController, children: [
                    ListView.builder(
                      itemCount: info.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            BlocProvider.of<AppCubit>(context)
                                .detailPage(info[index]);
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 10, top: 20),
                            width: 200,
                            height: 400,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: DecorationImage(
                                // image: AssetImage("assets/mountain.jpeg"),
                                image: NetworkImage(
                                    "http://mark.bslmeiyu.com/uploads/${info[index].img}"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    Text("Coming Soon"),
                    Text("Coming Soon"),
                  ]),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppLargeText(
                        text: "Explore more",
                        size: 22,
                      ),
                      AppText(
                        text: "See all",
                        color: AppColors.textColor1,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  height: 130,
                  // width: double.maxFinite,
                  margin: const EdgeInsets.only(left: 20),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (_, index) {
                        return Container(
                          height: double.maxFinite,
                          margin: const EdgeInsets.only(right: 20),
                          child: Column(
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "assets/${images.keys.elementAt(index)}"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              AppText(
                                text: images.values.elementAt(index),
                                color: AppColors.textColor2,
                              )
                            ],
                          ),
                        );
                      }),
                ),

                // Container(
                //   height: 130,
                //   width: double.maxFinite,
                //   margin: const EdgeInsets.only(left: 20),
                //   child: ListView.builder(
                //       scrollDirection: Axis.horizontal,
                //       itemCount: 4,
                //       itemBuilder: (_, index) {
                //         return Container(
                //           height: double.maxFinite,
                //           margin: const EdgeInsets.only(right: 20),
                //           child: Column(
                //             children: [
                //               Container(
                //                 width: 80,
                //                 height: 80,
                //                 decoration: BoxDecoration(
                //                   borderRadius: BorderRadius.circular(20),
                //                   color: Colors.white,
                //                   image: DecorationImage(
                //                     image: AssetImage(
                //                         "assets/${images.keys.elementAt(index + 4)}"),
                //                     fit: BoxFit.cover,
                //                   ),
                //                 ),
                //               ),
                //               const SizedBox(height: 10),
                //               AppText(
                //                 text: images.values.elementAt(index + 4),
                //                 color: AppColors.textColor2,
                //               )
                //             ],
                //           ),
                //         );
                //       }),
                // ),
              ],
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;
  CircleTabIndicator({
    required this.color,
    required this.radius,
  });

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;
  _CirclePainter({
    required this.color,
    required this.radius,
  });
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true;
    final Offset circleOffset = offset +
        Offset(configuration.size!.width / 2 - radius / 2,
            configuration.size!.height - radius);
    canvas.drawCircle(circleOffset, radius, paint);
  }
}
