
import 'package:executive_assistant/widgets/todo_popup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../widgets/todo_container.dart';
import '../todo_notifier.dart';



class MyHomePage extends StatelessWidget {

  const MyHomePage({super.key});
  

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<TodoNotifier>();
    var tasks = [];
    
    
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Todo App"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.supervised_user_circle),
            onPressed:  () {
              print('pressed');
              FirebaseAuth.instance.signOut();
            }
          )
        ],
      ),
      backgroundColor: Colors.black12,
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: ListView.separated(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),

          itemCount: tasks.length,
          itemBuilder: (context, index) {
            final task = tasks[index];
            return TodoContainer(title: task.title);          
          },
          separatorBuilder: (context, index) => const SizedBox(
            height: 10,
          ),
        ) 
        ),
  
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
            popupBuilder(context, appState)
        },
        tooltip: 'Add a note',
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: const LinearGradient(colors: [Color.fromARGB(255, 24, 18, 18), Color.fromARGB(255, 36, 30, 30), Color.fromARGB(255, 0, 0, 0), Color.fromARGB(255, 93, 44, 23), Colors.red])
          ),
          child: const Icon(Icons.note_add, color: Color.fromARGB(255, 255, 255, 255)),
        ),
        
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

