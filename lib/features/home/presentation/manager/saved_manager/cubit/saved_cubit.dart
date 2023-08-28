import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../movie_details/data/models/movie_model.dart';
import '../../../../data/repos/saved_repo/saved_repo.dart';

part 'saved_state.dart';

class SavedCubit extends Cubit<SavedState> {
  SavedCubit(this.savedRepo) : super(SavedInitial());

  static SavedCubit get(context) => BlocProvider.of(context);

  final SavedRepo savedRepo;


  void getData() async {
    emit(SavedLoading());
    final movie = await savedRepo.getSavedMovies();
    emit(SavedSuccess(movie));
  }

  void saveMovie(Movie movie) async {
    await savedRepo.saveMovie(movie);
    emit(SavedMovieSuccess());
    getData();
  }

  void deleteMovie(int movieID) async {
    await savedRepo.deleteMovie(movieID);
    emit(SavedMovieSuccess());
    getData();
  }

}
