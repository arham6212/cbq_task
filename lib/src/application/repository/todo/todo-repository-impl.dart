import 'package:cbq_tasks/src/application/model/todo-model/to-do-model.dart';
import 'package:cbq_tasks/src/application/repository/todo/todo-repository.dart';

import '../../../api_connection/connectivity_service.dart';


class TodoRepositoryImpl implements TodoRepository {
  final HttpService _httpService;
  TodoRepositoryImpl(this._httpService);

  @override
  Future<List<ToDoModel>> getTodoList() async {
    final response = await _httpService.get('todos/');
    final List<dynamic> data = response as List<dynamic>;
    return data.map((json) => ToDoModel.fromJson(json)).toList();
  }

  @override
  Future<ToDoModel> getTodoById(String todoId) async {
    final response = await _httpService.get('todos/$todoId');
    return ToDoModel.fromJson(response);
  }
}
