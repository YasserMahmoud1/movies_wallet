import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_wallet/features/movie_details/presentation/manager/trailer/cubit/trailer_cubit.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../../core/utils/service_locator.dart';
import '../movie_details/data/repos/movie_details_repo_impl.dart';

class YoutubeWidget extends StatelessWidget {
  const YoutubeWidget(this.movieID, {Key? key}) : super(key: key);
  final int movieID;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TrailerCubit(getIt.get<MovieDetailsRepoImpl>())..getTrailer(movieID),
      child: BlocBuilder<TrailerCubit, TrailerState>(
        builder: (context, state) {
          if (state is TrailerSuccess) {
            return YoutubePlayer(
              controller: YoutubePlayerController.fromVideoId(
                videoId: state.trailerID,
                autoPlay: false,
                params: const YoutubePlayerParams(showFullscreenButton: false),
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
