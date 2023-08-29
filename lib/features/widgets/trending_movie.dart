import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/functions/go_to_more_movies.dart';
import '../../core/functions/go_to_movie_details.dart';
import '../../manager.dart';

import '../home/presentation/manager/movies_manager/trending/cubit/trending_movies_cubit.dart';
import 'home_movie_card_widget.dart';

class TrendingMovies extends StatelessWidget {
  const TrendingMovies({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrendingMoviesCubit(),
      child: BlocBuilder<TrendingMoviesCubit, TrendingMoviesState>(
        builder: (context, state) {
          if (state is TrendingMoviesSuccess) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                      top: 24, start: 16, end: 16, bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Trending Movies",
                          style: Theme.of(context).textTheme.headlineMedium),
                      TextButton(
                        onPressed: () {
                          goToMoreMovies(context, SeeMoreModes.trending);
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
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
