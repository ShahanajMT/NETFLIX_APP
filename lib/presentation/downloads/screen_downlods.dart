// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:netflix_app/presentation/common_widgets/app_bar_widgets.dart';

import 'widgets/section_1.dart';
import 'widgets/section_2.dart';
import 'widgets/section_3.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});

  //! Widgets DOWNLOAD SCREEN
  final List _widgets = [
    const Section1(),
    const Section2(),
    const Section3(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
        child: Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBarWidgets(
              title: 'Downloads',
            ),
          ),
          body: SafeArea(
              child: ListView.separated(
            padding: const EdgeInsets.all(8),
            itemBuilder: (ctx, index) => _widgets[index],
            separatorBuilder: (ctx, index) => const SizedBox(height: 27),
            itemCount: _widgets.length,
          )),
        ),
      ),
    );
  }
}

//! APIKEY
//dcd597e33ef21820c17300400761762c
