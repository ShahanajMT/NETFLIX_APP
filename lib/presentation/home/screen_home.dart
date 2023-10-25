// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:netflix_app/core/constant/constant.dart';

import '../../core/Colors/Colors.dart';
import 'widgets/backgroud_card.dart';
import 'widgets/main_title_card_widget.dart';
import 'widgets/number_tile_card.dart';

const imageUrl =
    "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/b0Ej6fnXAP8fK75hlyi2jKqdhHz.jpg";

//! To Show the scrollDirection -> Reverse/Forword/Idle
ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: scrollNotifier,
        builder: (BuildContext context, index, _) {
          return SafeArea(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: NotificationListener<UserScrollNotification>(
                onNotification: (notification) {
                  final ScrollDirection direction = notification.direction;
                  print(direction);
                  if (direction == ScrollDirection.reverse) {
                    scrollNotifier.value = false;
                  } else if (direction == ScrollDirection.forward) {
                    scrollNotifier.value = true;
                  }
                  return true;
                },
                child: Stack(
                  children: [
                    ListView(
                      //shrinkWrap: true,
                      children: [
                        BackgroudCard(
                          screenHeight: screenHeight,
                          screenWidth: screenWidth,
                        ),
                        kHeight,
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
                        NumberTitleCard(
                          screenHeight: screenHeight,
                          screenWidth: screenWidth,
                        ),
                        kHeight,

                        //! END
                        MainTitleCard(
                          title: 'Tense Dramas',
                          screenHeight: screenHeight,
                          screenWidth: screenWidth,
                        ),
                        kHeight,
                        MainTitleCard(
                          title: 'South Indian Cinemas',
                          screenHeight: screenHeight,
                          screenWidth: screenWidth,
                        )
                      ],
                    ),
                    //!To Show the hide appBar
                    // scrollNotifier.value == true ? Container(
                    //   height: screenHeight * 0.1,
                    //   width: screenWidth * 1,
                    //   color: Colors.transparent,
                    //   child: Column(
                    //     children: [
                    //       Row(
                    //         children: [
                    //           Image.network('https://www.themoviedb.org/t/p/w600_and_h900_bestv2/pi0kmFJAEcHpTjqITHPFUic9omf.jpg',width: 20, height: 30,)
                    //         ],
                    //       )
                    //     ],
                    //   ),
                    // ) : kHeight,
                    scrollNotifier.value == true
                        ? AnimatedContainer(
                          duration: const Duration(milliseconds: 800),
                            color: Colors.black.withOpacity(0.3),
                            height: screenHeight * 0.12,
                            width: screenWidth * 1,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Image.network(
                                      'https://imgs.search.brave.com/xxTtTs71iSk06EO_ghkixr3yFcKtw8FCc4rA9hUPDEA/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9wbmd0/ZWFtLmNvbS9pbWFn/ZXMvbmV0ZmxpeC1w/bmctNzE1eDcxNV82/NjFlYjQ2Zl90cmFu/c3BhcmVudF8yMDE1/ZWMucG5nLnBuZw',
                                      width: 50,
                                      height: 70,
                                    ),
                                    const Spacer(),
                                    const Icon(
                                      Icons.cast,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    kWidth,
                                    InkWell(
                                      onTap: () {},
                                      child: const SizedBox(
                                        height: 30,
                                        width: 30,
                                        child: Icon(
                                          Icons.person_2,
                                          color: kWhiteColor,
                                          size: 30,
                                        ),
                                        //color: Colors.red,
                                      ),

                                    ),
                                  ],
                                ),
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text('Tv Shows', style: kHomeTextStyle,),
                                    Text('Movies', style: kHomeTextStyle,),
                                    Text('Categories',style: kHomeTextStyle,)
                                  ],
                                ),
                              ],
                            ),
                          )
                        : SizedBox(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
