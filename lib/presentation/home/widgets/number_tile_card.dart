import 'package:flutter/material.dart';

import '../../../core/constant/constant.dart';
import 'main_title_widget.dart';
import 'number_card.dart';

class NumberTitleCard extends StatelessWidget {
  const NumberTitleCard({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MainTitleWidget(
            title: 'Top 10 Tv Shows in India Today'),
        kHeight,
        LimitedBox(
          maxHeight: screenHeight * 0.29,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (ctx, index) {
              return NumberCard(index: index,
                  screenHeight: screenHeight,
                  screenWidth: screenWidth);
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