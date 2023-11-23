// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../core/constant/constant.dart';

class MianHomeCard extends StatelessWidget {
  final String imageUrl;

  const MianHomeCard({
    Key? key,
    required this.imageUrl,
    required this.screenHeight,
    required this.screenWidth,
  }) : super(key: key);

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
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(imageUrl),
        ),
      ),
    );
  }
}
