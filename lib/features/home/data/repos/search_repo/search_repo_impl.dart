import 'package:dartz/dartz.dart';
import 'package:movies_wallet/core/errors/failure.dart';
import 'package:movies_wallet/core/utils/api_service.dart';
// import 'package:movies_wallet/features/actor_details/data/models/actor_model.dart';
import 'package:movies_wallet/features/home/data/repos/search_repo/search_repo.dart';
import 'package:movies_wallet/features/movie_details/data/models/movie_model.dart';

import '../../../../actor_details/data/models/actor_model.dart';

class SearchRepoImpl implements SearchRepo {
  SearchRepoImpl(this._apiService);

  final ApiService _apiService;

  @override
  Future<Either<Failure, List<Movie>>> searchMovie(String query) async {
    try {
      var response =
          await _apiService.get(endPoint: "search/movie?query=$query&");
      return Right(response["results"]
          .map<Movie>((movie) => Movie.fromJSON(movie))
          .toList());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Actor>>> searchActor(String query)async {
    try {
      var response =
          await _apiService.get(endPoint: "search/person?query=$query&");
      return Right(response["results"]
          .map<Actor>((actor) => Actor.fromJSON(actor))
          .toList());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
