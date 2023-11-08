// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:netflix_app/core/constant/constant.dart';
import 'package:netflix_app/presentation/search/widgets/search_title.dart';

import '../../../applications/search/search_bloc.dart';

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
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              return GridView.count(
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 1 / 1.3, // Width & Height  setting
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                crossAxisCount: 3,
                children: List.generate(
                  20,
                  (index) { 
                    final movie = state.searchResultData[index];
                    return  MianCard(imageUrl: movie.posterImageUrl,);
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class MianCard extends StatelessWidget {
  final String imageUrl;
  const MianCard({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(6)),
    );
  }
}
