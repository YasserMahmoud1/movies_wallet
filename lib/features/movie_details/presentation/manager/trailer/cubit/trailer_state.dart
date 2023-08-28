part of 'trailer_cubit.dart';

@immutable
sealed class TrailerState {}

final class TrailerInitial extends TrailerState {}

final class TrailerSuccess extends TrailerState {
  final String trailerID;

  TrailerSuccess(this.trailerID);
}

final class TrailerFailure extends TrailerState {
  final String message;

  TrailerFailure(this.message);
}
