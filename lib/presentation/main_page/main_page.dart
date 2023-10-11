import 'package:flutter/material.dart';
import 'package:netflix_app/core/Colors/Colors.dart';
import 'package:netflix_app/presentation/main_page/widgets/bottom_nav.dart';

import '../downloads/screen_downlods.dart';
import '../fast_laugh/screen_fast_laugh.dart';
import '../home/screen_home.dart';
import '../new&hot/screen_new_hot.dart';
import '../search/screen_search.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  //! List of pages
  final _pages = [
    ScreenHome(),
    ScreenNewAndHot(),
    ScreenFastLaugh(),
    ScreenSearch(),
    ScreenDownloads()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: backgroundColor,
      body: ValueListenableBuilder(
        valueListenable: indexChangeNotifier,
        builder: (context, int index, _) {
          return _pages[index];
        },
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
