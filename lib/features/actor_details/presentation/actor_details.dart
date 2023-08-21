import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

// import '../../widgets/movie_tile_widget.dart';

class ActorDetails extends StatelessWidget {
  const ActorDetails({Key? key}) : super(key: key);

  final String imgURL =
      "https://image.tmdb.org/t/p/w500/5qHNjhtjMD4YWH3UP0rm4tKwxCL.jpg";
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
                  ActorDetailsImage(imgURL: imgURL),
                  Text(
                    "Robert Downey Jr.",
                    style: Theme.of(context).textTheme.headlineLarge,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                        start: 16, end: 16, top: 32, bottom: 16),
                    child: Text("Movies of the actor:",
                        style: Theme.of(context).textTheme.headlineMedium),
                  ),
                  // for (int i = 0; i < 15; i++) const MovieTile()
                ],
              )
            ],
          ),
        ),
      ]),
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
              imgURL,
            ),
          ),
        ),
      ),
    );
  }
}
