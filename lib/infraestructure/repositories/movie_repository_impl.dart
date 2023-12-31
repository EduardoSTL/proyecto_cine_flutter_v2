import 'package:proyecto_cine_flutter/domain/datasource/movie_datasource.dart';
import 'package:proyecto_cine_flutter/domain/entities/movie.dart';
import 'package:proyecto_cine_flutter/domain/repositories/movies_repositories.dart';

class MovieRepositoryImpl extends MoviesRepositories{
  final MovieDataSource datasource;
  MovieRepositoryImpl(this.datasource);

  @override
  Future<List<Movie>> getNowPlaying ({int page = 1}) {
    return datasource.getNowPlaying(page: page);
  }

  @override
  Future<List<Movie>> getPopular ({int page = 1}) {
    return datasource.getPopular(page: page);
  }

  @override
  Future<List<Movie>> getTopRated ({int page = 1}) {
    return datasource.getTopRated(page: page);
  }

  @override
  Future<List<Movie>> getUpcoming ({int page = 1}) {
    return datasource.getUpcoming(page: page);
  }

  @override
  Future<Movie> getMovieById(String id){
    return datasource.getMovieById(id);
  }
}