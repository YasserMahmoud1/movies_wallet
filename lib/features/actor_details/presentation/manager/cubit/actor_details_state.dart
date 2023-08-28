part of 'actor_details_cubit.dart';

@immutable
sealed class ActorDetailsState {}

final class ActorDetailsInitial extends ActorDetailsState {}
final class ActorDetailsLoading extends ActorDetailsState {}
final class ActorDetailsSuccess extends ActorDetailsState {
  final List<Movie> movies;

  ActorDetailsSuccess(this.movies);

}
final class ActorDetailsFailure extends ActorDetailsState {
  final String errMessage;

  ActorDetailsFailure(this.errMessage);
}
