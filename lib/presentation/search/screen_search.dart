import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/applications/search/search_bloc.dart';
import 'package:netflix_app/core/constant/constant.dart';
import 'package:netflix_app/domain/core/debouncer/debouncer.dart';
import 'package:netflix_app/presentation/search/widgets/search_result.dart';

import 'widgets/search_idle_widget.dart';

class ScreenSearch extends StatelessWidget {
  ScreenSearch({super.key});

  final _debouncer = Debouncer(delay: const Duration(milliseconds: 1 * 1000));

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<SearchBloc>(context).add(const Initialize());
    });
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(5),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CupertinoSearchTextField(
                  backgroundColor: Colors.grey.withOpacity(0.4),
                  prefixIcon: const Icon(
                    CupertinoIcons.search,
                    color: Colors.grey,
                  ),
                  suffixIcon: const Icon(
                    CupertinoIcons.xmark_circle_fill,
                    color: Colors.grey,
                  ),
                  style: const TextStyle(color: Colors.white),
                  onChanged: (value) {
                    if (value.isEmpty) {
                      return;
                    }
                    _debouncer.run(() {
                      BlocProvider.of<SearchBloc>(context)
                          .add(searchMovie(movieQuery: value));
                    });
                  },
                ),
                kHeight,
                Expanded(
                  child: BlocBuilder<SearchBloc, SearchState>(
                    builder: (context, state) {
                      if (state.searchResultData.isEmpty) {
                        return const SearchIdleWidget();
                      } else {
                        return const SearchResultWidget();
                      }
                    },
                  ),
                ),

                // const Expanded(
                //   child: SearchResultWidget(),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
