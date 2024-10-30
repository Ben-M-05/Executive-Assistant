import 'package:executive_assistant/models/_todo_data_container.dart';
import 'package:flutter/material.dart';
import 'todo_container.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../api/todoMethods.dart';

class TodoNotifier extends ChangeNotifier {
  

  void addTodoItem(String title) {
    new TodoMethodsBase(TodoDataContainer(title, "", 0, false, ""));
    
    notifyListeners();
  }
}