import 'package:flutter/material.dart';

class TodoContainer extends StatefulWidget {
  const TodoContainer ({super.key, required this.title});

  final String title;

  @override
  State<TodoContainer> createState() => _TodoContainerState();
}

class _TodoContainerState extends State<TodoContainer> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: const Color.fromARGB(255, 59, 58, 58),
            ),
            width: 100,
            height: 70,
            alignment: Alignment.topCenter,
            child: Container(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  widget.title,
                  style: TextStyle(color: Colors.white)
                ),
              ),
            )
          ),
        );
      }
    );
  }
}