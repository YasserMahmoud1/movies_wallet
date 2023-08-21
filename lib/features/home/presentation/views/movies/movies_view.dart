import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_wallet/core/utils/service_locator.dart';
import 'package:movies_wallet/features/home/data/repos/home_repo/home_repo_imp.dart';
import 'package:movies_wallet/features/home/presentation/manager/movies_manager/movie_cubit/cubit/movie_cubit.dart';
import 'package:movies_wallet/features/home/presentation/manager/movies_manager/popular/cubit/popular_cubit.dart';

import '../../../../../core/functions/go_to_more_movies.dart';
import '../../../../../core/functions/go_to_movie_details.dart';
import '../../../../../manager.dart';
import '../../../../widgets/movie_card_widget.dart';
import '../../manager/movies_manager/now_in_theaters/now_in_theaters_movies_cubit.dart';
import '../../manager/movies_manager/trending/cubit/trending_movies_cubit.dart';

class MoviesView extends StatelessWidget {
  const MoviesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCubit, MovieState>(
      builder: (context, state) {
        if (state is MovieLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Scaffold(
            appBar: AppBar(title: const Text("Movies"), centerTitle: true),
            body: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      const NowInTheaters(),
                      const TrendingMovies(),
                      const PopularMovies(),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}

class TrendingMovies extends StatelessWidget {
  const TrendingMovies({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrendingMoviesCubit(getIt.get<HomeRepoImpl>()),
      child: BlocBuilder<TrendingMoviesCubit, TrendingMoviesState>(
        builder: (context, state) {
          if (state is TrendingMoviesSuccess) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                      top: 32, start: 16, end: 16, bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Trending Movies",
                          style: Theme.of(context).textTheme.headlineMedium),
                      TextButton(
                        onPressed: () {
                          goToMoreMovies(context);
                        },
                        child: Text(
                          "See more",
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
                                goToMovieDetails(context);
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

class PopularMovies extends StatelessWidget {
  const PopularMovies({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PopularMoviesCubit(getIt.get<HomeRepoImpl>()),
      child: BlocBuilder<PopularMoviesCubit, PopularState>(
        builder: (context, state) {
          if (state is PopularSuccess) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                      top: 32, start: 16, end: 16, bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Top Rated Movies",
                          style: Theme.of(context).textTheme.headlineMedium),
                      TextButton(
                        onPressed: () {
                          goToMoreMovies(context);
                        },
                        child: Text(
                          "See more",
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
                                goToMovieDetails(context);
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
                      top: 32, start: 16, end: 16, bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Now in theaters",
                          style: Theme.of(context).textTheme.headlineMedium),
                      TextButton(
                        onPressed: () {
                          goToMoreMovies(context);
                        },
                        child: Text(
                          "See more",
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
                                goToMovieDetails(context);
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
