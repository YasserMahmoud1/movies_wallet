import 'package:flutter/material.dart';

import '../../manager.dart';

class MovieDetailsCardWithOpacity extends StatelessWidget {
  const MovieDetailsCardWithOpacity({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 198,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: ColorManager.lightBlacks.withOpacity(0.5),
      ),
      child: child,
    );
  }
}
