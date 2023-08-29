part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchActorLoading extends SearchState {}

final class SearchActorSuccess extends SearchState {
  final List<Actor> actors;

  SearchActorSuccess(this.actors);
}

final class SearchActorFailure extends SearchState {
    final String message;
  SearchActorFailure(this.message);
}

final class SearchSuccess extends SearchState {
  final List<Movie> movies;

  SearchSuccess(this.movies);
}

final class SearchFailure extends SearchState {
  final String message;
  SearchFailure(this.message);
}

// final class SearchChangeSegment extends SearchState {}
