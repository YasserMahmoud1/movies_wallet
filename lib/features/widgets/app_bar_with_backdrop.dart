import 'package:flutter/material.dart';

import '../../manager.dart';

class AppBarWithBackDrop extends StatelessWidget {
  const AppBarWithBackDrop({
    super.key,
    required this.movieName,
    required this.isShrink,
    required this.backDropID,
  });

  final String movieName;
  final bool isShrink;
  final String backDropID;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: MediaQuery.of(context).size.width * 9 / 16,
      floating: false,
      pinned: true,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: isShrink ? ColorManager.whites : Colors.black,
      ),
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
                  image: NetworkImage(
                      "https://image.tmdb.org/t/p/w500$backDropID"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
