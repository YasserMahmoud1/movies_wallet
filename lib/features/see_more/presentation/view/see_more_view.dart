import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_wallet/manager.dart';

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
            title: Text(
                GenreManager.getGenreByID(SeeMoreCubit.selectedGenre ?? 0)),
            actions: [
              IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => FilterBottomSheet());
                },
                icon: const Icon(Icons.filter_alt_outlined),
              ),
            ],
          ),
          body: const Center(
            child: Text("See More View"),
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
