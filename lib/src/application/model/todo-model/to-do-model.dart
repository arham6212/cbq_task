import 'package:freezed_annotation/freezed_annotation.dart';

part 'to-do-model.freezed.dart';
part 'to-do-model.g.dart';

@freezed
class ToDoModel with _$ToDoModel {
  factory ToDoModel({
    required int userId,
    required int id,
    required String title,
    required bool completed,
  }) = _ToDoModel;

  factory ToDoModel.fromJson(Map<String, dynamic> json) =>
      _$ToDoModelFromJson(json);
}
