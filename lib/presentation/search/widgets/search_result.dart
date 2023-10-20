import 'package:flutter/material.dart';
import 'package:netflix_app/core/constant/constant.dart';
import 'package:netflix_app/presentation/search/widgets/search_title.dart';

const imageUrl =
    'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/uQxjZGU6rxSPSMeAJPJQlmfV3ys.jpg';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTitleText(title: 'Movies & Tv'),
        kHeight,
        Expanded(
          child: GridView.count(
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 1 / 1.3, // Width & Height  setting
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            crossAxisCount: 3,
            children: List.generate(
              21,
              (index) {
                return const MianCard();
              },
            ),
          ),
        ),
      ],
    );
  }
}

class MianCard extends StatelessWidget {
  const MianCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        image: const DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(6)
      ),
    );
  }
}
