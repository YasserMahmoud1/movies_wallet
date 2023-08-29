import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';


import '../../now_in_theaters/now_in_theaters_movies_cubit.dart';
import '../../popular/cubit/popular_cubit.dart';
import '../../trending/cubit/trending_movies_cubit.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit() : super(MovieInitial());

  final NowInTheatersMovieCubit _nowInTheatersMovieCubit =
      NowInTheatersMovieCubit();
  final PopularMoviesCubit _popularCubit =
      PopularMoviesCubit();
  final TrendingMoviesCubit _trendingCubit =
      TrendingMoviesCubit();

  void getMoviesData() async {
    emit(MovieLoading());
    await _nowInTheatersMovieCubit.getNowInTheatersMovies();
    await _popularCubit.getPopularMovies();
    await _trendingCubit.getTrendingMovies();
    emit(MovieSuccess());
  }
}
