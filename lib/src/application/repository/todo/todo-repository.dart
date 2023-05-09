import 'package:cbq_tasks/src/application/model/todo-model/to-do-model.dart';
import 'package:cbq_tasks/src/application/repository/todo/todo-repository-impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../api_connection/connectivity_service.dart';


abstract class TodoRepository {
  Future<List<ToDoModel>> getTodoList();
  Future<ToDoModel> getTodoById(String todoId);
}

final todoRepositoryProvider = Provider<TodoRepository>((ref) {
  final httpService = ref.watch(httpServiceProvider);

  return TodoRepositoryImpl(httpService);
});
