import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function(bool?) checkboxCallback;
  final VoidCallback longPressCallback;

  TaskTile(
      {required this.isChecked,
      required this.taskTitle,
      required this.checkboxCallback,
      required this.longPressCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallback,
      title: Text(
        taskTitle,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: checkboxCallback,
      ),
    );
  }
}

// local state = sayfaları değiştirmek için. hani trendyolda falan alt kısımdaki sayfa değiştirme kısmını soldan sağa götürmek. = var ischecked = false; ... setstate (){ischecked = true}

// global state = keeping the values of some variables and using it across different parts of the app. mesela sadece checkbox taki kısmın tik olmasını istiyorsak local state kullanırız ama yok text kısmının falanda itk olmasını istiyorsak global state kullanırız. 

 // statefull widget = to be able to update the state.