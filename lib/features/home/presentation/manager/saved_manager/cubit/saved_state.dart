part of 'saved_cubit.dart';

@immutable
sealed class SavedState {}

final class SavedInitial extends SavedState {}

final class SavedCreateDatabase extends SavedState {}

final class SavedLoading extends SavedState {}

final class SavedSuccess extends SavedState {
  final List<Movie> movies;
  SavedSuccess(this.movies);
}

final class SavedMovieSuccess extends SavedState {}

