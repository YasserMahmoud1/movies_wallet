import 'package:flutter/material.dart';

import '../../../../../manager.dart';

class Rating extends StatelessWidget {
  const Rating(
    this.rating, {
    super.key,
    required this.big,
  });
  final bool big;
  final double rating;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: big ? 100 : 60,
      height: big ? 50 : 30,
      decoration: BoxDecoration(
        color: ColorManager.whites,
        borderRadius: BorderRadius.circular(60),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: big ? 12 : 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.star,
              color: Colors.amber,
              size: big ? 40 : 24,
            ),
            Text(
              rating.toString(),
              style: TextStyle(
                  color: ColorManager.blacks,
                  fontSize: big ? 24 : 13,
                  fontWeight: FontWeight.bold,),
            ),
          ],
        ),
      ),
    );
  }
}
