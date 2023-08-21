import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_wallet/core/utils/service_locator.dart';
import 'package:movies_wallet/features/home/data/repos/home_repo/home_repo_imp.dart';

import '../../now_in_theaters/now_in_theaters_movies_cubit.dart';
import '../../popular/cubit/popular_cubit.dart';
import '../../trending/cubit/trending_movies_cubit.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit() : super(MovieInitial());

  final NowInTheatersMovieCubit _nowInTheatersMovieCubit =
      NowInTheatersMovieCubit(getIt.get<HomeRepoImpl>());
  final PopularMoviesCubit _popularCubit =
      PopularMoviesCubit(getIt.get<HomeRepoImpl>());
  final TrendingMoviesCubit _trendingCubit =
      TrendingMoviesCubit(getIt.get<HomeRepoImpl>());

  void getMoviesData() async {
    emit(MovieLoading());
    await _nowInTheatersMovieCubit.getNowInTheatersMovies();
    await _popularCubit.getPopularMovies();
    await _trendingCubit.getTrendingMovies();
    emit(MovieSuccess());
  }
}
