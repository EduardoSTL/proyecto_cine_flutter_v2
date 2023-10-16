import 'package:proyecto_cine_flutter/domain/entities/actor.dart';

abstract class ActorsRepository{
  Future<List<Actor>> getActorsByMovie(String movie);
}