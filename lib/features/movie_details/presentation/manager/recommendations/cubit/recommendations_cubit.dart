import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../data/models/movie_model.dart';
import '../../../../data/repos/movie_details_repo_impl.dart';

part 'recommendations_state.dart';

class RecommendationsCubit extends Cubit<RecommendationsState> {
  RecommendationsCubit(this._movieDetailsRepoImpl)
      : super(RecommendationsInitial());

  final MovieDetailsRepoImpl _movieDetailsRepoImpl;

  void getRecommendations(int movieID) async {
    var response = await _movieDetailsRepoImpl.getMovieRecommendations(movieID);
    response.fold((failure) {
      emit(RecommendationsFaliure(failure.errMessage));
      print(failure.errMessage);
    }, (movies) => emit(RecommendationsSuccess(movies)));
  }
}
