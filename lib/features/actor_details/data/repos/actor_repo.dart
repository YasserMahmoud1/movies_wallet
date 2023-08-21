import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../movie_details/data/models/movie_model.dart';

abstract class ActorRepo {
  Future<Either<Failure, List<Movie>>> getActorMovies(int actorId);
}