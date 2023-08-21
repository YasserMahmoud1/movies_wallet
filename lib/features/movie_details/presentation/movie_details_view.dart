import 'package:flutter/material.dart';

import '../../../manager.dart';
import '../../widgets/app_bar_with_backdrop.dart';
import '../../widgets/genre_card.dart';
import '../../widgets/movie_details_card.dart';
import '../../widgets/movie_details_movie_poster.dart';
import '../../widgets/movie_details_movie_title.dart';
import '../../widgets/movie_details_rating.dart';
import '../../widgets/movie_details_releasedate.dart';
import '../../widgets/youtube_widget.dart';

class MovieDetailsView extends StatefulWidget {
  const MovieDetailsView({super.key});

  @override
  State<MovieDetailsView> createState() => _MovieDetailsViewState();
}

class _MovieDetailsViewState extends State<MovieDetailsView> {
  final posterID =
      "/uluhlXubGu1VxU63X9VHCLWDAYP.jpg";

  final backDropID =
      "/2o0PKGmnSgCGkzoSePNAqse8Ure.jpg";

  final actorName = "Bradley Cooper";

  final actorRole = "Phil Wenneck";

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

  final String movieName = "The Hangover";
  final double movieRating = 8.565;
  final String releaseDate = "2009-06-02";
  final isSaved = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          controller: _scrollController,
          slivers: [
            AppBarWithBackDrop(
                movieName: movieName, isShrink: isShrink, backDropID: backDropID),
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
                        MovieDetailsMovieTitle(movieName: movieName),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Row(
                            children: [
                              MovieDetailsMoviePoster(poster: posterID),
                              const SizedBox(width: 16),
                              SizedBox(
                                height: 225,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    MovieDetailsRating(
                                        movieRating: movieRating),
                                    const SizedBox(height: 16),
                                    MovieDetailsReleaseDate(
                                        releaseDate: releaseDate),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            color: isSaved
                                ? ColorManager.blues
                                : ColorManager.lightBlacks,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: isSaved
                                  ? Colors.transparent
                                  : ColorManager.blues,
                              width: 2,
                            ),
                          ),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: isSaved
                                  ? ColorManager.lightBlacks
                                  : ColorManager.blues,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              isSaved ? "Remove From Saved" : "Add to Saved",
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ),
                        ),
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
                              GenreCard(genre: "Comedy"),
                              GenreCard(genre: "Action"),
                              GenreCard(genre: "Drama"),
                              GenreCard(genre: "Musical"),
                              GenreCard(genre: "Adventure"),
                              GenreCard(genre: "Sci-Fi"),
                              GenreCard(genre: "Comedy"),
                              GenreCard(genre: "Action"),
                              GenreCard(genre: "Drama"),
                              GenreCard(genre: "Musical"),
                              GenreCard(genre: "Adventure"),
                              GenreCard(genre: "Sci-Fi"),
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
                              "When three friends finally come to after a raucous night of bachelor-party revelry, they find a baby in the closet and a tiger in the bathroom. But they can't seem to locate their best friend, Doug – who's supposed to be tying the knot. Launching a frantic search for Doug, the trio perseveres through a nasty hangover to try to make it to the church on time.",
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                          const SizedBox(height: 24),
                          Text(
                            "Trailer",
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          const SizedBox(height: 8),
                          const YoutubeWidget(vidID: "tlize92ffnY"),
                          const SizedBox(height: 24),
                          Text(
                            "Cast",
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          const SizedBox(height: 8),
                          MovieDetailsCard(
                            poster: posterID,
                            actorName: actorName,
                            actorRole: actorRole,
                            isMovie: false,
                          ),
                          Text(
                            "Recommended Movies",
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          const SizedBox(height: 8),
                          MovieDetailsCard(
                            poster: posterID,
                            actorName: actorName,
                            actorRole: actorRole,
                            isMovie: true,
                            rating: 8.5,
                          ),
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



