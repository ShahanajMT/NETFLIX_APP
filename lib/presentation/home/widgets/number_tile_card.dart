// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../core/constant/constant.dart';
import 'main_title_widget.dart';
import 'number_card.dart';

class NumberTitleCard extends StatelessWidget {
  final List<String> postersList;
  const NumberTitleCard({
    Key? key,
    required this.postersList,
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
        const MainTitleWidget(title: 'Top 10 Tv Shows in India Today'),
        kHeight,
        LimitedBox(
          maxHeight: screenHeight * 0.29,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (ctx, index) {
              return NumberCard(
                index: index,
                imageUrl: postersList[index],
                screenHeight: screenHeight,
                screenWidth: screenWidth,
              );
            },
            separatorBuilder: (ctx, index) {
              return kWidth;
            },
            itemCount: postersList.length,
          ),
        )
      ],
    );
  }
}
