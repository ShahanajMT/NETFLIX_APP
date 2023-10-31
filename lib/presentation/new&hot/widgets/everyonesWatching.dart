import 'package:flutter/material.dart';
import '../../../core/Colors/Colors.dart';
import '../../../core/constant/constant.dart';
import '../../home/widgets/custom_icon.dart';
import 'videoWidget.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  const EveryonesWatchingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Friends",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        kHeight,
        Text(
          "Landing the lead in the school musical is a dream come to for jodi, until the presure sends her confidence - and her relationships - into a tailspin.",
          style: TextStyle(
            color: kGreyColor,
          ),
        ),
        kHeight50,
        VideoWidget(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomIcon(
              title: "Share",
              icon: Icons.share,
              iconSize: 25,
              textSize: 15,
            ),
            kWidth,
            CustomIcon(
              title: "My List",
              icon: Icons.add,
              iconSize: 25,
              textSize: 15,
            ),
            kWidth,
            CustomIcon(
              title: "Play",
              icon: Icons.play_arrow,
              iconSize: 25,
              textSize: 15,
            ),
            kWidth,
          ],
        ),
      ],
    );
  }
}
