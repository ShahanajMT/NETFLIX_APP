import 'package:dartz/dartz.dart';
import 'package:netflix_app/domain/core/Failures/main_Failure.dart';
import 'package:netflix_app/domain/downloads/models/downloadsModel.dart';

abstract class IDownloadsRepo {
  Future<Either<MainFailure, List<Downloads>>> getDownloadImage();
}
