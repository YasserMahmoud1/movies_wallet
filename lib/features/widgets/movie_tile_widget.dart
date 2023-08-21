import 'package:flutter/material.dart';

import '../../manager.dart';
import '../movie_details/presentation/movie_details_view.dart';
import 'rating_widget.dart';

class MovieTile extends StatelessWidget {
  const MovieTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const MovieDetailsView()));
        },
        customBorder:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: ColorManager.lightBlacks.withOpacity(.5),
            borderRadius: BorderRadius.circular(24),
          ),
          child: SizedBox(
            height: 150,
            child: Row(
              children: [
                Container(
                  height: 150,
                  width: 100,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://image.tmdb.org/t/p/w500/3bhkrj58Vtu7enYsRolD1fZdja1.jpg",
                      ),
                    ),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        bottomLeft: Radius.circular(24)),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 40,
                          width: double.infinity / 2,
                          child: Text(
                            "The Godfather",
                            style: TextStyle(
                              fontSize: 24,
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.bold,
                              color: ColorManager.whites,
                            ),
                            maxLines: 2,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "1972-03-14".substring(0, 4),
                          style: TextStyle(
                            color: ColorManager.whites.withOpacity(.75),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Rating(8.0),
                            const Spacer(),
                            IconButton(
                              onPressed: () {
                                print("remove from saved");
                              },
                              icon: const Icon(Icons.bookmark,
                                  color: ColorManager.blues, size: 32),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
