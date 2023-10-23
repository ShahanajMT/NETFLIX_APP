// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:netflix_app/core/constant/constant.dart';



import 'widgets/main_title_card_widget.dart';

import 'widgets/number_tile_card.dart';

const imageUrl =
    "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/b0Ej6fnXAP8fK75hlyi2jKqdhHz.jpg";

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: ListView(
            children: [
              MainTitleCard(
                title: 'Released in the past year',
                screenHeight: screenHeight,
                screenWidth: screenWidth,
              ),
              kHeight,
              MainTitleCard(
                title: 'Trending Now',
                screenHeight: screenHeight,
                screenWidth: screenWidth,
              ),
              kHeight,
              //! NUMBER CARD
              NumberTitleCard(screenHeight: screenHeight, screenWidth: screenWidth),
              kHeight,

              //! END
              MainTitleCard(
                  title: 'Tense Dramas',
                  screenHeight: screenHeight,
                  screenWidth: screenWidth),
              kHeight,
              MainTitleCard(
                  title: 'South Indian Cinemas',
                  screenHeight: screenHeight,
                  screenWidth: screenWidth)
            ],
          ),
        ),
      ),
    );
  }
}


