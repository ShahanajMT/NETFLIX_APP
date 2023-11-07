import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/Colors/Colors.dart';
import '../../../core/constant/constant.dart';
import '../../home/widgets/custom_icon.dart';
import 'videoWidget.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        //! For Date
        SizedBox(
          // width: size.width * 0.132,
          // height: size.height * 0.6,
          width: 50,
          height: 450,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "FEB",
                style: GoogleFonts.montserrat(
                  color: kGreyColor.withOpacity(0.83),
                  fontSize: 17,
                ),
              ),
              Text(
                "11",
                style: GoogleFonts.montserrat(
                  color: kWhiteColor.withOpacity(0.83),
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 4,
                ),
              ),
            ],
          ),
        ),
        //! For Details of Film
        SizedBox(
          // width: size.width * 0.84,
          // height: size.height * 0.6,
          width: size.width - 70,
          height: 450,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //! For Posters
              const VideoWidget(),
              //! TitleText
              Row(
                children: [
                  Text(
                    "Tall Girl 2",
                    style: GoogleFonts.montserrat(
                        fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  const Row(
                    children: [
                      CustomIcon(
                        title: "Remind Me",
                        icon: Icons.notifications_active,
                        iconSize: 22,
                        textSize: 16,
                      ),
                      kWidth,
                      CustomIcon(
                        title: "Info",
                        icon: Icons.info,
                        iconSize: 22,
                        textSize: 16,
                      ),
                    ],
                  ),
                ],
              ),
              kHeight,
              const Text('Coming on Friday'),
              kHeight,
              const Text(
                "Tall Girl 2",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              kHeight,
              const Text(
                "Landing the lead in the school musical is a dream come to for jodi, until the presure sends her confidence - and her relationships - into a tailspin.",
                style: TextStyle(
                  color: kGreyColor,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
