import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/applications/hotAndNew/hotandnew_bloc.dart';
import 'package:netflix_app/core/Colors/Colors.dart';
import '../../core/constant/constant.dart';
import 'widgets/comingSoonWidget.dart';
import 'package:intl/intl.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(93),
              child: AppBar(
                title: const Text(
                  'New & Hot',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: kWhiteColor,
                  ),
                ),
                actions: [
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
                    ),
                  ),
                ],
                bottom: TabBar(
                  indicatorColor: Colors.transparent,
                  indicatorPadding:
                      const EdgeInsets.symmetric(horizontal: -15, vertical: 7),
                  padding: const EdgeInsets.only(bottom: 10, top: 7),
                  isScrollable: true,
                  labelColor: kBlackColor,
                  unselectedLabelColor: kWhiteColor,
                  labelStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  indicator: BoxDecoration(
                      color: kWhiteColor, borderRadius: kRadius30),
                  tabs: const [
                    Tab(
                      text: '🍿 Coming Soon',
                    ),
                    Tab(
                      text: "👀 Everyone's Watching",
                    ),
                  ],
                ),
              ),
            ),
            body: SafeArea(
              child: TabBarView(
                children: [
                  const ComingSoonList(
                    key: Key('coming_soon'),
                  ),
                  _buildEveryoncesWatching(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //!TABBAR VIEWS
  // Widget _buildComingSoon() {
  //   return ListView.builder(
  //     shrinkWrap: true,
  //     itemCount: 10,
  //     itemBuilder: (BuildContext context, index) => const ComingSoonWidget(),
  //   );
  // }

  Widget _buildEveryoncesWatching() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (BuildContext context, index) => const SizedBox(),
      //const EveryonesWatchingWidget(),
    );
  }
}

class ComingSoonList extends StatelessWidget {
  const ComingSoonList({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotandnewBloc>(context).add(const LoadDataInComingSoon());
    });
    return BlocBuilder<HotandnewBloc, HotandnewState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          );
        } else if (state.isError) {
          return const Center(
            child: Text("Error while getting Data"),
          );
        } else if (state.comingSoonList.isEmpty) {
          return const Center(
            child: Text("ComingSoon List is empty"),
          );
        } else {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.comingSoonList.length,
            itemBuilder: (BuildContext context, index) {
              final movie = state.comingSoonList[index];
              if (movie.id == null) {
                return const SizedBox();
              }
              print(movie.releaseDate!.toString());
              String month = '';
              String date = '';
              try {
                final _date = DateTime.tryParse(movie.releaseDate!);
                final formatedDate = DateFormat.yMMMMd('en_US').format(_date!);
                print(formatedDate.toString());
                month =
                    formatedDate.split(' ').first.substring(0, 3).toUpperCase();
                date = movie.releaseDate!.split('-')[1];
              } catch (_) {
                month = '';
              }

              return ComingSoonWidget(
                id: movie.id.toString(),
                month: month,
                day: date,
                posterPath: '$imageAppendUrl${movie.posterPath}',
                movieName: movie.originalTitle ?? 'No title',
                description: movie.overview ?? 'No description',
              );
            },
          );
        }
      },
    );
  }
}
