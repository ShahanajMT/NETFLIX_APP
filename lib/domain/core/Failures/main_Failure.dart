import 'package:freezed_annotation/freezed_annotation.dart';
part 'main_Failure.freezed.dart';

@freezed
class MainFailure with _$MainFailure{
  const factory MainFailure.clientFailure() = _ClientFailure;
  const factory MainFailure.serverFailue() = _ServerFailue;
  
}