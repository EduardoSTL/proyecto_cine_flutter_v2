import 'package:go_router/go_router.dart';
import 'package:proyecto_cine_flutter/presentation/screens/movies/home_screen.dart';

//definimos archivo de apertura
final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    )
  ]
);