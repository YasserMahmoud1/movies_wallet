import 'package:flutter/material.dart';

import '../widget/movie_tile_widget.dart';

class SavedView extends StatelessWidget {
  const SavedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Saved'),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "Movies",
              ),
              Tab(
                text: "TV shows",
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            SavedMoviesTab(),
            SavedTVShowsTab(),
          ],
        ),
      ),
    );
  }
}

class SavedTVShowsTab extends StatelessWidget {
  const SavedTVShowsTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("TV shows"),
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
      child: Padding(
        padding: EdgeInsets.all(16),
        child: MovieTile(),
      ),
    );
  }
}
