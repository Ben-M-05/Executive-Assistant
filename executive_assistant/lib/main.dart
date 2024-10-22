import 'dart:async';

import 'package:executive_assistant/widgets/todo_notifier.dart';
import 'package:flutter/material.dart';
import 'package:executive_assistant/widgets/todo_container.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:(context) => TodoNotifier(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MyHomePage(title: 'Todo App'),
      ),
    );
  }
}



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<TodoNotifier>();
    final tasks = appState.list;
    
    
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      backgroundColor: Colors.black12,
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: ListView.separated(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),

          itemCount: tasks.length,
          itemBuilder: (context, index) {
            final task = tasks[index];
            return ListTile(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: const Color.fromARGB(255, 102, 99, 99), width: 1),
                borderRadius: BorderRadius.circular(5)
              ),
              contentPadding: EdgeInsets.fromLTRB(40, 0, 0, 0),
              title: Text(task.title, style: TextStyle(color: Colors.white)),
              tileColor: const Color.fromARGB(255, 97, 92, 92),
            );          
          },
          separatorBuilder: (context, index) => SizedBox(
            height: 10,
          ),
        ) 
        ),
  
      floatingActionButton: FloatingActionButton(
        onPressed: () => {appState.addTodoItem("Test")},
        tooltip: 'Add a note',
        child: Container(
          width: 60,
          height: 60,
          child: const Icon(Icons.note_add, color: Color.fromARGB(255, 255, 255, 255)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(colors: [const Color.fromARGB(255, 24, 18, 18), const Color.fromARGB(255, 36, 30, 30), Color.fromARGB(255, 0, 0, 0), const Color.fromARGB(255, 93, 44, 23), Colors.red])
          ),
        ),
        
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


