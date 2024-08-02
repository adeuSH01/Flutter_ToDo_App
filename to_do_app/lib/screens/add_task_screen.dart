import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String? newTaskTitle;

    return Container(
      color: Color(0xFF757575), // arka plan rengi veridk gibi bir şey oldu.
      child: Container(
        padding: EdgeInsets.all(40.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30.0, color: Colors.lightBlueAccent),
            ),
            TextField(
              autofocus: true, // renk her aktif olacak
              textAlign: TextAlign
                  .center, // bu kısım yazı yazdığımız kısmı ortaya getirdi çünkü çok soldaydı ve gözükmüyordu.
              onChanged: (newText) {
                newTaskTitle = newText;
              },
            ),
            SizedBox(height: 30.0),
            TextButton(
              onPressed: () {
                Provider.of<TaskData>(context).addTask(newTaskTitle!);
                Navigator.pop(context);
              },
              child: Text('Add'),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(Colors.lightBlueAccent),
                foregroundColor: MaterialStatePropertyAll(Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
