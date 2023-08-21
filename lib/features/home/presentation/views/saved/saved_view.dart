import 'package:flutter/material.dart';

// import '../../../../widgets/movie_tile_widget.dart';

class SavedView extends StatelessWidget {
  const SavedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved'),
        centerTitle: true,
      ),
      body: SavedMoviesTab(),
    );
  }
}

class SavedMoviesTab extends StatelessWidget {
  const SavedMoviesTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      // child: MovieTile(),
    );
  }
}
