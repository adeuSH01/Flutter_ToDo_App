import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/models/task_data.dart';
import 'package:to_do_app/screens/tasks_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        TaskData();
      },
      child: MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}

// global state = keeping the values of some variables and using it across different parts of the app. mesela sadece checkbox taki kısmın tik olmasını istiyorsak local state kullanırız ama yok text kısmının falanda itk olmasını istiyorsak global state kullanırız. 
