import 'package:dio/dio.dart';
import 'package:proyecto_cine_flutter/config/constants/flutter_dotenv.dart';
import 'package:proyecto_cine_flutter/domain/datasource/actors_datasource.dart';
import 'package:proyecto_cine_flutter/domain/entities/actor.dart';
import 'package:proyecto_cine_flutter/infraestructure/mappers/actor_mapper.dart';
import 'package:proyecto_cine_flutter/infraestructure/models/moviedb/credits_respponse.dart';

class ActorMovieDbDatasource extends ActorsDatasource{

  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {
      'api_key': Enviroment.theMovieDbKey,
      'language': 'es-MX'
    }
  ));

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    final response = await dio.get(
      '/movie/$movieId/credits'
    );

    final castResponse = CreditsResponse.fromJson(response.data);

    List<Actor> actors = castResponse.cast.map(
      (cast) => ActorMapper.castToEntity(cast)
      ).toList();

      return actors;
  }
}