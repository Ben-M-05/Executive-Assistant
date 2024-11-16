import 'package:flutter/material.dart';
import 'package:executive_assistant/todo_notifier.dart';

Future<void> popupBuilder(BuildContext context, TodoNotifier notifier) {

  final textController = TextEditingController();


  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: const Color.fromARGB(255, 108, 34, 34),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        title: const Text("Add a todo"),
        actions: <Widget> [
          TextField(style: TextStyle(color: Colors.white), controller: textController),
          SizedBox(width: 8, height: 8),
          TextButton(onPressed: () {
            notifier.addTodoItem(textController.text, context);
            Navigator.of(context).pop();
            textController.dispose();
            }, 
            child: Text("Add", style: TextStyle(color: Colors.amber))
          )
        ]

      );
    }
  );
}