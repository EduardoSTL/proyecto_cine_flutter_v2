import 'package:proyecto_cine_flutter/domain/entities/actor.dart';

abstract class ActorsDatasource{
  Future<List<Actor>> getActorsByMovie(String movieId);
}