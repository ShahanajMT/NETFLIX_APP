import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/Colors/Colors.dart';

class CustomIcon extends StatelessWidget {
  final String title;
  final IconData icon;
  const CustomIcon({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            icon,
            size: 30,
            color: kWhiteColor,
          ),
        ),
        Text(
          title,
          style: GoogleFonts.montserrat(
            fontSize: 18,
            fontWeight: FontWeight.w300,
          ),
        )
      ],
    );
  }
}