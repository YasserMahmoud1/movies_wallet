part of 'trending_movies_cubit.dart';

@immutable
sealed class TrendingMoviesState {}

final class TrendingMoviesInitial extends TrendingMoviesState {}
final class TrendingMoviesSuccess extends TrendingMoviesState {
  final List<Movie> movies;
  TrendingMoviesSuccess(this.movies);
}
final class TrendingMoviesFailure extends TrendingMoviesState {
  final String message;
  TrendingMoviesFailure(this.message);
}
