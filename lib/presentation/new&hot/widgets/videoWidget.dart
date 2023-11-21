// ignore_for_file: public_member_api_docs, sort_constructors_first
//! POSTERS WIDGET
import 'package:flutter/material.dart';

import '../../../core/Colors/Colors.dart';


class VideoWidget extends StatelessWidget {
  final String url;
  const VideoWidget({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        SizedBox(
          height: size.height * 0.25,
          width: size.width * 1,
          child: Image.network(
            url, 
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
