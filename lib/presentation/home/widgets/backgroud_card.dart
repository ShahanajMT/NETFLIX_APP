import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_app/presentation/home/widgets/custom_icon.dart';

import '../../../core/Colors/Colors.dart';
import '../../../core/constant/constant.dart';




class BackgroudCard extends StatelessWidget {
  const BackgroudCard({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: screenHeight * 0.87,
          width: screenWidth * 1,
          //color: Colors.yellow,
          decoration: const BoxDecoration(
            image:
                DecorationImage(image: NetworkImage(kImage), fit: BoxFit.cover),
          ),
        ),
          const Positioned(
          left: 0,
          right: 0,
          bottom: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomIcon(
                title: 'My List',
                icon: Icons.add,
              ),
              _PlayButton(),
              CustomIcon(title: 'Info', icon: Icons.info)
            ],
          ),
        ),
      ],
    );
  }
}



class _PlayButton extends StatelessWidget {
  const _PlayButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {},
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(kWhiteColor),
      ),
      icon: const Icon(
        Icons.play_arrow,
        size: 30,
        color: kBlackColor,
      ),
      label: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7),
        child: Text(
          'Play',
          style: GoogleFonts.montserrat(
            color: kBlackColor,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}