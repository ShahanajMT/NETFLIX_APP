import 'package:flutter/material.dart';
import 'package:netflix_app/core/Colors/Colors.dart';
import '../../core/constant/constant.dart';
import 'widgets/comingSoonWidget.dart';
import 'widgets/everyonesWatching.dart';

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
              preferredSize: const Size.fromHeight(93),
              child: AppBar(
                title: const Text(
                  'New & Hot',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: kWhiteColor,
                  ),
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
                  indicatorColor: Colors.transparent,
                  indicatorPadding:
                      const EdgeInsets.symmetric(horizontal: -15, vertical: 7),
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
                  _buildComingSoon(),
                  _buildEveryoncesWatching(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //!TABBAR VIEWS
  Widget _buildComingSoon() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (BuildContext context, index) => const ComingSoonWidget(),
    );
  }

  Widget _buildEveryoncesWatching() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (BuildContext context, index) =>
          const EveryonesWatchingWidget(),
    );
  }
}
