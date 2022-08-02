import 'package:flutter/material.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:peliculas/providers/ui_provider.dart';
import 'package:peliculas/screens/other_screen.dart';
import 'package:peliculas/screens/popular_screen.dart';
import 'package:peliculas/widgets/custom_bottom_navigationbar.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeScreenBody(),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}

class _HomeScreenBody extends StatelessWidget {
  const _HomeScreenBody({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context);
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.screenCurrentIndex;

    switch( currentIndex ) {
      case 0:
        return PopularScreen( onNextPage: () => moviesProvider.getPopularMovies());
      case 1:
        return OtherScreen();
      default:
        return PopularScreen( onNextPage: () => moviesProvider.getPopularMovies());
    }

    return const Scaffold(
      body: Center(
        child: Text('_HomeScreenBody'),
      ),
    );
  }
}
