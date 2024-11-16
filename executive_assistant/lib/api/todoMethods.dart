import 'package:executive_assistant/models/_todo_data_container.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TodoMethodsBase {
  late TodoDataContainer todoDataContainer;

  TodoMethodsBase(TodoDataContainer todoDataContainer) {
    this.todoDataContainer = todoDataContainer;

    addTodo();

  }

  Future<DocumentReference> addTodo() {
    var (title, description, status, isCompleted, author) = this.todoDataContainer.toJson();

    return FirebaseFirestore.instance.collection('tasks').add(<String, dynamic>{
      "task": {
        "Title": title,
        "Description": description,
        "priority": status,
        "isCompleted": isCompleted,
        "author": author
      },
      "timestamp": DateTime.now().millisecondsSinceEpoch,
    });
  }
  
  List getAll() {
    var _tasksList = [];
    FirebaseFirestore.instance.collection('tasks').orderBy('timestamp', descending: true).snapshots().listen((snapshot) {

      for(final document in snapshot.docs) {
        _tasksList.add(
          TodoDataContainer(
            document.data()['title'] as String,
            document.data()['description'] as String,
            document.data()['itemPriority'] as int,
            document.data()['isCompleted'] as bool,
            document.data()['author'] as String
         ));
      }
      
    });

    return _tasksList;

  }

  String getTitle() {
    return "";
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
