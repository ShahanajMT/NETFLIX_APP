// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/Colors/Colors.dart';

class CustomIcon extends StatelessWidget {
  final String title;
  final IconData icon;
  final double iconSize;
  final double textSize;
  const CustomIcon({
    Key? key,
    required this.title,
    required this.icon,
   this.iconSize = 30,
     this.textSize = 18,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            icon,
            size: iconSize,
            color: kWhiteColor,
          ),
        ),
        Text(
          title,
          style: GoogleFonts.montserrat(
            fontSize: textSize,
            fontWeight: FontWeight.w300,
          ),
        )
      ],
    );
  }
}
