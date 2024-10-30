import 'package:executive_assistant/models/_todo_data_container.dart';
import 'package:executive_assistant/api/todoMethods.dart';
import 'package:test/test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'mock.dart';

void main() {

  setupFirebaseAuthMocks();

  setUpAll(() async {
    await Firebase.initializeApp();
  });
  
  test('TodoMethodBase initialization should enable access to TodoDataContainer properties', () {

    final todoMethodsBase = TodoMethodsBase(TodoDataContainer("Test", "test", 0, false, ""));

    expect(todoMethodsBase.getTitle(), "Test");
  });

  test('TodoMethodBase method setTitle() should set the title of created task from test to hello', () async {
    
    await Firebase.initializeApp();
    
    final todoExample = TodoDataContainer("Test", "test", 0, false, "");

    final todoMethodsBase = TodoMethodsBase(todoExample);

    todoMethodsBase.setTitle("hello");

    expect(todoMethodsBase.getTitle(), "hello");
  });

  test('Get document directory path', () {
    print(TodoMethodsBase(TodoDataContainer("Test", "test", 0, false, "")));
  });

}