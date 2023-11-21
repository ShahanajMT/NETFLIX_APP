import 'package:dartz/dartz.dart';
import 'package:netflix_app/domain/core/Failures/main_Failure.dart';

import 'model/hot_and_new_resp.dart';

abstract class HotAndNewService {
  Future<Either<MainFailure,HotAndNewResp>> getHotAndNewMovieData();
  Future<Either<MainFailure,HotAndNewResp>> getHotAndNewTvData();
}