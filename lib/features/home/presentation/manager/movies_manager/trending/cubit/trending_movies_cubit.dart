import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../../../core/utils/service_locator.dart';
import '../../../../../../movie_details/data/models/movie_model.dart';
import '../../../../../data/repos/home_repo/home_repo.dart';
import '../../../../../data/repos/home_repo/home_repo_imp.dart';

part 'trending_movies_state.dart';

class TrendingMoviesCubit extends Cubit<TrendingMoviesState> {
  TrendingMoviesCubit._instance(this._homeRepo) : super(TrendingMoviesInitial());

  static final TrendingMoviesCubit _internal = TrendingMoviesCubit._instance(
    getIt.get<HomeRepoImpl>(),
  );

  factory TrendingMoviesCubit(HomeRepoImpl homeRepoImpl) => _internal;

  final HomeRepo _homeRepo;

  Future<void> getTrendingMovies() async {
    var result = await _homeRepo.getTrendingMovies();
    result.fold(
      (failure) {
        emit(TrendingMoviesFailure(failure.errMessage));
      },
      (movie) {
        emit(TrendingMoviesSuccess(movie));
      },
    );
  }
}
