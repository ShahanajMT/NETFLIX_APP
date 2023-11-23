import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domain/core/Failures/main_Failure.dart';
import 'package:netflix_app/domain/hotAndNew/hot_and_new_service.dart';

import '../../domain/hotAndNew/model/hot_and_new_resp.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HotAndNewService _homeService;
  HomeBloc(this._homeService) : super(HomeState.initial()) {
    //! on event get home screen data
    on<GetHomeScreenData>((event, emit) async {
      // send loading to UI_Initial
      emit(state.copyWith(isLoading: true, hasError: false));

      // get Data
      final _movieResult = await _homeService.getHotAndNewMovieData();
      final _tvResult = await _homeService.getHotAndNewTvData();

      // transform Data

      final _state1 = _movieResult.fold(
        (MainFailure failure) {
          return  HomeState(
            stateId: DateTime.now().microsecondsSinceEpoch.toString(),
            pastYearMovieList: [],
            trendingMovieList: [],
            tensDaramasMovieList: [],
            southIndianMovieList: [],
            trendingTvList: [],
            isLoading: false,
            hasError: true,
          );
        }, 
        (HotAndNewResp resp) {
          // to shufle the movie -> List
          final pastYear = resp.results;
          final trending = resp.results;
          final tensDramas = resp.results;
          final southIndian = resp.results;
          pastYear.shuffle();
          trending.shuffle();
          tensDramas.shuffle();
          southIndian.shuffle();
          return  HomeState(
            stateId: DateTime.now().microsecondsSinceEpoch.toString(),
            pastYearMovieList: pastYear,
            trendingMovieList: trending,
            tensDaramasMovieList: tensDramas,
            southIndianMovieList: southIndian,
            trendingTvList: state.trendingTvList,
            isLoading: false,
            hasError: false,
          );
        },
      );
      emit(_state1);


      final _state2 = _tvResult.fold(
        (MainFailure failure) {
          return  HomeState(
            stateId: DateTime.now().microsecondsSinceEpoch.toString(),
            pastYearMovieList: [],
            trendingMovieList: [],
            tensDaramasMovieList: [],
            southIndianMovieList: [],
            trendingTvList: [],
            isLoading: false,
            hasError: true,
          );
        },
        (HotAndNewResp resp) {
          final top10List = resp.results;
          return  HomeState(
            stateId: DateTime.now().microsecondsSinceEpoch.toString(),
            pastYearMovieList: state.pastYearMovieList,
            trendingMovieList: state.trendingMovieList,
            tensDaramasMovieList: state.tensDaramasMovieList,
            southIndianMovieList: state.southIndianMovieList,
            trendingTvList: top10List,
            isLoading: false,
            hasError: false,
          );
        },
      );

      // send to UI
      emit(_state2);
    });
  }
}
