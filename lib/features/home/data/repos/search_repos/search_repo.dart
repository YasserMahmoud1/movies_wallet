import 'package:dartz/dartz.dart';
import 'package:movies_wallet/core/errors/failure.dart';
// import 'package:movies_wallet/features/actor_details/data/models/actor_model.dart';

import '../../../../movie_details/data/models/movie_model.dart';

abstract class SearchRepo {
  Future<Either<Failure,List<Movie>>> searchMovie(String query);
  // Future<Either<Failure,List<Actor>>> searchPerson(String query);
}