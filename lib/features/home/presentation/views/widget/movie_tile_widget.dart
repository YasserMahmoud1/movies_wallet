import 'package:flutter/material.dart';

import '../../../../../manager.dart';
import 'rating_widget.dart';

class MovieTile extends StatelessWidget {
  const MovieTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("see the saved movie details");
      },
      customBorder:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
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
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: NetworkImage(
                      "https://image.tmdb.org/t/p/w500/3bhkrj58Vtu7enYsRolD1fZdja1.jpg",
                    ),
                  ),
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 50,
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
                          color: ColorManager.whites.withOpacity(.75),),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        const Rating(8.0,big: false),
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            print("remove from saved");
                          },
                          icon: const Icon(Icons.bookmark,
                              color: ColorManager.blues),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}