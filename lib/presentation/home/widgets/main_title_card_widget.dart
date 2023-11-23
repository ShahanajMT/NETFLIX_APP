// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../core/constant/constant.dart';
import 'main_home_card_widget.dart';
import 'main_title_widget.dart';

class MainTitleCard extends StatelessWidget {
  final String title;
  final List<String> posterList;
  const MainTitleCard({
    Key? key,
    required this.title,
    required this.posterList,
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
                  screenHeight: screenHeight, screenWidth: screenWidth, imageUrl: posterList[index],);
            },
            separatorBuilder: (ctx, index) {
              return kWidth;
            },
            itemCount: posterList.length,
          ),
        )
      ],
    );
  }
}
