import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'todo.dart';

/// Some keys used for testing
final addTodoKey = UniqueKey();
final activeFilterKey = UniqueKey();
final completedFilterKey = UniqueKey();
final allFilterKey = UniqueKey();

enum TodoListFilter {
  all,
  active,
  completed,
}

final todoListProvider = StateNotifierProvider<TodoList, List<Todo>>((ref) {
  return TodoList([
    Todo(id: 'todo-0', description: 'hi'),
    Todo(id: 'todo-1', description: 'hello'),
    Todo(id: 'todo-2', description: 'bonjour'),
  ]);
});
final todoListFilter = StateProvider((_) => TodoListFilter.all);
final uncompletedTodosCount = Provider<int>((ref) {
  return ref.watch(todoListProvider).where((todo) => !todo.completed).length;
});
final filteredTodos = Provider<List<Todo>>((ref) {
  final filter = ref.watch(todoListFilter);
  final todos = ref.watch(todoListProvider);

  switch (filter) {
    case TodoListFilter.completed:
      return todos.where((todo) => todo.completed).toList();
    case TodoListFilter.active:
      return todos.where((todo) => !todo.completed).toList();
    case TodoListFilter.all:
      return todos;
  }
});

void main() {
  return runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends HookConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(filteredTodos);
    final newTodoController = useTextEditingController();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          children: [
            const Title(),
            TextField(
              key: addTodoKey,
              controller: newTodoController,
              decoration: const InputDecoration(
                labelText: 'What needs to be done?',
              ),
              onSubmitted: (value) {
                ref.read(todoListProvider.notifier).add(value);
                newTodoController.clear();
              },
            ),
            const SizedBox(height: 42),
            const Toolbar(),
            if (todos.isNotEmpty) const Divider(height: 0),
            for (var i = 0; i < todos.length; i++) ...[
              if (i > 0) const Divider(height: 0),
              Dismissible(
                key: ValueKey(todos[i].id),
                onDismissed: (_) {
                  ref.read(todoListProvider.notifier).remove(todos[i]);
                },
                child: ProviderScope(
                  overrides: [
                    _currentTodo.overrideWithValue(todos[i]),
                  ],
                  child: const TodoItem(),
                ),
              )
            ],
          ],
        ),
      ),
    );
  }
}

class Toolbar extends HookConsumerWidget {
  const Toolbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(todoListFilter);

    Color? textColorFor(TodoListFilter value) {
      return filter == value ? Colors.blue : Colors.black;
    }

    return Material(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              '${ref.watch(uncompletedTodosCount).toString()} items left',
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Tooltip(
            key: allFilterKey,
            message: 'All todos',
            child: TextButton(
              onPressed: () =>
                  ref.read(todoListFilter.notifier).state = TodoListFilter.all,
              style: ButtonStyle(
                visualDensity: VisualDensity.compact,
                foregroundColor:
                    MaterialStateProperty.all(textColorFor(TodoListFilter.all)),
              ),
              child: const Text('All'),
            ),
          ),
          Tooltip(
            key: activeFilterKey,
            message: 'Only uncompleted todos',
            child: TextButton(
              onPressed: () => ref.read(todoListFilter.notifier).state =
                  TodoListFilter.active,
              style: ButtonStyle(
                visualDensity: VisualDensity.compact,
                foregroundColor: MaterialStateProperty.all(
                  textColorFor(TodoListFilter.active),
                ),
              ),
              child: const Text('Active'),
            ),
          ),
          Tooltip(
            key: completedFilterKey,
            message: 'Only completed todos',
            child: TextButton(
              onPressed: () => ref.read(todoListFilter.notifier).state =
                  TodoListFilter.completed,
              style: ButtonStyle(
                visualDensity: VisualDensity.compact,
                foregroundColor: MaterialStateProperty.all(
                  textColorFor(TodoListFilter.completed),
                ),
              ),
              child: const Text('Completed'),
            ),
          ),
        ],
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'todos',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Color.fromARGB(38, 47, 47, 247),
        fontSize: 100,
        fontWeight: FontWeight.w100,
        fontFamily: 'Helvetica Neue',
      ),
    );
  }
}

/// A provider which exposes the [Todo] displayed by a [TodoItem].
///
/// By retreiving the [Todo] through a provider instead of through its
/// constructor, this allows [TodoItem] to be instantiated using the `const` keyword.
///
/// This ensures that when we add/remove/edit todos, only what the
/// impacted widgets rebuilds, instead of the entire list of items.
final _currentTodo = Provider<Todo>((ref) => throw UnimplementedError());

class TodoItem extends HookConsumerWidget {
  const TodoItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todo = ref.watch(_currentTodo);
    final itemFocusNode = useFocusNode();
    // listen to focus chances
    useListenable(itemFocusNode);
    final isFocused = itemFocusNode.hasFocus;

    final textEditingController = useTextEditingController();
    final textFieldFocusNode = useFocusNode();

    return Material(
      color: Colors.white,
      elevation: 6,
      child: Focus(
        focusNode: itemFocusNode,
        onFocusChange: (focused) {
          if (focused) {
            textEditingController.text = todo.description;
          } else {
            // Commit changes only when the textfield is unfocused, for performance
            ref
                .read(todoListProvider.notifier)
                .edit(id: todo.id, description: textEditingController.text);
          }
        },
        child: ListTile(
          onTap: () {
            itemFocusNode.requestFocus();
            textFieldFocusNode.requestFocus();
          },
          leading: Checkbox(
            value: todo.completed,
            onChanged: (value) =>
                ref.read(todoListProvider.notifier).toggle(todo.id),
          ),
          title: isFocused
              ? TextField(
                  autofocus: true,
                  focusNode: textFieldFocusNode,
                  controller: textEditingController,
                )
              : Text(todo.description),
        ),
      ),
    );
  }
}
