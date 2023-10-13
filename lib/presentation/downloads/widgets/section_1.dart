//!SECTION1
import 'package:flutter/material.dart';

import '../../../core/Colors/Colors.dart';
import '../../../core/constant/constant.dart';

class Section1 extends StatelessWidget {
  const Section1({super.key});

  @override
  Widget build(BuildContext context) {
    //return const _SmartDownloads();
    return const Row(
      children: [
        kWidth,
        Icon(
          Icons.settings,
          color: kWhiteColor,
        ),
        kWidth,
        Text(
          'Smart Downloads',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: kWhiteColor),
        ),
      ],
    );
  }
}

//! END -> SECTION1