//! POSTERS WIDGET
import 'package:flutter/material.dart';

import '../../../core/Colors/Colors.dart';
import '../../../core/constant/constant.dart';

class VideoWidget extends StatelessWidget {
  const VideoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        SizedBox(
          height: size.height * 0.25,
          width: size.width * 1,
          child: Image.network(
            newandHotTempImage,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: CircleAvatar(
            backgroundColor: kBlackColor.withOpacity(0.5),
            radius: 25,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.volume_off,
                color: kWhiteColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}