import 'package:dartz/dartz.dart';
import 'package:movies_wallet/core/errors/failure.dart';
import 'package:movies_wallet/core/utils/api_service.dart';
import 'package:movies_wallet/features/movie_details/data/models/movie_model.dart';

import 'actor_repo.dart';

class ActorRepoImp implements ActorRepo {
  final ApiService _apiService;

  ActorRepoImp(this._apiService);

  @override
  Future<Either<Failure, List<Movie>>> getActorMovies(int actorId) async{
    try{
      var response = await _apiService.get(endPoint: 'person/$actorId/movie_credits');
      return Right(response['cast'].map<Movie>((movie) => Movie.fromJSON(movie)).toList());
    }catch(e){
      return Left(ServerFailure(e.toString()));
    }
  }
}