import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../features/connectivity/no_connectivity.dart';
import '../features/details/detail_screen.dart';
import '../features/todo-list/todo_list_screen.dart';
import '../provider/connectivity/connectivity_provider.dart';

final navigatorKeyKeyProvider = Provider<GlobalKey<NavigatorState>>((ref) {
  return GlobalKey<NavigatorState>();
});
final routerProvider = Provider<GoRouter>((ref) {
  final connectivityResult = ref.watch(connectivityProvider);
  final navigatorKey = ref.read(navigatorKeyKeyProvider);

  return GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: connectivityResult.value != ConnectivityResult.none
        ? '/'
        : '/connectivity-error',
    routes: [
      GoRoute(
        path: "/",
        name: "/",
        builder: (context, state) => const TodoListScreen(),
      ),
      GoRoute(
        path: "/todo-item-detail",
        name: '/todo-item-detail',
        builder: (context, state) {
          return TodoItemDetailScreen(
            todoId: state.queryParameters['todo-id'] ?? "",
          );
        },
      ),
      GoRoute(
        path: "/connectivity-error",
        name: "/connectivity-error",
        builder: (context, state) {
          return const ConnectivityErrorPage();
        },
      )
    ],
  );
});
