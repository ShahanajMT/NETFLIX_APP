import 'package:flutter/material.dart';
import 'package:netflix_app/core/Colors/Colors.dart';
import 'package:netflix_app/presentation/common_widgets/app_bar_widgets.dart';

import '../../core/constant/constant.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(100),
              child: AppBar(
                title: const Text(
                  'New & Hot',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      color: kWhiteColor),
                ),
                actions: [
                  const Icon(
                    Icons.cast,
                    color: Colors.white,
                    size: 30,
                  ),
                  kWidth,
                  InkWell(
                    onTap: () {},
                    child: const SizedBox(
                      height: 30,
                      width: 30,
                      child: Icon(
                        Icons.person_2,
                        color: kWhiteColor,
                        size: 30,
                      ),
                    ),
                  ),
                ],
                bottom: TabBar(
                  //dividerColor: Colors.transparent,
                  indicatorPadding:
                      const EdgeInsets.symmetric(horizontal: -28, vertical: 5),
                  padding: const EdgeInsets.only(bottom: 10, top: 7),
                  isScrollable: true,
                  labelColor: kBlackColor,
                  unselectedLabelColor: kWhiteColor,
                  labelStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  indicator: BoxDecoration(
                      color: kWhiteColor, borderRadius: kRadius30),
                  tabs: const [
                    Tab(
                      text: '🍿 Coming Soon',
                    ),
                    Tab(
                      text: "👀 Everyone's Watching",
                    ),
                  ],
                ),
              ),
            ),
            body: SafeArea(
              child: TabBarView(
                children: [
                  _buildTabBarView('Coming Soon'),
                  _buildTabBarView('Everyones Watching'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


}

_buildTabBarView(name) {
  return Center(child: Text('$name'),);
}
