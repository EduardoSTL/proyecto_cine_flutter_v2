import 'package:proyecto_cine_flutter/domain/entities/movie.dart';

abstract class MovieDataSource{

  Future<List<Movie>> getNowPlaying({int page = 1});

  Future<List<Movie>> getPopular({int page = 1});
  
  Future<List<Movie>> getUpcoming({int page = 1});
  
  Future<List<Movie>> getTopRated({int page = 1});
}