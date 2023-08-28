import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/see_more/presentation/manager/see_more_cubit_cubit.dart';
import '../../manager.dart';

void showGenresBottomSheet(BuildContext context) {
  final List<String> listOfGenres = GenreManager.getGenresValues();
  showModalBottomSheet(
    context: context,
    builder: (_) {
      return BlocProvider<SeeMoreCubit>.value(
        value: BlocProvider.of<SeeMoreCubit>(context),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16.0),
          child: Wrap(
            spacing: 5.0,
            children: [
              for (var i = 0; i < listOfGenres.length; i++)
                ChoiceChip(
                  backgroundColor: ColorManager.lightBlacks,
                  selectedColor: ColorManager.blues,
                  side: const BorderSide(
                    color: ColorManager.blues,
                    width: 1.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  label: Text(listOfGenres[i]),
                  selected: GenreManager.getGenreByID(
                          SeeMoreCubit.get(context).selectedGenre ?? 0) ==
                      listOfGenres[i],
                  onSelected: (selected) {
                    SeeMoreCubit.get(context).selectGenre(
                        GenreManager.getGenreByName(listOfGenres[i]));
                    Navigator.pop(context);
                  },
                ),
            ],
          ),
        ),
      );
    },
  );
}
