import 'package:cbq_tasks/src/application/model/todo-model/to-do-model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/repository/todo/todo-repository.dart';
import '../user/user_controller.dart';

final toDoListFutureProvider =
    FutureProvider.autoDispose<List<ToDoModel>>((ref) async {
  final resultProvider = ref.watch(todoProvider);

  return resultProvider.getTodoList();
});
final toDoItemFutureProvider = FutureProvider.autoDispose
    .family<ToDoModel, String>((ref, String todoId) async {
  final result = await ref.watch(todoProvider).getTodoById(todoId);
  return result;
});

final searchQueryProvider = StateProvider<String>((ref) => '');

final todoProvider = Provider<ToDoController>((ref) => ToDoController(ref));
final filteredToDoListProvider =
    Provider.family<List<ToDoModel>, List<ToDoModel>>((ref, toDoList) {
  ref.watch(searchQueryProvider);
  final query =
      ref.watch(searchQueryProvider.notifier).state.trim().toLowerCase();
  final userId = ref.watch(userIdProvider);
  return toDoList
      .where((toDo) =>
          toDo.title.toLowerCase().contains(query) &&
          toDo.userId.toString() == userId)
      .toList();
});

class ToDoController {
  ToDoController(this.ref);

  final Ref ref;

  Future<List<ToDoModel>> getTodoList() async {
    return ref.read(todoRepositoryProvider).getTodoList();
  }

  Future<ToDoModel> getTodoById(String todoId) async {
    return ref.read(todoRepositoryProvider).getTodoById(todoId);
  }
}
