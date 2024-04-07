import 'package:flutter/material.dart';
import 'package:todolist6/models/appModel.dart';
import 'package:provider/provider.dart';
import 'package:todolist6/data/dataClasses.dart';

class RemoveWidget extends StatelessWidget{
  final Task task;

  const RemoveWidget({super.key, required this.task});

  @override
  Widget build(BuildContext context){
    return Consumer<AppModel>(
      builder:(context, model, child) {
        return Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.6,
              height: MediaQuery.of(context).size.height * 0.2,
              padding: const EdgeInsets.only(
                  left: 15, right: 15, top: 30, bottom: 30),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  const Text('Are you sure you want to delete this task?',
                    style: TextStyle(fontSize: 18,
                        color: Colors.white,
                        decoration: TextDecoration.none,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.normal),),
                  const Spacer(),
                  Row(
                    children: [
                      const Spacer(),
                      ElevatedButton(
                          onPressed: () {
                            model.removeTask(task);
                          },
                          child: const Text('Yes')),
                      const Spacer(),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('No')),
                      const Spacer(),
                    ],
                  ),
                ],
              ),
            )
        );
      }
    );
  }
}