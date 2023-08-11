import 'package:flutter/material.dart';

import '../../manager.dart';
import '../home/presentation/views/widget/movie_details_card.dart';
import '../home/presentation/views/widget/youtube_widget.dart';

class MovieDetailsView extends StatefulWidget {
  const MovieDetailsView({super.key});

  @override
  State<MovieDetailsView> createState() => _MovieDetailsViewState();
}

class _MovieDetailsViewState extends State<MovieDetailsView> {
  final poster =
      "https://image.tmdb.org/t/p/w500/uluhlXubGu1VxU63X9VHCLWDAYP.jpg";

  final backDrop =
      "https://image.tmdb.org/t/p/w500/2o0PKGmnSgCGkzoSePNAqse8Ure.jpg";

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
          controller: _scrollController,
          slivers: [
            AppBarWithBackDrop(
                movieName: movieName, isShrink: isShrink, backDrop: backDrop),
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
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            MovieDetailsMoviePoster(poster: poster),
                            const SizedBox(width: 16),
                            SizedBox(
                              height: 225,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  MovieDetailsRating(movieRating: movieRating),
                                  const SizedBox(height: 16),
                                  MovieDetailsReleaseDate(
                                      releaseDate: releaseDate),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
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
                              for (int i = 0; i < 12; i++) const GenreCard()
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
                            poster: poster,
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

class MovieDetailsReleaseDate extends StatelessWidget {
  const MovieDetailsReleaseDate({
    super.key,
    required this.releaseDate,
  });

  final String releaseDate;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MovieDetailsCardWithOpacity(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Release Date:",
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            FittedBox(
              fit: BoxFit.fitHeight,
              child: Text(
                releaseDate,
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MovieDetailsMoviePoster extends StatelessWidget {
  const MovieDetailsMoviePoster({
    super.key,
    required this.poster,
  });

  final String poster;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 225,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: NetworkImage(poster),
        ),
      ),
    );
  }
}

class MovieDetailsMovieTitle extends StatelessWidget {
  const MovieDetailsMovieTitle({
    super.key,
    required this.movieName,
  });

  final String movieName;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 75,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: ColorManager.lightBlacks.withOpacity(0.5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Movie Title:",
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          FittedBox(
            fit: BoxFit.fitHeight,
            child: Text(
              movieName,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class MovieDetailsRating extends StatelessWidget {
  const MovieDetailsRating({
    super.key,
    required this.movieRating,
  });

  final double movieRating;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MovieDetailsCardWithOpacity(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.star,
              color: Colors.amber,
              size: 48,
            ),
            const SizedBox(width: 4),
            Text(
              movieRating.toStringAsFixed(1),
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ],
        ),
      ),
    );
  }
}

class AppBarWithBackDrop extends StatelessWidget {
  const AppBarWithBackDrop({
    super.key,
    required this.movieName,
    required this.isShrink,
    required this.backDrop,
  });

  final String movieName;
  final bool isShrink;
  final String backDrop;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: MediaQuery.of(context).size.width * 9 / 16,
      floating: false,
      pinned: true,
      centerTitle: true,
      title: Text(
        movieName,
        style: TextStyle(
          color: isShrink ? ColorManager.whites : Colors.transparent,
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width * 9 / 16,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(backDrop),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MovieDetailsCardWithOpacity extends StatelessWidget {
  const MovieDetailsCardWithOpacity({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 198,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: ColorManager.lightBlacks.withOpacity(0.5),
      ),
      child: child,
    );
  }
}

class GenreCard extends StatelessWidget {
  const GenreCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Container(
        height: 32,
        decoration: BoxDecoration(
          color: ColorManager.whites,
          borderRadius: BorderRadius.circular(16),
        ),
        child: const FittedBox(
          fit: BoxFit.scaleDown,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text("Action",
                style: TextStyle(fontSize: 16, color: ColorManager.blacks)),
          ),
        ),
      ),
    );
  }
}
