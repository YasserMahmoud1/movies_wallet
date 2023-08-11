import 'package:flutter/material.dart';

import '../../../../../manager.dart';

class Rating extends StatelessWidget {
  const Rating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 30,
      decoration: BoxDecoration(
        color: ColorManager.whites,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.star,
              color: Colors.amber,
              size: 24,
            ),
            Text(
              "8.0",
              style: TextStyle(
                color: ColorManager.blacks,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
