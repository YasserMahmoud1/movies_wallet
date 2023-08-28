import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_wallet/features/actor_details/data/repos/actor_repo_imp.dart';
import 'package:movies_wallet/features/actor_details/presentation/manager/cubit/actor_details_cubit.dart';

import '../../../../core/utils/service_locator.dart';
import '../../../../manager.dart';
import '../../../widgets/movie_tile_widget.dart';
import '../../data/models/actor_model.dart';

// import '../../widgets/movie_tile_widget.dart';

class ActorDetails extends StatelessWidget {
  const ActorDetails(
    this.actor, {
    Key? key,
  }) : super(key: key);

  final Actor actor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Actor Details'), centerTitle: true),
      body: CustomScrollView(slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Column(
                children: [
                  ActorDetailsImage(imgURL: actor.profilePathID),
                  Text(
                    actor.name,
                    style: Theme.of(context).textTheme.headlineLarge,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              ActorDetailsMovies(actor.id),
            ],
          ),
        ),
      ]),
    );
  }
}

class ActorDetailsMovies extends StatelessWidget {
  const ActorDetailsMovies(
    this.actorID, {
    super.key, 
  });
  final int actorID;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ActorDetailsCubit(getIt.get<ActorRepoImpl>())..getActorMovies(actorID),
      child: BlocBuilder<ActorDetailsCubit, ActorDetailsState>(
      builder: (context, state) {
        if (state is ActorDetailsSuccess)
        {
          return Column(
            crossAxisAlignment:           CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.only(
                    start: 16, end: 16, top: 32, bottom: 16),
                child: Text("Movies of the actor:",
                    style: Theme.of(context).textTheme.headlineMedium),
              ),
              for (int i = 0; i < state.movies.length; i++)
                MovieTile(state.movies[i])
            ],
          );
        }
        else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    ),
    );
  }
}

class ActorDetailsImage extends StatelessWidget {
  const ActorDetailsImage({
    super.key,
    required this.imgURL,
  });

  final String imgURL;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(bottom: 16, top: 32),
      child: Container(
        width: MediaQuery.of(context).size.width / 2,
        height: MediaQuery.of(context).size.width / 2 * 3 / 2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: CachedNetworkImageProvider(
              "${ConstManager.posterURlPrefix}$imgURL",
            ),
          ),
        ),
      ),
    );
  }
}
