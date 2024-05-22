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
    // on<Initialize>((event, emit) async {
    //   if (state.idleList.isNotEmpty) {
    //     emit(
    //       SearchState(
    //         searchResultData: [],
    //         idleList: state.idleList,
    //         isLoading: false,
    //         isError: false,
    //       ),
    //     );
    //     return;
    //   }
    //   //!Emit
    //   emit(
    //     const SearchState(
    //       searchResultData: [],
    //       idleList: [],
    //       isLoading: true,
    //       isError: false,
    //     ),
    //   );
    //   // Get Trending
    //   final result = await _downloadsRepo.getDownloadImage();
    //   final state = result.fold(
    //     (MainFailure f) {
    //       return const SearchState(
    //         searchResultData: [],
    //         idleList: [],
    //         isLoading: false,
    //         isError: true,
    //       );
    //     },
    //     (List<Downloads> list) {
    //       return SearchState(
    //         searchResultData: [],
    //         idleList: list,
    //         isLoading: false,
    //         isError: false,
    //       );
    //     },
    //   );
    //   //!Show to UI
    //   emit(state);
    // });

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
  final result = await _downloadsRepo.getDownloadImage();
  // Directly emit state based on result
  emit(
    result.fold(
      (MainFailure f) => const SearchState(
        searchResultData: [],
        idleList: [],
        isLoading: false,
        isError: true,
      ),
      (List<Downloads> list) => SearchState(
        searchResultData: [],
        idleList: list,
        isLoading: false,
        isError: false,
      ),
    ),
  );
});
    /*
    SEARCH RESULT STATE
    */
    on<searchMovie>((event, emit) async {
      //!UI -> Loading CircularProgressIndicator
      emit(
        const SearchState(
          searchResultData: [],
          idleList: [],
          isLoading: true,
          isError: false,
        ),
      );
      // Call Search Movie API

      final result =
          await _searchService.searchMovies(movieQuery: event.movieQuery);
      final state = result.fold(
        (MainFailure f) {
          return const SearchState(
            searchResultData: [],
            idleList: [],
            isLoading: false,
            isError: true,
          );
        },
        (SearchResp r) {
          return SearchState(
            searchResultData: r.results,
            idleList: [],
            isLoading: false,
            isError: false,
          );
        },
      );

      //! Show to UI
      emit(state);
    });
  }
}
