import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domain/core/Failures/main_Failure.dart';
import 'package:netflix_app/domain/hotAndNew/hot_and_new_service.dart';

import '../../domain/hotAndNew/model/hot_and_new_resp.dart';

part 'hotandnew_event.dart';
part 'hotandnew_state.dart';
part 'hotandnew_bloc.freezed.dart';

//Inject
@injectable
class HotandnewBloc extends Bloc<HotandnewEvent, HotandnewState> {
  //!service
  final HotAndNewService _hotAndNewService;
  HotandnewBloc(this._hotAndNewService) : super(HotandnewState.initial()) {
    //TODO: LoadDataInComingSoon
    on<LoadDataInComingSoon>((event, emit) async {
      // send loading to UI
      emit(const HotandnewState(
        comingSoonList: [],
        everyOneIsWatchingList: [],
        isLoading: true,
        isError: false,
      ));
      //get data from remote
      final _result = await _hotAndNewService.getHotAndNewMovieData();

       // data to state
      final newState = _result.fold(
        (MainFailure failure) {
          return const HotandnewState(
            comingSoonList: [],
            everyOneIsWatchingList: [],
            isLoading: false,
            isError: true,
          );
        },
        (HotAndNewResp resp) {
          return  HotandnewState(
            comingSoonList: resp.results,
            everyOneIsWatchingList: state.everyOneIsWatchingList,
            isLoading: false,
            isError: false,
          );
        },
      );
      emit(newState);
    });

    //TODO: LoadDataInEveryoneIsWatching
    on<LoadDataInEveryoneIsWatching>((event, emit) async{
       // send loading to UI
      emit(const HotandnewState(
        comingSoonList: [],
        everyOneIsWatchingList: [],
        isLoading: true,
        isError: false,
      ));
      //get data from remote
      final _result = await _hotAndNewService.getHotAndNewTvData();

       // data to state
      final newState = _result.fold(
        (MainFailure failure) {
          return const HotandnewState(
            comingSoonList: [],
            everyOneIsWatchingList: [],
            isLoading: false,
            isError: true,
          );
        },
        (HotAndNewResp resp) {
          return  HotandnewState(
            comingSoonList: state.comingSoonList,
            everyOneIsWatchingList: resp.results,
            isLoading: false,
            isError: false,
          );
        },
      );
      emit(newState);
    });
  }
}
