import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/service_locator.dart';
import '../../../../manager.dart';
import '../../../home/data/repos/saved_repo/saved_repo_impl.dart';
import '../../../home/presentation/manager/saved_manager/cubit/saved_cubit.dart';
import '../../../home/presentation/manager/saved_manager/is_saved_manager/cubit/is_saved_cubit.dart';
import '../../../widgets/app_bar_with_backdrop.dart';
import '../../../widgets/genre_card.dart';
import '../../../widgets/movie_details_movies_card.dart';
import '../../../widgets/movie_details_movie_poster.dart';
import '../../../widgets/movie_details_movie_title.dart';
import '../../../widgets/movie_details_rating.dart';
import '../../../widgets/movie_details_releasedate.dart';
import '../../../widgets/youtube_widget.dart';
import '../../data/models/movie_model.dart';
import '../../data/repos/movie_details_repo_impl.dart';
import '../manager/credits/cubit/credit_cubit.dart';
import '../manager/recommendations/cubit/recommendations_cubit.dart';

class MovieDetailsView extends StatefulWidget {
  const MovieDetailsView(
    this.movie, {
    super.key,
  });
  final Movie movie;
  @override
  State<MovieDetailsView> createState() => _MovieDetailsViewState();
}

class _MovieDetailsViewState extends State<MovieDetailsView> {


  bool lastStatus = true;
  late ScrollController _scrollController;

  _scrollListener() {
    if (isShrink != lastStatus) {
      setState(() {
        lastStatus = isShrink;
      });
    }
  }

  bool get isShrink {
    return _scrollController.hasClients &&
        _scrollController.offset >
            (MediaQuery.of(context).size.width * 9 / 16 - kToolbarHeight);
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          controller: _scrollController,
          slivers: [
            AppBarWithBackDrop(
                movieName: widget.movie.title,
                isShrink: isShrink,
                backDropID: widget.movie.backdropPath),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 24,
                    ),
                    child: Column(
                      children: [
                        MovieDetailsMovieTitle(movieName: widget.movie.title),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Row(
                            children: [
                              MovieDetailsMoviePoster(widget.movie.posterPath),
                              const SizedBox(width: 16),
                              SizedBox(
                                height: 225,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    MovieDetailsRating(
                                        widget.movie.voteAverage),
                                    const SizedBox(height: 16),
                                    MovieDetailsReleaseDate(
                                        releaseDate: widget.movie.releaseDate),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        MovieDetailsButton(widget.movie),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Genres",
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          const SizedBox(height: 8),
                          Wrap(
                            children: [
                              for (int i = 0;
                                  i < widget.movie.genreID.length;
                                  i++)
                                GenreCard(GenreManager.getGenreByID(
                                    widget.movie.genreID[i])),
                            ],
                          ),
                          const SizedBox(height: 24),
                          Text(
                            "Overview",
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          const SizedBox(height: 8),
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              widget.movie.overview,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                          const SizedBox(height: 24),
                          Text(
                            "Trailer",
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          const SizedBox(height: 8),
                          YoutubeWidget(widget.movie.id),
                          const SizedBox(height: 24),
                          Text(
                            "Cast",
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          const SizedBox(height: 8),
                          Credits(widget.movie.id),
                          Text(
                            "Recommended Movies",
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          const SizedBox(height: 8),
                          Recommendations(widget.movie.id),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MovieDetailsButton extends StatelessWidget {
  const MovieDetailsButton(
    this.movie, {
    super.key,
  });
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    // IsSavedCubit.get(context).isSaved(movie.id);
    return BlocProvider(
      create: (context) => IsSavedCubit(getIt.get<SavedRepoImpl>())..isSaved(movie.id),
      child: BlocBuilder<IsSavedCubit, IsSavedState>(
        builder: (context, state) {
          if (state is IsSavedSuccess) {
            return Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: state.isSaved
                    ? ColorManager.blues
                    : ColorManager.lightBlacks,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color:
                      state.isSaved ? Colors.transparent : ColorManager.blues,
                  width: 2,
                ),
              ),
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: state.isSaved
                      ? ColorManager.lightBlacks
                      : ColorManager.blues,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () {
                  if (state.isSaved) {
                    SavedCubit.get(context).deleteMovie(movie.id);
                  } else {
                    SavedCubit.get(context).saveMovie(movie);
                  }
                  IsSavedCubit.get(context).isSaved(movie.id);
                },
                child: Text(
                  state.isSaved ? "Remove From Saved" : "Add to Saved",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class Credits extends StatelessWidget {
  const Credits(
    this.movieID, {
    super.key,
  });

  final int movieID;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CreditCubit(getIt.get<MovieDetailsRepoImpl>())..getCredits(movieID),
      child: BlocBuilder<CreditCubit, CreditState>(
        builder: (context, state) {
          if (state is CreditSuccess) {
            return SizedBox(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.actors.length,
                itemBuilder: (BuildContext context, int index) {
                  return MovieDetailsActorCard(state.actors[index]);
                },
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class Recommendations extends StatelessWidget {
  const Recommendations(
    this.movieID, {
    super.key,
  });
  final int movieID;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          RecommendationsCubit(getIt.get<MovieDetailsRepoImpl>())
            ..getRecommendations(movieID),
      child: BlocBuilder<RecommendationsCubit, RecommendationsState>(
        builder: (context, state) {
          if (state is RecommendationsSuccess) {
            return SizedBox(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.movies.length,
                itemBuilder: (BuildContext context, int index) {
                  return MovieDetailsMovieCard(state.movies[index]);
                },
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
