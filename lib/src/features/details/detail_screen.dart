import 'package:cbq_tasks/src/features/details/widgets/to_do_detail_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../provider/todos/to_do_controller.dart';

class TodoItemDetailScreen extends ConsumerWidget {
  final String todoId;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _textEditingController = TextEditingController();

  TodoItemDetailScreen({required this.todoId, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoItemForIdProvider = ref.watch(toDoItemFutureProvider(todoId));
    todoItemForIdProvider.when(
        data: (data) {
          _textEditingController.text =
              todoItemForIdProvider.value?.title ?? '';
        },
        error: (_, s) {},
        loading: () {});
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)?.view_todo ?? ''),
        ),
        body: todoItemForIdProvider.when(
            data: (data) => TodoDetailTextFieldWidget(
                formKey: _formKey,
                textEditingController: _textEditingController),
            error: (e, s) => Center(child: Text(e.toString())),
            loading: () => const Center(child: CircularProgressIndicator())));
  }
}
