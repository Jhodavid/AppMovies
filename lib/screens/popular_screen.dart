import 'package:flutter/material.dart';
import 'package:peliculas/models/movies_model.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class PopularScreen extends StatefulWidget {

  final Function onNextPage;

  const PopularScreen({Key? key, required this.onNextPage}) : super(key: key);

  @override
  State<PopularScreen> createState() => _PopularScreenState();
}

class _PopularScreenState extends State<PopularScreen> {
  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context);

    final List<Widget> popularCards = [];
    for ( int i=0; i<moviesProvider.popularMovies.length; i++ ) {
      popularCards.add(
          _MovieCard( movie: moviesProvider.popularMovies[i],)
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Expanded(
          child: GridView.count(
              controller: scrollController,
              crossAxisCount: 2,
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              children: popularCards,
              // controller: ,
          ),
        )
        ,
      )
    );
  }

  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {

      if ( scrollController.position.pixels >= scrollController.position.maxScrollExtent-500 ) {
        //ToDo: Llamar al provider
        print('Obtener siguiente página');
        widget.onNextPage();
      }

    });
  }
}

class _MovieCard extends StatelessWidget {

  final Movie movie;

  const _MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {

    return Card(
      // color: Colors.green,
      margin: const EdgeInsets.symmetric( horizontal: 10, vertical: 5 ),
        child: Container(
          margin: const EdgeInsets.symmetric( vertical: 5 ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  placeholder: AssetImage('assets/No_Picture.jpg'),
                  image: NetworkImage(movie.fullPosterImg),
                  // width: 130,
                  height: 140,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox( height: 5 ),

              Container(
                child: Text(
                  movie.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle( fontSize: 12 ),
                ),
              )
            ],
          ),
        ),
    );
  }
}

