import 'package:dartz/dartz.dart';
import 'package:movies_wallet/core/errors/failure.dart';
import 'package:movies_wallet/core/utils/api_service.dart';
import 'package:movies_wallet/features/movie_details/data/models/movie_model.dart';
import 'package:movies_wallet/features/see_more/data/repos/see_more_repo/see_more_repo.dart';

import '../../model/see_more_model.dart';

class SeeMoreRepoImpl implements SeeMoreRepo{

  SeeMoreRepoImpl(this._apiService);
  final ApiService _apiService;


  @override
  Future<Either<Failure, SeeMoreModel>> getSeeMoreNowInTheater(int pageNumber, int? genreId)async {
    try {
      var response =
          await _apiService.get(endPoint: "movie/now_playing?with_genres=$genreId&page=$pageNumber&");
      return Right(SeeMoreModel(
          response["results"]
              .map<Movie>((movie) => Movie.fromJSON(movie))
              .toList(),
          response["total_pages"]));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, SeeMoreModel>> getSeeMorePopular(int pageNumber, int? genreId)async {
    try {
      var response =
          await _apiService.get(endPoint: "movie/top_rated?with_genres=$genreId&page=$pageNumber&");
      return Right(SeeMoreModel(
          response["results"]
              .map<Movie>((movie) => Movie.fromJSON(movie))
              .toList(),
          response["total_pages"]));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, SeeMoreModel>> getSeeMoreTrending(int pageNumber, int? genreId)async {
    try {
      var response =
          await _apiService.get(endPoint: "trending/movie/week?with_genres=$genreId&page=$pageNumber&");
      return Right(SeeMoreModel(
          response["results"]
              .map<Movie>((movie) => Movie.fromJSON(movie))
              .toList(),
          response["total_pages"]));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

}