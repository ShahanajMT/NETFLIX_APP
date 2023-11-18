// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';



class VideoActionWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color iconColor;
  const VideoActionWidget({
    Key? key,
    required this.icon,
    required this.title,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          Icon(
            icon,
            color: iconColor,
            size: 30,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
