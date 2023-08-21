part of 'now_in_theaters_movies_cubit.dart';

sealed class NowInTheatersMovieCubitState {}

final class NowInTheatersInitial extends NowInTheatersMovieCubitState {}

final class NowInTheatersSuccess extends NowInTheatersMovieCubitState {
  final List<Movie> movies;

  NowInTheatersSuccess(this.movies);
}

final class NowInTheatersFailure extends NowInTheatersMovieCubitState {
  final String message;

  NowInTheatersFailure(this.message);
}
