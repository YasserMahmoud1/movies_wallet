import 'package:dartz/dartz.dart';
import 'package:movies_wallet/core/errors/failure.dart';

import '../../../../movie_details/data/models/movie_model.dart';

abstract class HomeRepo
{
  Future<Either<Failure,List<Movie>>> getNowInTheatersMovies();
  Future<Either<Failure,List<Movie>>> getTrendingMovies();
  Future<Either<Failure,List<Movie>>> getPopularMovies();

}