import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'see_more_cubit_state.dart';

class SeeMoreCubit extends Cubit<SeeMoreCubitState> {
  SeeMoreCubit() : super(SeeMoreCubitInitial());
  static SeeMoreCubit get(context) => BlocProvider.of(context);

  static int? selectedGenre;

  void initial() {
    selectedGenre = null;
    emit(SeeMoreCubitInitial());
  }
  
  void selectGenre(int genreId) {
    if (genreId == 0) {
      selectedGenre = null;
    } else {
      selectedGenre = genreId;
    }
    emit(SeeMoreCubitSelected());
  }
}
