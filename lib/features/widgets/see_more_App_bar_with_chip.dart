import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/functions/see_more_show_genres_bottom_sheet.dart';
import '../../manager.dart';
import '../see_more/presentation/manager/see_more_cubit_cubit.dart';

class SeeMoreAppBarActionChip extends StatelessWidget {
  const SeeMoreAppBarActionChip({
    super.key,
    required this.mode,
  });
  final SeeMoreModes mode;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<SeeMoreCubit>(context),
      child: BlocBuilder<SeeMoreCubit, SeeMoreCubitState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ActionChip(
              backgroundColor: SeeMoreCubit.get(context).selectedGenre != null
                  ? ColorManager.blues
                  : ColorManager.lightBlacks,
              side: const BorderSide(
                color: ColorManager.blues,
                width: 1.0,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              label: Text(GenreManager.getGenreByID(
                  SeeMoreCubit.get(context).selectedGenre)),
              onPressed: () {
                showGenresBottomSheet(context);
              },
            ),
          );
        },
      ),
    );
  }
}
