import 'package:flutter/material.dart';
import 'package:todolist6/models/appModel.dart';
import 'package:provider/provider.dart';

mixin PopMenu {
  int getDoneCount(BuildContext context) {
    return Provider.of<AppModel>(context).isDoneCount;
  }

  int getTasksLength(BuildContext context) {
    return Provider.of<AppModel>(context).tasks.length;
  }

  void menu(BuildContext context) {
    showMenu(
      context: context,
      color: Colors.grey[500],
      items: [
        PopupMenuItem(
          child: Column(children: [
            Row(children: [
              const Expanded(
                  child:
                  Text('Not Done', style: TextStyle(color: Colors.white))),
              const Spacer(),
              Expanded(
                  child: Text((getTasksLength(context) - getDoneCount(context)).toString(),
                      style: const TextStyle(color: Colors.white))),
            ]),
            Row(children: [
              const Expanded(
                  child: Text('Done', style: TextStyle(color: Colors.white))),
              const Spacer(),
              Expanded(
                  child: Text(getDoneCount(context).toString(),
                      style: const TextStyle(color: Colors.white))),
            ]),
          ]),
        ),
      ],
      position: RelativeRect.fromLTRB(
          1, MediaQuery.of(context).size.height * 0.1, 0, 0),
    );
  }
}