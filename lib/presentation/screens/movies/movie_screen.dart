import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_cine_flutter/domain/entities/movie.dart';

class MovieScreen extends ConsumerStatefulWidget{
  static const name = 'movie-screen';

  final String movieId;

  const MovieScreen({
    super.key,
    required this.movieId
  });

  @override
  MovieScreenState createState() => MovieScreenState();
}

class MovieScreenState extends ConsumerState<MovieScreen> {

  @override
  void initState() {
    super.initState();

    ref.read(movieInfoProvider.notifier).loadMovie(widget.movieId);
    ref.read(actorsByMovieProvider.notifier).loadActors(widget.actorsId);
    //ref.read(actorsByMovieProvider.notifier).loadActors(widget.movieId);

    @override
    Widget build(BuildContext context){
      final Movie? movie = ref.watch(movieInfoProvider)[widget.movieId];

      if (movie == null){
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(strokeWidth: 2)
          ));
      }
      return Scaffold(
        body: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: [
            _CustomSilverAppBar(movie: movie),
            SliverList(delegate: SliverChildBuilderDelegate(
              (context, index) => _MovieDetails(movie: movie),
              childCount: 1
              ))
          ],
        ),
      );
    }
  }
}

class _MovieDetails extends StatelessWidget {

  final Movie movie;

  const _MovieDetails({
    required this.movie
  })

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final TextStyle = Theme.of(context).textTheme;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Image
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(movie.posterPath,
                width: size.width * 0.3,
                ),
              ),
              SizedBox(
                width: (size.width - 40) * 0.7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(movie.title, style: TextStyle.titleLarge),
                    Text(movie.overview)
                  ],
                ),
              ),
            ],
          ),
          )
      ],
    );
  }
}