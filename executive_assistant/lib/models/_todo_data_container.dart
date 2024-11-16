import 'package:flutter/material.dart';

///**_TodoDataContainer**
///
///*Data container for a todo task item*
///
///title: String - Title of the task 
///
///description: String - Description of the task
/// 
///itemPriority: int - Priority of the task
/// 
///isCompleted: bool - Tracks if the task is completed
/// 
///author: String - The author of the task
///
///
class TodoDataContainer {
  String title;
  String description;
  int itemPriority;
  bool isCompleted;
  String author;

  //Default Constructor
  TodoDataContainer(this.title, this.description, this.itemPriority, this.isCompleted, this.author);

  //Returns the object in JSON format for better database indexing
  (String, String, int, bool, String) toJson() {
    return (
      title,
      description,
      itemPriority,
      isCompleted,
      author,
    );
  }

}

