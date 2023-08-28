part of 'see_more_cubit_cubit.dart';

sealed class SeeMoreCubitState {}

final class SeeMoreCubitInitial extends SeeMoreCubitState {}

final class SeeMoreCubitSelected extends SeeMoreCubitState {}
final class SeeMoreCubitGoToNextPage extends SeeMoreCubitState {}
final class SeeMoreCubitGoToPreviousPage extends SeeMoreCubitState {}

final class SeeMoreCubitLoading extends SeeMoreCubitState {}

final class SeeMoreCubitSuccess extends SeeMoreCubitState {
  final SeeMoreModel model;
  SeeMoreCubitSuccess(this.model);
}

final class SeeMoreCubitFailure extends SeeMoreCubitState {
  final String message;
  SeeMoreCubitFailure(this.message);
}
