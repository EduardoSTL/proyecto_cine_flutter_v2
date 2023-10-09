import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_cine_flutter/infraestructure/datasources/moviedb_datasource.dart';
import 'package:proyecto_cine_flutter/infraestructure/repositories/movie_repository_impl.dart';

//este repo es inmutable
final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(MoviedbDatasource());
});