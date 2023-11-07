import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domain/core/Failures/main_Failure.dart';
import 'package:netflix_app/domain/downloads/i_Downloads_repo.dart';
import 'package:netflix_app/domain/search/search_service.dart';

import '../../domain/downloads/models/downloadsModel.dart';
import '../../domain/search/model/search_resp/search_resp.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IDownloadsRepo _downloadsRepo; // Trending
  final SearchService _searchService; // Search with Query
  SearchBloc(this._searchService, this._downloadsRepo)
      : super(SearchState.initial()) {
    /*
    IDLE STATE
    */
    on<Initialize>((event, emit) async {
      if (state.idleList.isNotEmpty) {
        emit(
         SearchState(
          searchResultData: [],
          idleList: state.idleList,
          isLoading: false,
          isError: false,
        ),
      );
        return;
      }
      //!Emit
      emit(
        const SearchState(
          searchResultData: [],
          idleList: [],
          isLoading: true,
          isError: false,
        ),
      );
      // Get Trending
      final _result = await _downloadsRepo.getDownloadImage();
      final _state = _result.fold(
        (MainFailure f) {
          
            return const SearchState(
              searchResultData: [],
              idleList: [],
              isLoading: false,
              isError: true,
            );
          
        },
        (List<Downloads> list) {
          return SearchState(
            searchResultData: [],
            idleList: list,
            isLoading: false,
            isError: false,
          );
        },
      );
      //!Show to UI
      emit(_state);
    });
    /*
    SEARCH RESULT STATE
    */
    on<searchMovie>((event, emit) {
      // Call Search Movie API
      _searchService.searchMovies(movieQuery: event.movieQuery);

      //! Show to UI
    });
  }
}
