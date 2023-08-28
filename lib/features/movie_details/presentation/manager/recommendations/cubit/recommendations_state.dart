part of 'recommendations_cubit.dart';

@immutable
sealed class RecommendationsState {}

final class RecommendationsInitial extends RecommendationsState {}

final class RecommendationsSuccess extends RecommendationsState {
  final List<Movie> movies;

  RecommendationsSuccess(this.movies);
}

final class RecommendationsFaliure extends RecommendationsState {
  final String message;

  RecommendationsFaliure(this.message);
}
