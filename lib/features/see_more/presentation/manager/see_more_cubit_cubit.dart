import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_wallet/features/see_more/data/model/see_more_model.dart';

import '../../../../core/errors/failure.dart';
import '../../../../manager.dart';
import '../../data/repos/see_more_repo/see_more_repo.dart';

part 'see_more_cubit_state.dart';

class SeeMoreCubit extends Cubit<SeeMoreCubitState> {
  SeeMoreCubit(this._repo, this.mode) : super(SeeMoreCubitInitial());

  static SeeMoreCubit get(context) => BlocProvider.of(context);

  int? selectedGenre;
  final SeeMoreModes mode;
  final SeeMoreRepo _repo;
  int pageNumber = 1;
  late int totalPages;

  void selectGenre(int genreId) {
    if (genreId == 0) {
      selectedGenre = null;
    } else {
      selectedGenre = genreId;
    }
    pageNumber = 1;
    emit(SeeMoreCubitSelected());
    getSeeMoreMovies();
  }

  void goToNextPage() {
    if (pageNumber < totalPages) {
      pageNumber++;
      emit(SeeMoreCubitGoToNextPage());
      getSeeMoreMovies();
    }
  }

  void goToPreviousPage() {
    if (pageNumber > 1) {
      pageNumber--;
      emit(SeeMoreCubitGoToPreviousPage());
      getSeeMoreMovies();
    }
  }

  getSeeMoreMovies() async {
    emit(SeeMoreCubitLoading());
    final Either<Failure, SeeMoreModel> result;
    switch (mode) {
      case SeeMoreModes.nowInTheaters:
        result = await _repo.getSeeMoreNowInTheater(pageNumber, selectedGenre);
        break;
      case SeeMoreModes.popular:
        result = await _repo.getSeeMorePopular(pageNumber, selectedGenre);
        break;
      case SeeMoreModes.trending:
        result = await _repo.getSeeMoreTrending(pageNumber, selectedGenre);
        break;
    }
    result.fold((failure) => emit(SeeMoreCubitFailure(failure.errMessage)),
        (model) {
      totalPages = model.totalPages;
      return emit(SeeMoreCubitSuccess(model));
    });
  }
}
