import 'package:flutter/material.dart';

import '../../../core/constant/constant.dart';

import 'main_title_widget.dart';
import 'main_home_card_widget.dart';

class MainTitleCard extends StatelessWidget {
  final String title;
  const MainTitleCard({
    Key? key,
    required this.title,
    required this.screenHeight,
    required this.screenWidth,
  }) : super(key: key);

  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         MainTitleWidget(title: title),
        kHeight,
        LimitedBox(
          maxHeight: screenHeight * 0.29,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (ctx, index) {
              return MianHomeCard(
                  screenHeight: screenHeight, screenWidth: screenWidth);
            },
            separatorBuilder: (ctx, index) {
              return kWidth;
            },
            itemCount: 10,
          ),
        )
      ],
    );
  }
}