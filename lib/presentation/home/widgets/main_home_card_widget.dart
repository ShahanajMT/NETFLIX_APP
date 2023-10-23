import 'package:flutter/material.dart';

import '../../../core/constant/constant.dart';
import '../screen_home.dart';

class MianHomeCard extends StatelessWidget {
  const MianHomeCard({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}



