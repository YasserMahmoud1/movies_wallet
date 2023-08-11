import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/home_manager/home_bloc.dart';
import '../../manager/home_manager/home_states.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: HomeCubit.screans[HomeCubit.currentIndex],
            bottomNavigationBar: Material(
              child: BottomNavigationBar(
                onTap: (value) {
                  HomeCubit.get(context).changeNavBar(value);
                },
                currentIndex: HomeCubit.currentIndex,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.movie_creation_outlined),
                    label: "Movie",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.live_tv),
                    label: "TV show",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.search),
                    label: "Search",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.bookmark_outline),
                    label: "Saved",
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
