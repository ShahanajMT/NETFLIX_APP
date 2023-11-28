// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:netflix_app/core/Colors/Colors.dart';

import '../../../core/constant/constant.dart';

class NumberCard extends StatelessWidget {
  final double screenHeight;
  final double screenWidth;
  final int index;
  final String imageUrl;
  const NumberCard({
    Key? key,
    required this.screenHeight,
    required this.screenWidth,
    required this.index,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            SizedBox(
              height: screenHeight * 0.29,
              width: screenWidth * 0.12,
            ),
            Container(
              height: screenHeight * 0.29,
              width: screenWidth * 0.4,
              //color: Colors.red,
              decoration: BoxDecoration(
                borderRadius: kRadius8,
                image:  DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      imageUrl,),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          left: 12,
          bottom: -30,
          child: BorderedText(
            strokeWidth: 5,
            strokeColor: Colors.grey.withOpacity(1),
            child: Text(
              "${index + 1}",
              style: GoogleFonts.montserrat(
                fontSize: 150,
                fontWeight: FontWeight.bold,
                color: kBlackColor,
                decoration: TextDecoration.none,
                decorationColor: kBlackColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
