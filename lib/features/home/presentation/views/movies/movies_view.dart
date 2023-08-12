import 'package:flutter/material.dart';
import 'package:movies_wallet/features/see_more/presentation/view/see_more_view.dart';

import '../widget/movie_card_widget.dart';

class MoviesView extends StatelessWidget {
  const MoviesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 300,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: InkWell(
                    child: MovieCard(),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SeeMoreView()));
                    }),
              );
            }),
      ),
    );
  }
}
