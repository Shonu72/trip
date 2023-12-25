// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:trip/misc/colors.dart';

import 'package:trip/widgets/app_large_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 60,
              left: 20,
            ),
            child: Row(
              children: [
                Icon(Icons.menu, size: 30, color: Colors.black),
                Expanded(child: Container()),
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.only(left: 20),
            child: AppLargeText(text: "Discover"),
          ),
          const SizedBox(height: 20),
          Container(
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                  labelPadding: EdgeInsets.only(left: 20, right: 20),
                  controller: _tabController,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  isScrollable: true,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator:
                      CircleTabIndicator(color: AppColors.mainColor, radius: 4),
                  tabs: [
                    Tab(text: "Places"),
                    Tab(text: "Inspiration"),
                    Tab(text: "Emotions"),
                  ]),
            ),
          ),
          Container(
            height: 300,
            width: double.maxFinite,
            child: TabBarView(controller: _tabController, children: [
              Text("1"),
              Text("2"),
              Text("3"),
            ]),
          )
        ],
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
