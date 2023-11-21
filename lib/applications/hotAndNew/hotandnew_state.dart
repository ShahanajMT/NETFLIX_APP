part of 'hotandnew_bloc.dart';

@freezed
class HotandnewState with _$HotandnewState {
  const factory HotandnewState({
    //2List We Neede
    required List<HotAndNewData> comingSoonList,
    required List<HotAndNewData> everyOneIsWatchingList,
    required bool isLoading,
    required bool isError,
  }) = _Initial;

  factory HotandnewState.initial() => const HotandnewState(
        comingSoonList: [],
        everyOneIsWatchingList: [],
        isLoading: false,
        isError: false,
      );
}
