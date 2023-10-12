import 'package:dio/dio.dart';
import 'package:proyecto_cine_flutter/config/constants/flutter_dotenv.dart';
import 'package:proyecto_cine_flutter/domain/datasource/movie_datasource.dart';
import 'package:proyecto_cine_flutter/domain/entities/movie.dart';
import 'package:proyecto_cine_flutter/infraestructure/mappers/movie_mapper.dart';
import 'package:proyecto_cine_flutter/infraestructure/models/moviedb_response.dart';

class MoviedbDatasource extends MovieDataSource{

  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {
      'api_key': Enviroment.theMovieDbKey,
      'language': 'es-MX'
    }
  ));

  List<Movie> _jsonToMovies(Map<String, dynamic> json){

    final movieDBResponse = MovieDbResponse.fromJson(json);

    final List<Movie> movies = movieDBResponse.results
    .where((moviedb) => moviedb.posterPath != 'no poster')
    .map(
      (moviedb) => MovieMapper.movieDBToEntity(moviedb)
    ).toList();

    return movies;
  }

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get(
    '/movie/now_playing',
    queryParameters: {
      'page': page
    }
    );
    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
    final response = await dio.get(
      '/movie/top_rated',
      queryParameters: {
      'page': page
      }
    );
        return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async {
    final response = await dio.get(
    '/movie/upcoming',
    queryParameters: {
      'page': page
    }
    );
    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    final response = await dio.get(
    '/movie/popular',
    queryParameters: {
      'page': page
    }
    );
    return _jsonToMovies(response.data);
  }
}