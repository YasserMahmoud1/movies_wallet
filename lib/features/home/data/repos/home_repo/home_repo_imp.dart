import 'package:dartz/dartz.dart';

import 'package:movies_wallet/core/errors/failure.dart';

import 'package:movies_wallet/features/movie_details/data/models/movie_model.dart';

import '../../../../../core/utils/api_service.dart';
import 'home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService _apiService;

  HomeRepoImpl(this._apiService);
  @override
  Future<Either<Failure, List<Movie>>> getNowInTheatersMovies() async {
    try {
      var response = await _apiService.get(endPoint: 'movie/now_playing?');
      return Right(response['results']
          .map<Movie>((movie) => Movie.fromJSON(movie))
          .toList());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    try {
      var response = await _apiService.get(endPoint: 'movie/top_rated?');
      return Right(response['results']
          .map<Movie>((movie) => Movie.fromJSON(movie))
          .toList());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTrendingMovies() async {
    try {
      var response = await _apiService.get(endPoint: 'trending/movie/week?');
      return Right(response['results']
          .map<Movie>((movie) => Movie.fromJSON(movie))
          .toList());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
