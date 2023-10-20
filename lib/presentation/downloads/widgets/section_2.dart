//!SECTION2 -> START
import 'package:flutter/material.dart';
import 'package:netflix_app/presentation/downloads/widgets/download_image_widget.dart';

import '../../../core/Colors/Colors.dart';
import '../../../core/constant/constant.dart';


class Section2 extends StatelessWidget {
  Section2({super.key});

  //! List of Posters

  final List imageList = [
    "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/b0Ej6fnXAP8fK75hlyi2jKqdhHz.jpg",
    "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/qA5kPYZA7FkVvqcEfJRoOy4kpHg.jpg",
    "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/uQxjZGU6rxSPSMeAJPJQlmfV3ys.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    //! MediaQuery,
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Text(
          'Indroducing Downloads for You!',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: kWhiteColor,
          ),
        ),
        kHeight,
        const Text(
          "We will download a personalised selection of\n movies and shows for you. so there's\n always something to watch on your\n device.",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
        SizedBox(
          width: size.width,
          height: size.width,
          //color: Colors.red,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey.withOpacity(0.5),
                radius: size.width * 0.4,
              ),
              DownloadImageWidget(
                imageList: imageList[0],
                margin: const EdgeInsets.only(left: 170, top: 50),
                angle: 24,
                size: Size(size.width * 0.55, size.width * 0.55),
              ),
              DownloadImageWidget(
                imageList: imageList[1],
                margin: const EdgeInsets.only(right: 170, top: 50),
                angle: -24,
                size: Size(size.width * 0.55, size.width * 0.55),
              ),
              DownloadImageWidget(
                imageList: imageList[2],
                margin: const EdgeInsets.only(bottom: 35, top: 50),
                size: Size(size.width * 0.63, size.width * 0.64),
                radius: 8,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
//! END -> SECTION2