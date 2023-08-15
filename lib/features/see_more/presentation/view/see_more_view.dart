import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_wallet/manager.dart';

import '../../../home/presentation/views/widget/movie_tile_widget.dart';
import '../manager/see_more_cubit_cubit.dart';

class SeeMoreView extends StatefulWidget {
  const SeeMoreView({Key? key}) : super(key: key);

  @override
  State<SeeMoreView> createState() => _SeeMoreViewState();
}

class _SeeMoreViewState extends State<SeeMoreView> {
  @override
  initState() {
    super.initState();
    SeeMoreCubit.get(context).initial();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SeeMoreCubit, SeeMoreCubitState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Trending Movies"),
            centerTitle: true,
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ActionChip(
                  backgroundColor: SeeMoreCubit.selectedGenre != null
                      ? ColorManager.blues
                      : ColorManager.lightBlacks,
                  // selectedColor: ColorManager.blues,
                  // iconTheme: const IconThemeData(color: ColorManager.whites),
                  side: const BorderSide(
                    color: ColorManager.blues,
                    width: 1.0,
                  ),

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  label: Text(
                      GenreManager.getGenreByID(SeeMoreCubit.selectedGenre)),
                  // selected: SeeMoreCubit.selectedGenre != null,
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => FilterBottomSheet());
                  },
                ),
              ),
            ],
          ),
          body: const Center(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: MovieTile(),
            ),
          ),
        );
      },
    );
  }
}

class FilterBottomSheet extends StatelessWidget {
  FilterBottomSheet({super.key});
  final List<String> listOfGenres = GenreManager.getGenresValues();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SeeMoreCubit, SeeMoreCubitState>(
      builder: (context, state) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16.0),
          child: Wrap(
            spacing: 5.0,
            children: [
              for (var i = 0; i < listOfGenres.length; i++)
                ChoiceChip(
                  backgroundColor: ColorManager.lightBlacks,
                  selectedColor: ColorManager.blues,
                  // iconTheme: const IconThemeData(color: ColorManager.whites),
                  side: const BorderSide(
                    color: ColorManager.blues,
                    width: 1.0,
                  ),

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  label: Text(listOfGenres[i]),
                  selected: GenreManager.getGenreByID(
                          SeeMoreCubit.selectedGenre ?? 0) ==
                      listOfGenres[i],
                  onSelected: (selected) {
                    SeeMoreCubit.get(context).selectGenre(
                        GenreManager.getGenreByName(listOfGenres[i]));
                    Navigator.pop(context);
                  },
                ),
            ],
          ),
        );
      },
    );
  }
}
