import 'package:dartz/dartz.dart';

import 'package:movies_wallet/core/errors/failure.dart';
import 'package:movies_wallet/core/utils/api_service.dart';

import 'package:movies_wallet/features/actor_details/data/models/actor_model.dart';

import 'package:movies_wallet/features/movie_details/data/models/movie_model.dart';

import 'movie_details_repo.dart';

class MovieDetailsRepoImpl implements MovieDetailsRepo {
  MovieDetailsRepoImpl(this._apiService);
  final ApiService _apiService;

  @override
  Future<Either<Failure, List<Actor>>> getMovieCast(int movieID) async {
    try {
      var response = await _apiService.get(endPoint: "movie/$movieID/credits?");
      return Right(response["cast"]
          .map<Actor>((actor) => Actor.fromJSON(actor))
          .toList());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getMovieRecommendations(int movieID) async{
    try {
      var response = await _apiService.get(endPoint: "movie/$movieID/recommendations?");
      return Right(response["results"]
          .map<Movie>((movie) => Movie.fromJSON(movie))
          .toList());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> getMovieTrailer(int movieID) async {
    try {
      var response = await _apiService.get(endPoint: "movie/$movieID/videos?");
      for (var i = 0; i < response["results"].length; i++) {
        if (response["results"][i]["type"] == "Trailer" &&
            response["results"][i]["site"] == "YouTube") {
          return Right(response["results"][i]["key"]);
        }
      }
      return Right("tPEE9ZwTmy0");
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
