import 'package:flutter/material.dart';

import 'features/movie_details/movie_details_view.dart';
import 'manager.dart';

void main() {
  runApp(const MoviesWallet());
}

class MoviesWallet extends StatelessWidget {
  const MoviesWallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        useMaterial3: true,
      ),
      home: const MovieDetailsView(),
    );
  }
}
