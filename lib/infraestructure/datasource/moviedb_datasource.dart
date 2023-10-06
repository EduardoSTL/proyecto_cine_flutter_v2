
import 'dart:convert';
import 'package:proyecto_cine_flutter/config/constants/flutter_dotenv.dart';
import 'package:proyecto_cine_flutter/domain/datasource/movie_datasource.dart';
import 'package:proyecto_cine_flutter/domain/entities/movie.dart';

class MoviedbDatasource extends MovieDataSource{

  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {
      'api_key': Enviroment.theMovieDbKey,
      'language': 'es-MX'
    }
  ));

  List<Movie> _jsonToMovies(Map<Stirng.dynamic> json){

    final mvieDBResponse = MoviedbDatasource.fromJson(json);

    final List<Movie> movies = MovieDBResponse.results
    .where((moviedb) => moviedb.posterPath!= 'no poster')
    .map(
      (moviedb) => MovieMapper.movieDBToEntity(moviedb)
    ).toList();

    return movies;
  }

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async{
    final response = await dio.get(
    '/movie/popular',
    queryParameters: {
      'page': page
    }
    );
    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) async{
    final response = await dio.get(
      '/movie/top_rated',
      queryParameters: {
      'page': page
      }
    );
        return _jsonToMovies(response.data);

  }
}