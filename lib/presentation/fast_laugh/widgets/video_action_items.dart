import 'package:flutter/material.dart';

import '../../../core/Colors/Colors.dart';

class VideoActionWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const VideoActionWidget({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      child: Column(
        children: [
          Icon(icon,color: kWhiteColor, size: 30,),
          Text(title,style: const TextStyle(fontSize: 16, ),),
        ],
      ),
    );
  }
}