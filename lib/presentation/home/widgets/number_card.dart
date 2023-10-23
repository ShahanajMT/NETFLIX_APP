// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/constant.dart';
import '../screen_home.dart';

class NumberCard extends StatelessWidget {
  final double screenHeight;
  final double screenWidth;
  final int index;
  const NumberCard({
    Key? key,
    required this.screenHeight,
    required this.screenWidth,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            SizedBox(
              height: screenHeight * 0.29,
              width: screenWidth * 0.12 ,
            ),
            Container(
              height: screenHeight * 0.29,
              width: screenWidth * 0.4,
              //color: Colors.red,
              decoration: BoxDecoration(
                borderRadius: kRadius8,
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(imageUrl),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          left: 12,
          bottom: 0,
          child: BorderedText(
            strokeWidth: 8,
            child: Text(
              "${index + 1}",
              style: const TextStyle(fontSize: 140, decoration: TextDecoration.none, decorationColor: Colors.red),
            ),
          ),
        ),
      ],
    );
  }
}
