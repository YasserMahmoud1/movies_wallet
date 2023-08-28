part of 'is_saved_cubit.dart';

@immutable
sealed class IsSavedState {}

final class IsSavedInitial extends IsSavedState {}

final class IsSavedLoading extends IsSavedState {}

final class IsSavedSuccess extends IsSavedState {
  final bool isSaved;

  IsSavedSuccess(this.isSaved);
}
