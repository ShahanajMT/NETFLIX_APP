import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:netflix_app/domain/core/Failures/main_Failure.dart';
import 'package:netflix_app/domain/core/api_end_points.dart';
import 'package:netflix_app/domain/downloads/i_Downloads_repo.dart';
import 'package:netflix_app/domain/downloads/models/downloadsModel.dart';

class DownloadsRepository implements IDownloadsRepo {
  @override
  Future<Either<MainFailure, List<Downloads>>> getDownloadImage() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.downloads);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final List<Downloads> downloadsList = [];
        for (final raw in response.data) {
          downloadsList.add(Downloads.fromJson(raw as Map<String, dynamic>));
        }
        print(downloadsList);
        return Right(downloadsList);
      } else {
        return const Left(MainFailure.serverFailue());
      }
    } catch (_) {
      return const Left(MainFailure.clientFailure());
    }
  }
}
