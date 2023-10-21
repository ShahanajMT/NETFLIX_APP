import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app/core/constant/constant.dart';

import 'package:netflix_app/presentation/search/widgets/search_result.dart';


class ScreenSearch extends StatelessWidget {
  const ScreenSearch({super.key});

 @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:  SafeArea(
        child: Container(
          margin: const EdgeInsets.all(5),
          child:  Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CupertinoSearchTextField(
                  backgroundColor: Colors.grey.withOpacity(0.4),
                  prefixIcon: const Icon(CupertinoIcons.search, color: Colors.grey,),
                  suffixIcon: const Icon(CupertinoIcons.xmark_circle_fill, color: Colors.grey,),
                  style: const TextStyle(color: Colors.white),
                ),
                kHeight,
                //const Expanded(child:  SearchIdleWidget(),),

                const Expanded(child:  SearchResultWidget(),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
