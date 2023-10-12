import 'package:flutter_dotenv/flutter_dotenv.dart';

//* variable de entorno de la api
class Enviroment{
  static String theMovieDbKey = dotenv.env['THE_MOVIEDB_KEY'] ?? 'No hay api key';
}