import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../movie_details/data/models/movie_model.dart';
import '../../../../data/repos/search_repos/search_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._searchRepo) : super(SearchInitial());

  static SearchCubit get(context) => BlocProvider.of(context);

  // String selectedSegment = "Movies";
  // void changeSegment(String value) {
  //   selectedSegment = value;
  //   print(selectedSegment);
  //   emit(SearchInitial());
  // }
  final SearchRepo _searchRepo;
  void searchMovie(String query) async {
    emit(SearchLoading());
    final result = await _searchRepo.searchMovie(query);
    result.fold((failure) {
      emit(SearchFailure(failure.errMessage));
    }, (movie) {
      emit(SearchSuccess(movie));
    });
  }
}
