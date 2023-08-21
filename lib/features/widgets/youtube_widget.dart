import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YoutubeWidget extends StatelessWidget {
  const YoutubeWidget({Key? key, required this.vidID}) : super(key: key);

  final String vidID;

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: YoutubePlayerController.fromVideoId(
        videoId: vidID,
        autoPlay: false,
        params: const YoutubePlayerParams(showFullscreenButton: false),
      ),
    );
  }
}
