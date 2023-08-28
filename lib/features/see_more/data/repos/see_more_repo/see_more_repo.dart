import 'package:dartz/dartz.dart';
import 'package:movies_wallet/core/errors/failure.dart';

import '../../model/see_more_model.dart';

abstract class SeeMoreRepo {
  Future<Either<Failure, SeeMoreModel>> getSeeMoreNowInTheater(int pageNumber, int? genreId);
  Future<Either<Failure,SeeMoreModel>> getSeeMoreTrending(int pageNumber, int? genreId);
  Future<Either<Failure,SeeMoreModel>> getSeeMorePopular(int pageNumber, int? genreId);
}