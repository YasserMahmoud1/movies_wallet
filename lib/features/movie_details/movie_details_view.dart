import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../../manager.dart';
import '../home/presentation/views/widget/rating_widget.dart';

class MovieDetailsView extends StatelessWidget {
  const MovieDetailsView({super.key});
  final poster =
      "https://image.tmdb.org/t/p/w500/uluhlXubGu1VxU63X9VHCLWDAYP.jpg";
  final backDrop =
      "https://image.tmdb.org/t/p/w500/2o0PKGmnSgCGkzoSePNAqse8Ure.jpg";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(backDrop),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.width * 3 / 12),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2,
                      height: MediaQuery.of(context).size.width * 3 / 4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: ColorManager.blues, width: 3),
                        image: DecorationImage(
                          image: NetworkImage(poster),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 24),
              Align(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "The Hangover",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 16),
                    const Rating(),
                    const SizedBox(height: 16),
                    MaterialButton(
                        onPressed: () {}, child: const Text("Add to saved")),
                  ],
                ),
              ),
              Text(
                "Genres",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const Wrap(
                children: [
                  Chip(
                    label: Text("Action"),
                  ),
                  Chip(
                    label: Text("Action"),
                  ),
                  Chip(
                    label: Text("Action"),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text(
                "Overview",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 16),
              const SizedBox(
                width: double.infinity,
                child: Text(
                  "When three friends finally come to after a raucous night of bachelor-party revelry, they find a baby in the closet and a tiger in the bathroom. But they can't seem to locate their best friend, Doug – who's supposed to be tying the knot. Launching a frantic search for Doug, the trio perseveres through a nasty hangover to try to make it to the church on time.",
                ),
              ),
              const SizedBox(height: 24),
              Text(
                "Trailer",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 16),
              YoutubeWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class YoutubeWidget extends StatelessWidget {
  YoutubeWidget({Key? key}) : super(key: key);

  final _controller = YoutubePlayerController.fromVideoId(
    videoId: 'Vbnuhoe9gEo',
    autoPlay: false,
    params: const YoutubePlayerParams(showFullscreenButton: false),
  );

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: _controller,
    );
  }
}
