import 'package:flutter/material.dart';

import '../../manager.dart';

class Rating extends StatelessWidget {
  const Rating(
    this.rating, {
    super.key,
  });
  final double rating;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 30,
      decoration: BoxDecoration(
        color: ColorManager.whites.withOpacity(.9),
        borderRadius: BorderRadius.circular(60),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.star,
              color: Colors.amber,
              size: 24,
            ),
            Text(
              rating.toStringAsFixed(1),
              style: const TextStyle(
                color: ColorManager.blacks,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
