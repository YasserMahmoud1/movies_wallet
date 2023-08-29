import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../../../core/utils/service_locator.dart';
import '../../../../../../movie_details/data/models/movie_model.dart';
import '../../../../../data/repos/home_repo/home_repo.dart';
import '../../../../../data/repos/home_repo/home_repo_imp.dart';

part 'popular_state.dart';

class PopularMoviesCubit extends Cubit<PopularState> {
  PopularMoviesCubit._instance(this._homeRepo) : super(PopularInitial());

  static final PopularMoviesCubit _internal = PopularMoviesCubit._instance(
    getIt.get<HomeRepoImpl>(),
  );

  factory PopularMoviesCubit() => _internal;

  final HomeRepo _homeRepo;

  Future<void> getPopularMovies() async {
    var result = await _homeRepo.getPopularMovies();
    result.fold(
      (failure) {
        print(failure.errMessage);
        emit(PopularFailure(failure.errMessage));
      },
      (movie) {
        emit(PopularSuccess(movie));
      },
    );
  }
}
