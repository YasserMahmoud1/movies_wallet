import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../actor_details/data/models/actor_model.dart';
import '../../../../../movie_details/data/models/movie_model.dart';
import '../../../../data/repos/search_repo/search_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._searchRepo) : super(SearchInitial());

  static SearchCubit get(context) => BlocProvider.of(context);
  TextEditingController searchController = TextEditingController();
  String selectedSegment = "Movies";
  void changeSegment(String value) {
    selectedSegment = value;
    searchController.clear();
    emit(SearchInitial());
  }
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
  void searchActor(String query) async {
    emit(SearchActorLoading());
    final result = await _searchRepo.searchActor(query);
    result.fold((failure) {
      emit(SearchActorFailure(failure.errMessage));
    }, (actor) {
      emit(SearchActorSuccess(actor));
    });
  }
}
