import 'package:flutter/material.dart';
import 'package:todolist6/widgets/popUpWindows/detailedContainer.dart';
import 'package:todolist6/pageRoute/route.dart';
import 'package:provider/provider.dart';
import 'package:todolist6/models/appModel.dart';

class TaskTile extends StatelessWidget {
  final int index;

  const TaskTile({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppModel>(
      builder: (context, model, child) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(
                color: model.tasks[index].isDone == true ? Colors.green : Colors.black),
            borderRadius: BorderRadius.circular(15),
          ),
          child: ListTile(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))),
            tileColor: Colors.black,
            title: Text(model.tasks[index].name,
                style: const TextStyle(color: Colors.white)),
            subtitle: Text(model.tasks[index].category.title,
                style: const TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.of(context)
                  .push(MyPageRoute(builder: (BuildContext context) {
                return DetailedContainer(
                  task: model.tasks[index],
                );
              }));
            },
            leading: Checkbox(
              checkColor: Colors.white,
              value: model.tasks[index].isDone,
              onChanged: (bool? value) {
                model.changeDone(index);
              },
            ),
          ),
        );
      },
    );
  }
}
