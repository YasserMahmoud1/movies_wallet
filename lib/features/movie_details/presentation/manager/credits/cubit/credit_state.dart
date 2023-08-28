part of 'credit_cubit.dart';

@immutable
sealed class CreditState {}

final class CreditInitial extends CreditState {}

final class CreditSuccess extends CreditState {
  final List<Actor> actors;

  CreditSuccess(this.actors);
}

final class CreditFailure extends CreditState {
  final String message;

  CreditFailure(this.message);
}
