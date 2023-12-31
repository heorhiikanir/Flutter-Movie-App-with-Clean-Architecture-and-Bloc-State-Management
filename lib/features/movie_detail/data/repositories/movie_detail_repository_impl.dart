import 'package:dartz/dartz.dart';
import 'package:filmku/features/movie_detail/data/datasource/local/movie_detail_local_datasource.dart';
import 'package:filmku/features/movie_detail/data/datasource/remote/movie_detail_remote_datasource.dart';
import 'package:filmku/features/movie_detail/domain/repositories/movie_detail_repository.dart';
import 'package:filmku/models/movie_detail.dart';
import 'package:filmku/models/response/casts_response.dart';
import 'package:filmku/models/response/videos_response.dart';

import 'package:filmku/shared/util/app_exception.dart';

class MovieDetailRepositoryImpl extends MovieDetailRepository {
  final MovieDetailRemoteDataSource movieDetailRemoteDataSource;
  final MovieDetailLocalDataSource movieDetailLocalDataSource;

  MovieDetailRepositoryImpl(
      {required this.movieDetailRemoteDataSource,
      required this.movieDetailLocalDataSource});

  @override
  Future<Either<AppException, MovieDetail>> getMovie({required int id}) async {
    return movieDetailRemoteDataSource.getMovie(id: id);
  }

  @override
  Future<Either<AppException, CastsResponse>> getCasts({required int id}) {
    return movieDetailRemoteDataSource.getCasts(id: id);
  }

  @override
  Future<int> bookmarkMovieDetail(MovieDetail movieDetail) {
    return movieDetailLocalDataSource.bookmarkMovie(movieDetail);
  }

  @override
  Future<bool> removeBookmark(MovieDetail movieDetail) {
    return movieDetailLocalDataSource.removeBookmark(movieDetail);
  }

  @override
  Future<bool> isBookmarked(int id) {
    return movieDetailLocalDataSource.isBookmarked(id);
  }

  @override
  Future<Either<AppException, VideosResponse>> getVideos({required int id}) {
    return movieDetailRemoteDataSource.getVideos(id: id);
  }
}
