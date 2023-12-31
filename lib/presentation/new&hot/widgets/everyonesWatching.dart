// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../core/Colors/Colors.dart';
import '../../../core/constant/constant.dart';
import '../../home/widgets/custom_icon.dart';
import 'videoWidget.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  // Data we needed
  final String posterPath;
  final String movieName;
  final String description;
  const EveryonesWatchingWidget({
    Key? key,
    required this.posterPath,
    required this.movieName,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          movieName,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        kHeight,
        Text(
          description,
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: kGreyColor,
          ),
        ),
        kHeight50,
        VideoWidget(url: posterPath,),
        const Row(
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
