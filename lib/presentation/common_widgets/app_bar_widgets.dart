// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:netflix_app/core/Colors/Colors.dart';

import 'package:netflix_app/core/constant/constant.dart';

class AppBarWidgets extends StatelessWidget {
  const AppBarWidgets({
    Key? key,
    required this.title,
  }) : super(key: key);
  // AppBar 
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         Text(
          title,
          style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        const Icon(
          Icons.cast,
          color: Colors.white,
          size: 30,
        ),
        kWidth,
        InkWell(
          onTap: () {
            
          },
          child: const SizedBox(
            height: 30,
            width: 30,
            child:   Icon(Icons.person_2, color: kWhiteColor, size: 30,),
            //color: Colors.red,
          ),
        ),
        kWidth,
      ],
    );
  }
}
