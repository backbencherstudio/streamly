import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:streamly/view/home/home.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const Home(),
      ),
      // Add more routes here
    ],
  );
}
