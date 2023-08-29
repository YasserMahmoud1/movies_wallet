import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/functions/go_to_more_movies.dart';
import '../../core/functions/go_to_movie_details.dart';
import '../../manager.dart';
import '../home/presentation/manager/movies_manager/popular/cubit/popular_cubit.dart';
import 'home_movie_card_widget.dart';

class PopularMovies extends StatelessWidget {
  const PopularMovies({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PopularMoviesCubit(),
      child: BlocBuilder<PopularMoviesCubit, PopularState>(
        builder: (context, state) {
          if (state is PopularSuccess) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                      top: 24, start: 16, end: 16, bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Top Rated Movies",
                          style: Theme.of(context).textTheme.headlineMedium),
                      TextButton(
                        onPressed: () {
                          goToMoreMovies(context, SeeMoreModes.popular);
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
                    },
                  ),
                ),
                const SizedBox(height: 24),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
