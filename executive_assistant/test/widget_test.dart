// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:executive_assistant/widgets/todo_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:executive_assistant/main.dart';

void main() {
  ///Testing if the add button will add a task to the home screen
  testWidgets('Add button functionality test', (WidgetTester tester) async {
    const todoWidget = TodoContainer(title: "Test");
    
    await tester.pumpWidget(const MyApp());

    //Find the add button and tap it
    await tester.tap(find.byType(FloatingActionButton));

    await tester.pump();
    //Checks if the new todo task is created and present 
    expect(find.text("Test"), findsOneWidget);
  });

  
}
