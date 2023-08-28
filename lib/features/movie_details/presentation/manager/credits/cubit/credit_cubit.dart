import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../actor_details/data/models/actor_model.dart';
import '../../../../data/repos/movie_details_repo_impl.dart';

part 'credit_state.dart';

class CreditCubit extends Cubit<CreditState> {
  CreditCubit(this._movieDetailsRepoImpl) : super(CreditInitial());

  final MovieDetailsRepoImpl _movieDetailsRepoImpl;

  void getCredits(int movieID) async {
    var response = await _movieDetailsRepoImpl.getMovieCast(movieID);

    response.fold((failure) => emit(CreditFailure(failure.errMessage)),
        (actors) => emit(CreditSuccess(actors)));
  }
}
