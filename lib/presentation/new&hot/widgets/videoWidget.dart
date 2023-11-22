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
            // to check the image is getting or not
            loadingBuilder: (BuildContext _, Widget child, ImageChunkEvent? progress) {
              if (progress == null) {
                return child;
              } else {
                return const Center(child: CircularProgressIndicator(strokeWidth: 2,),);
              }
            },
            errorBuilder: (BuildContext _, Object a, StackTrace? trace) {
              return const Center(child: Icon(Icons.wifi,color: kWhiteColor,),);
            },
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
