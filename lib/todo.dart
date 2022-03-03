import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod/riverpod.dart';
import 'package:uuid/uuid.dart';

part 'todo.freezed.dart';

const _uuid = Uuid();

@freezed
class Todo with _$Todo {
  factory Todo(
      {required String id,
      required String description,
      @Default(false) bool completed}) = _Todo;

  @override
  String toString() {
    return 'Todo(id: $id, description: $description, completed: $completed)';
  }
}

/// An object that controls a list of [Todo].
class TodoList extends StateNotifier<List<Todo>> {
  TodoList([List<Todo>? initialTodos]) : super(initialTodos ?? []);

  void add(String description) {
    state = [
      ...state,
      Todo(
        id: _uuid.v4(),
        description: description,
      ),
    ];
  }

  void toggle(String id) {
    state = [
      for (final todo in state)
        if (todo.id == id) todo.copyWith(completed: !todo.completed) else todo,
    ];
  }

  void edit({required String id, required String description}) {
    state = [
      for (final todo in state)
        if (todo.id == id) todo.copyWith(description: description) else todo,
    ];
  }

  void remove(Todo target) {
    state = state.where((todo) => todo.id != target.id).toList();
  }
}
