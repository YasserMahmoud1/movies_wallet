import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../movie_details/data/models/movie_model.dart';
import '../../../data/repos/actor_repo.dart';

part 'actor_details_state.dart';

class ActorDetailsCubit extends Cubit<ActorDetailsState> {
  ActorDetailsCubit(this._actorRepo) : super(ActorDetailsInitial());

  final ActorRepo _actorRepo;

  void getActorMovies(int actorID) {
    emit(ActorDetailsLoading());
    _actorRepo.getActorMovies(actorID).then((response) {
      response.fold((failure) => emit(ActorDetailsFailure(failure.errMessage)),
          (movies) => emit(ActorDetailsSuccess(movies)));
    });
  }
}
