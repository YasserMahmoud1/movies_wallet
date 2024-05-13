
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../views/movies/movies_view.dart';
import '../../views/saved/saved_view.dart';
import '../../views/search/search_view.dart';
import 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitState());

  static HomeCubit get(context) => BlocProvider.of(context);

  static List<Widget> screans = [
    const MoviesView(),
    const SearchView(),
    const SavedView(),
  ];



  static int currentIndex = 0;

  void changeNavBar(int index) {
    currentIndex = index;
    emit(HomeChangeNavBarState());
  }
}
