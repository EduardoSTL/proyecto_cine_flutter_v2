import 'package:proyecto_cine_flutter/domain/datasource/actors_datasource.dart';
import 'package:proyecto_cine_flutter/domain/entities/actor.dart';
import 'package:proyecto_cine_flutter/domain/repositories/actors_repositories.dart';
import 'package:proyecto_cine_flutter/infraestructure/datasources/actor_moviedb_datasource.dart';

class ActorRepositoryImpl extends ActorsRepository{
  
  final ActorsDatasource datasource;
  ActorRepositoryImpl(this.datasource);
  //! ActorRepositoryImpl(ActorMovieDbDatasource actorMovieDbDatasource, {required this.datasource});
  
  @override
  Future<List<Actor>> getActorsByMovie(String movieId){
    return datasource.getActorsByMovie(movieId);
  }
}