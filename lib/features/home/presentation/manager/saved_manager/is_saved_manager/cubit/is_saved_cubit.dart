import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../data/repos/saved_repo/saved_repo.dart';

part 'is_saved_state.dart';

class IsSavedCubit extends Cubit<IsSavedState> {
  IsSavedCubit(this.savedRepo) : super(IsSavedInitial());
  final SavedRepo savedRepo;
  static IsSavedCubit get(context) => BlocProvider.of(context);

  void isSaved(int movieID) {
    emit(IsSavedLoading());
    savedRepo
        .isSaved(movieID)
        .then((isSaved) => emit(IsSavedSuccess(isSaved)));
  }
}
