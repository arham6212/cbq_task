import 'package:cbq_tasks/src/features/todo-list/widgets/todo_list_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../provider/todos/to_do_controller.dart';
import '../common_widgets/body_and_app_bar.dart';
import '../profile/profile_widget.dart';

class TodoListScreen extends ConsumerWidget {
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final result = ref.watch(toDoListFutureProvider);

    return Scaffold(
      endDrawer: const ProfileDrawer(),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: BodyAndAppBarNestedScrollView(
          appBarTitle: AppLocalizations.of(context)?.appTitle ?? '',
          body: result.when(
            data: (todoList) {
              final filteredToDoList =
                  ref.watch(filteredToDoListProvider(todoList));
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 24),
                  if (filteredToDoList.isEmpty) ...[
                    Expanded(
                      child: Center(
                        child: Text(
                            AppLocalizations.of(context)?.noTodosFound ?? ''),
                      ),
                    ),
                  ] else ...[
                    Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemCount: filteredToDoList.length,
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            return ToListItemWidget(
                              id: filteredToDoList[index].id.toString(),
                              title: filteredToDoList[index].title,
                              completed: filteredToDoList[index].completed,
                            );
                          }),
                    ),
                  ],
                ],
              );
            },
            error: (err, stack) => Center(
              child: Text(err.toString()),
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
          ),
        ),
      ),
    );
  }
}
