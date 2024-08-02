import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/screens/add_task_screen.dart';

import '../models/task_data.dart';
import '../widgets/tasks_list.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        // bu artı ikonu olan ekle butonu.
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddTaskScreen(),
              ),
            ),
          );
        },
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.add),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment
            .start, // bu kısmı yazılar sola gitsin diye yaptık yoksa ortalıyordu kendisini otomatik olarak.
        children: [
          Container(
            // safearea= column kısmının üstteki saat kısmında değilde aşağısına yerleşmesi için yapılan özellikti.
            padding: EdgeInsets.only(
                top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment
                  .start, // aşağıda yaptığımız her şeyi sola kaydırdırk.
              children: [
                CircleAvatar(
                  child: Icon(
                    Icons.list,
                    size: 30.0,
                    color: Colors.lightBlueAccent,
                  ),
                  backgroundColor: Colors.white,
                  radius: 30.0, // daha büyük yapmak için kullandık
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'To-Do-App',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  '${Provider.of<TaskData>(context).taskCount} Tasks',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            // alabildiği kadar yer alması için yaptık.
            child: Container(
              // color: Colors.white, decoration içine koyunca birisini kaldırman şart, yoksa kod bozulur.
              // height: 300.0, // container child almadan ekranda herhangi bir şey göstermez.
              padding: EdgeInsets.symmetric(
                  horizontal:
                      20.0), // = left and right. yazıları biraz sağ tarafa çekti
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(
                        20.0)), // kutunun kenarlarını yuvarlayacak.
              ),
              child: TasksList(),
            ),
          ),
        ],
      ),
    );
  }
}
