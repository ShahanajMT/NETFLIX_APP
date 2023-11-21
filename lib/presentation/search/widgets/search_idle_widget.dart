// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:netflix_app/core/Colors/Colors.dart';
import 'package:netflix_app/core/constant/constant.dart';

import '../../../applications/search/search_bloc.dart';
import 'search_title.dart';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTitleText(
          title: 'Top Searches',
        ),
        kHeight,
        //!
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              //!Checking whether Data is getting
              if (state.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state.isError) {
                return const Center(
                  child: Text('Error while getting Data'),
                );
              } else if (state.idleList.isEmpty) {
                return const Center(
                  child: Text('Idle List is empty'),
                );
              }
              return ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (ctx, index) {
                    final movie = state.idleList[index];
                    return TopSearchItemTile(
                        titie: movie.title ?? 'No Title Provider',
                        imageUrl: '$imageAppendUrl${movie.posterPath}');
                  },
                  separatorBuilder: (ctx, index) => kHeight20,
                  itemCount: state.idleList.length);
            },
          ),
        )
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  final String titie;
  final String imageUrl;
  const TopSearchItemTile({
    Key? key,
    required this.titie,
    required this.imageUrl,
  }) : super(key: key);

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
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageUrl),
            ),
          ),
          //color: Colors.red,
        ),
        kWidth,
        Expanded(
          child: Text(
            titie,
            style: const TextStyle(
                fontSize: 17, fontWeight: FontWeight.bold, color: kWhiteColor),
          ),
        ),
        InkWell(
          onTap: () {},
          child: const CircleAvatar(
            backgroundColor: kWhiteColor,
            radius: 25,
            child: CircleAvatar(
              backgroundColor: kBlackColor,
              radius: 23,
              child: Icon(
                Icons.play_arrow,
                color: kWhiteColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
