
import 'package:flutter/material.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:peliculas/providers/ui_provider.dart';
import 'package:peliculas/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => MoviesProvider(), lazy: true),
        ChangeNotifierProvider(create: ( _ ) => UiProvider(), lazy: true),
      ],
      child: AppMovies(),
    );
  }
}

class AppMovies extends StatelessWidget {
  const AppMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'home': ( _ ) => HomeScreen()
      },
    );
  }
}
