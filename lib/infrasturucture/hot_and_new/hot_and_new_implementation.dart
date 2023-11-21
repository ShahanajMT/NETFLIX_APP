import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domain/core/Failures/main_Failure.dart';
import 'package:netflix_app/domain/hotAndNew/hot_and_new_service.dart';
import 'package:netflix_app/domain/hotAndNew/model/hot_and_new_resp.dart';

import '../../domain/core/api_end_points.dart';



@LazySingleton(as: HotAndNewService)
class HotAndNewImpl implements HotAndNewService {
  //!Hot&New Movie API Integration
  @override
  Future<Either<MainFailure, HotAndNewResp>> getHotAndNewMovieData() async {
    try {
      final response = await Dio(BaseOptions()).get(
        ApiEndPoints.hotAndNewMovie,
      );
      // log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = HotAndNewResp.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MainFailure.serverFailue());
      }
    } on DioException catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }

  //!Hot&New Tv API Integration
  @override
  Future<Either<MainFailure, HotAndNewResp>> getHotAndNewTvData() async {
   try {
      final response = await Dio(BaseOptions()).get(
        ApiEndPoints.hotAndNewTv,
      );
      // log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = HotAndNewResp.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MainFailure.serverFailue());
      }
    } on DioException catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }
}
