//Este repo es inmutable
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_cine_flutter/infraestructure/datasources/actor_moviedb_datasource.dart';
import 'package:proyecto_cine_flutter/infraestructure/repositories/actor_repository_impl.dart';

final actorsRepositoryProvider = Provider((ref) {
  return ActorRepositoryImpl(ActorMovieDbDatasource());
});