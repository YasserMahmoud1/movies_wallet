import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_wallet/features/widgets/see_more_page_navigator.dart';

import '../see_more/presentation/manager/see_more_cubit_cubit.dart';
import 'movie_tile_widget.dart';

class SeeMoreBody extends StatelessWidget {
  const SeeMoreBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SeeMoreCubit, SeeMoreCubitState>(
      builder: (context, state) {
        if (state is SeeMoreCubitSuccess) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(height: 24),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.model.movie.length,
                  itemBuilder: (context, index) {
                    return MovieTile(state.model.movie[index], isSaved: false);
                  },
                ),
                const SeeMorePageNavigator()
              ],
            ),
          );
        } else if (state is SeeMoreCubitFailure) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
