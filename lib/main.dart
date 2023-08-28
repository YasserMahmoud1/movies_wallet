import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_wallet/features/home/data/repos/saved_repo/saved_repo_impl.dart';
import 'package:movies_wallet/features/home/presentation/manager/movies_manager/movie_cubit/cubit/movie_cubit.dart';

import 'core/utils/service_locator.dart';
import 'features/home/presentation/manager/home_manager/home_bloc.dart';
import 'features/home/presentation/manager/saved_manager/cubit/saved_cubit.dart';
import 'features/home/presentation/views/home/home_view.dart';
import 'manager.dart';

void main() async {
  setup();
  runApp(const MoviesWallet());
}

class MoviesWallet extends StatelessWidget {
  const MoviesWallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>(
          create: (context) => HomeCubit(),
        ),
        BlocProvider(create: (context) => MovieCubit()..getMoviesData()),
        BlocProvider(
            create: (context) => SavedCubit(getIt.get<SavedRepoImpl>())
              ..getData()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: ColorManager.blacks,
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: ColorManager.lightBlacks,
            selectedItemColor: ColorManager.blues,
            unselectedItemColor: ColorManager.whites,
            type: BottomNavigationBarType.fixed,
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: ColorManager.lightBlacks,
          ),
          tabBarTheme: const TabBarTheme(
            indicatorColor: ColorManager.blues,
            labelColor: ColorManager.blues,
          ),
          inputDecorationTheme: InputDecorationTheme(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide:
                  const BorderSide(color: ColorManager.lightBlacks, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: ColorManager.blues, width: 2),
            ),
          ),
          textTheme: TextTheme(
            headlineMedium: const TextStyle(
              color: ColorManager.whites,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            headlineLarge: const TextStyle(
              color: ColorManager.whites,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
            headlineSmall: const TextStyle(
              color: ColorManager.whites,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            bodyLarge: const TextStyle(
              color: ColorManager.whites,
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
            bodyMedium: TextStyle(
              color: ColorManager.whites.withOpacity(.75),
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),
          ),
          useMaterial3: true,
        ),
        home: const HomeView(),
      ),
    );
  }
}
