// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'to-do-model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ToDoModel _$$_ToDoModelFromJson(Map<String, dynamic> json) => _$_ToDoModel(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      completed: json['completed'] as bool,
    );

Map<String, dynamic> _$$_ToDoModelToJson(_$_ToDoModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
      'completed': instance.completed,
    };
