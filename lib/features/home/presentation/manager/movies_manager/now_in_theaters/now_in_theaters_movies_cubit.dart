import 'package:bloc/bloc.dart';
import 'package:movies_wallet/features/home/data/repos/home_repo/home_repo.dart';
import 'package:movies_wallet/features/home/data/repos/home_repo/home_repo_imp.dart';

import '../../../../../../core/utils/service_locator.dart';
import '../../../../../movie_details/data/models/movie_model.dart';

part 'now_in_theaters_movies_states.dart';

class NowInTheatersMovieCubit extends Cubit<NowInTheatersMovieCubitState> {

  NowInTheatersMovieCubit._instance(this._homeRepo)
      : super(NowInTheatersInitial());

  static final NowInTheatersMovieCubit _internal = NowInTheatersMovieCubit._instance(
    getIt.get<HomeRepoImpl>(),
  );

  factory NowInTheatersMovieCubit() => _internal;
  

  final HomeRepo _homeRepo;

  Future<void> getNowInTheatersMovies() async {
    var result = await _homeRepo.getNowInTheatersMovies();
    result.fold(
      (failure) {
        print(failure.errMessage);
        emit(NowInTheatersFailure(failure.errMessage));
      },
      (movie) {
        emit(NowInTheatersSuccess(movie));
      },
    );
  }
}
