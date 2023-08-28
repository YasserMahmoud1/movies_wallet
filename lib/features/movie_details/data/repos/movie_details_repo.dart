import 'package:dartz/dartz.dart';
import 'package:movies_wallet/features/movie_details/data/models/movie_model.dart';

import '../../../../core/errors/failure.dart';
import '../../../actor_details/data/models/actor_model.dart';

abstract class MovieDetailsRepo {
  Future<Either<Failure, String>> getMovieTrailer(int movieID);
  Future<Either<Failure, List<Actor>>> getMovieCast(int movieID);
  Future<Either<Failure, List<Movie>>> getMovieRecommendations(int movieID);
}
