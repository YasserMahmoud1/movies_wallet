import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/functions/go_to_more_movies.dart';
import '../../core/functions/go_to_movie_details.dart';
import '../../core/utils/service_locator.dart';
import '../../manager.dart';
import '../home/data/repos/home_repo/home_repo_imp.dart';
import '../home/presentation/manager/movies_manager/now_in_theaters/now_in_theaters_movies_cubit.dart';
import 'home_movie_card_widget.dart';

class NowInTheaters extends StatelessWidget {
  const NowInTheaters({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NowInTheatersMovieCubit(getIt.get<HomeRepoImpl>()),
      child: BlocBuilder<NowInTheatersMovieCubit, NowInTheatersMovieCubitState>(
        builder: (context, state) {
          if (state is NowInTheatersSuccess) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                      top: 24, start: 16, end: 16, bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Now in theaters",
                          style: Theme.of(context).textTheme.headlineMedium),
                      TextButton(
                        onPressed: () {
                          goToMoreMovies(context, SeeMoreModes.nowInTheaters);
                        },
                        child: Text(
                          "see more",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                color: ColorManager.blues,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 240,
                  child: ListView.builder(
                      itemCount: state.movies.length,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: InkWell(
                              child: MovieCard(state.movies[index]),
                              onTap: () {
                                goToMovieDetails(context, state.movies[index]);
                              }),
                        );
                      }),
                ),
              ],
            );
          } else {
            return const Center(child: Text("Error"));
          }
        },
      ),
    );
  }
}
