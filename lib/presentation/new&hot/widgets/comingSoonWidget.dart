// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/Colors/Colors.dart';
import '../../../core/constant/constant.dart';
import '../../home/widgets/custom_icon.dart';
import 'videoWidget.dart';

class ComingSoonWidget extends StatelessWidget {
  //Data we needed
  final String id;
  final String month;
  final String day;
  final String posterPath;
  final String movieName;
  final String description;
  const ComingSoonWidget({
    Key? key,
    required this.id,
    required this.month,
    required this.day,
    required this.posterPath,
    required this.movieName,
    required this.description,
  }) : super(key: key);
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
                month,
                style: GoogleFonts.montserrat(
                  color: kGreyColor.withOpacity(0.83),
                  fontSize: 17,
                ),
              ),
              Text(
                day,
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
               VideoWidget(url: posterPath,),
              //! TitleText
              Row(
                children: [
                  Expanded(
                    child: Text(
                      movieName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.montserrat(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  //const Spacer(),
                  const CustomIcon(
                    title: "Remind Me",
                    icon: Icons.notifications_active,
                    iconSize: 22,
                    textSize: 16,
                  ),
                  kWidth,
                  const CustomIcon(
                    title: "Info",
                    icon: Icons.info,
                    iconSize: 22,
                    textSize: 16,
                  ),
                ],
              ),
              kHeight,
              Text('Coming on $day $month'),
              kHeight,
              Text(
                movieName,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              kHeight,
              Text(
                description,
                maxLines: 4,
                style: const TextStyle(
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
