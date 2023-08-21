import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_wallet/core/utils/service_locator.dart';
import 'package:movies_wallet/features/home/data/repos/search_repos/search_repo_impl.dart';
// import 'package:movies_wallet/manager.dart';

import '../../../../widgets/movie_tile_widget.dart';
import '../../manager/search_manager/cubit/search_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(getIt.get<SearchRepoImpl>()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Search"),
          centerTitle: true,
        ),
        body: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  const SearchField(),
                  // const Segment(),
                  const ResultList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ResultList extends StatelessWidget {
  const ResultList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccess) {
          if (state.movies.isNotEmpty) {
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.movies.length,
              itemBuilder: (context, index) {
                return MovieTile(state.movies[index], isSearch: true);
              },
            );
          } else {
            return const Center(child: Text("No results found"));
          }
        } else if (state is SearchLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SearchFailure) {
          print(state.message);
          return const Center(child: Text("Something went wrong"));
        } else {
          return const Center(child: Text("Search for a movie or a person"));
        }
      },
    );
  }
}

// class Segment extends StatelessWidget {
//   const Segment({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<SearchCubit, SearchState>(
//       builder: (context, state) {
//         return Padding(
//           padding: const EdgeInsetsDirectional.only(
//               end: 40, start: 40, top: 8, bottom: 24),
//           child: SegmentedButton(
//             style: ButtonStyle(
//               backgroundColor: MaterialStateProperty.resolveWith<Color>(
//                 (Set<MaterialState> states) {
//                   if (states.contains(MaterialState.selected)) {
//                     return ColorManager.blues;
//                   }
//                   return Colors.transparent;
//                 },
//               ),
//               side: MaterialStateProperty.all(
//                   const BorderSide(color: ColorManager.lightBlacks, width: 2)),
//             ),
//             segments: const [
//               ButtonSegment(
//                 label: Text("Movies"),
//                 value: "Movies",
//               ),
//               ButtonSegment(
//                 label: Text("Person"),
//                 value: "Person",
//               ),
//             ],
//             selected: {SearchCubit.get(context).selectedSegment},
//             onSelectionChanged: (value) {
//               SearchCubit.get(context).changeSegment(value.first);
//             },
//           ),
//         );
//       },
//     );
//   }
// }

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
          end: 16, start: 16, top: 24, bottom: 8),
      child: TextFormField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Search keyword",
        ),
        onChanged: (value) {
          Timer(const Duration(seconds: 1), () {
            SearchCubit.get(context).searchMovie(value);
          });
        },
      ),
    );
  }
}
