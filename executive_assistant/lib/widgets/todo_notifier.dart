import 'package:flutter/material.dart';
import 'todo_container.dart';

class TodoNotifier extends ChangeNotifier {
  List<TodoContainer> list = <TodoContainer>[];

  void addTodoItem(String title) {
    list.add(TodoContainer(title: title));
    notifyListeners();
  }
}