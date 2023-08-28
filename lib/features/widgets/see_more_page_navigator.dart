import 'package:flutter/material.dart';

import '../see_more/presentation/manager/see_more_cubit_cubit.dart';

class SeeMorePageNavigator extends StatelessWidget {
  const SeeMorePageNavigator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              SeeMoreCubit.get(context).goToPreviousPage();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          Text(
            '${SeeMoreCubit.get(context).pageNumber} / ${SeeMoreCubit.get(context).totalPages}',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            onPressed: () {
              SeeMoreCubit.get(context).goToNextPage();
            },
            icon: const Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    );
  }
}
