
import 'package:executive_assistant/widgets/todo_notifier.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:executive_assistant/widgets/todo_container.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
        home: const MyHomePage(title: 'Todo App'),
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
        title: Text(widget.title),
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
        onPressed: () => {appState.addTodoItem("Test")},
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


