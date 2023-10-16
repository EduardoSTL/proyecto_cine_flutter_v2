import 'dart:js';

import 'package:go_router/go_router.dart';
import 'package:proyecto_cine_flutter/presentation/screens/movies/home_screen.dart';
import 'package:proyecto_cine_flutter/presentation/screens/movies/movie_screen.dart';

//definimos archivo de apertura
final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: 'movie/:id',
          name: MovieScreen.name,
          builder: (context, state) {
            final movieId = state.params['id'] ?? 'no-id';

            return MovieScreen(movieId: movieId);
          }
        )
      ]
    )
  ]
);