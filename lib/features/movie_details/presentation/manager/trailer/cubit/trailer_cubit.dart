import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../data/repos/movie_details_repo_impl.dart';

part 'trailer_state.dart';

class TrailerCubit extends Cubit<TrailerState> {
  TrailerCubit(this._detailsRepoImpl) : super(TrailerInitial());

  final MovieDetailsRepoImpl _detailsRepoImpl;

  void getTrailer(int movieID) async {
    var response = await _detailsRepoImpl.getMovieTrailer(movieID);
    response.fold((failure) => emit(TrailerFailure(failure.errMessage)),
        (trailerID) => emit(TrailerSuccess(trailerID)),);
  }
}
