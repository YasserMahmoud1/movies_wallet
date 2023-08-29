import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_wallet/features/home/presentation/manager/saved_manager/cubit/saved_cubit.dart';

import '../../../../widgets/movie_tile_widget.dart';

// import '../../../../widgets/movie_tile_widget.dart';

class SavedView extends StatelessWidget {
  const SavedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SavedCubit.get(context).getData();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved'),
        centerTitle: true,
      ),
      body: BlocBuilder<SavedCubit, SavedState>(
        builder: (context, state) {
          if (state is SavedSuccess) {
            if (state.movies.isEmpty) {
              return const Center(child: Text('No movies saved'));
            } else {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: state.movies.length,
                itemBuilder: (BuildContext context, int index) {
                  return MovieTile(state.movies[index], isSaved: true);
                },
              );
            }
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
