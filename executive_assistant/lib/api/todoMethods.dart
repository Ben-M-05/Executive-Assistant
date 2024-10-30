import 'package:executive_assistant/models/_todo_data_container.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TodoMethodsBase {
  late TodoDataContainer todoDataContainer;

  TodoMethodsBase(TodoDataContainer todoDataContainer) {
    this.todoDataContainer = todoDataContainer;

    addTodo(this.todoDataContainer);

  }

  Future<DocumentReference> addTodo(TodoDataContainer task) {
    return FirebaseFirestore.instance.collection('tasks').add(<String, dynamic>{
      "task": "Hello",
      "timestamp": DateTime.now().millisecondsSinceEpoch,
    });
  }
  

  String getTitle() {
    return todoDataContainer.title;
  }

  void setTitle(String newTitle) {
    todoDataContainer.title = newTitle;
  }

  String getDescription() {
    return todoDataContainer.description;
  }

  void setDescription(String newDescription) {
    todoDataContainer.description = newDescription;
  }

  int getPriority() {
    return todoDataContainer.itemPriority;
  }

  void setPriority(int newPriority) {
    todoDataContainer.itemPriority = newPriority;
  }

  bool getStatus() {
    return todoDataContainer.isCompleted;
  }

  void setStatus(bool newStatus) {
    todoDataContainer.isCompleted = newStatus;
  }
  

}
