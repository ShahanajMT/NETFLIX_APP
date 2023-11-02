import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:netflix_app/domain/downloads/i_Downloads_repo.dart';

import '../../domain/core/Failures/main_Failure.dart';
import '../../domain/downloads/models/downloadsModel.dart';

part 'downloads_event.dart';
part 'downloads_state.dart';
part 'downloads_bloc.freezed.dart';

class DownloadsBloc extends Bloc<DownloadsEvent, DownloadsState> {
  final IDownloadsRepo _downloadsRepo;
  DownloadsBloc(this._downloadsRepo) : super(DownloadsState.initial()) {
    on<_GetDownloadsImage>((event, emit) async {
      // TODO: implement event handler
      emit(
        state.copyWith(
          isLoading: true,
          downloadsFailureOrSuccessOption: none(),
        ),
      );
      //! RESPONSE
      final Either<MainFailure, List<Downloads>> downloadsOptions =
          await _downloadsRepo.getDownloadImage();
      //! STATE CHANGE
      emit(
        downloadsOptions.fold(
          (failure) => state.copyWith(
            isLoading: false,
            downloadsFailureOrSuccessOption: Some(
              Left(failure),
            ),
          ),
          (success) => state.copyWith(
            isLoading: false,
            downloads: success,
            downloadsFailureOrSuccessOption: Some(
              Right(success),
            ),
          ),
        ),
      );
    });
  }
}
