// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:netflix_app/presentation/home/widgets/custom_icon.dart';

import '../../../core/Colors/Colors.dart';
import '../../../core/constant/constant.dart';

class BackgroudCard extends StatelessWidget {
  //final String backgroundImage;
  const BackgroudCard({
    Key? key,
    //required this.backgroundImage,
    required this.screenHeight,
    required this.screenWidth,
  }) : super(key: key);

  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: screenHeight * 0.87,
          width: screenWidth * 1,
          
          decoration: const BoxDecoration(
            //color: Colors.yellow,
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
  const _PlayButton();

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
