// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:netflix_app/core/Colors/Colors.dart';
import 'package:netflix_app/core/constant/constant.dart';

import 'search_title.dart';

const imageUrl =
    'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/b0Ej6fnXAP8fK75hlyi2jKqdhHz.jpg';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTitleText(title: 'Top Searches',),
        kHeight,
        //!
        Expanded(
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (ctx, index) => const TopSearchItemTile(),
              separatorBuilder: (ctx, index) => kHeight20,
              itemCount: 10),
        )
      ],
    );
  }
}



class TopSearchItemTile extends StatelessWidget {
  const TopSearchItemTile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.35,
          height: 65,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            image: const DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageUrl),
            ),
          ),
          //color: Colors.red,
        ),
        kWidth,
        const Expanded(
          
          child: Text(
            
            'Movie Name',
            style: TextStyle(
                fontSize: 17, fontWeight: FontWeight.bold, color: kWhiteColor),
          ),
        ),

        InkWell(
          onTap: () {

          },
          child: const CircleAvatar(
            backgroundColor: kWhiteColor,
            radius: 25,
            child: CircleAvatar(
              backgroundColor: kBlackColor,
              radius: 23,
              child: Icon(Icons.play_arrow,color: kWhiteColor,),
            ),
          ),
        ),
      ],
    );
  }
}
