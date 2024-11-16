import 'package:executive_assistant/firebase_options.dart';
import 'package:executive_assistant/models/_todo_data_container.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'widgets/todo_container.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'api/todoMethods.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart'
  hide EmailAuthProvider, PhoneAuthProvider;


class TodoNotifier extends ChangeNotifier {
  TodoNotifier() {
    init();
  }

  bool _loggedIn = false;
  bool get loggedIn => _loggedIn;

  Future<void> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
    );

    FirebaseUIAuth.configureProviders([
      EmailAuthProvider()
    ]);

    FirebaseAuth.instance.userChanges().listen((user) {
      if(user != null) {
        _loggedIn = true;
        notifyListeners();
      }else {
        _loggedIn = false;
      }
      notifyListeners(); 
    });
  }


  void addTodoItem(String title, BuildContext context) {

    if(!_loggedIn) {
      context.push('/sign-in');
    }
    TodoMethodsBase(TodoDataContainer(title, "", 0, false, ""));
    print("Done");
    
    notifyListeners();
  }
}