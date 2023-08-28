import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movies_wallet/features/home/presentation/manager/movies_manager/movie_cubit/cubit/movie_cubit.dart';

import '../../../../widgets/now_in_theater_moives.dart';
import '../../../../widgets/popular_movie.dart';
import '../../../../widgets/trending_movie.dart';

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
