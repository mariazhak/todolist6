import 'package:flutter/material.dart';
import 'package:todolist6/widgets/popUpWindows/itemAdder.dart';
import 'package:todolist6/pageRoute/route.dart';
import 'taskTile.dart';
import 'package:todolist6/mixins/popMenu.dart';

class BodyWidget extends StatelessWidget with PopMenu{

  const BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(children: [
      Center(
        child: Container(
          padding: const EdgeInsets.all(10),
          color: Colors.black87,
          child: ListView.builder(
            itemCount: getTasksLength(context),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  TaskTile(index: index),
                  const SizedBox(height: 15)
                ],
              );
            },
          ),
        ),
      ),
      Positioned(
        bottom: 40,
        left: MediaQuery.of(context).size.width * 0.38,
        child: FloatingActionButton.large(
          heroTag: 'add',
          onPressed: () {
              Navigator.of(context).push(MyPageRoute(builder: (BuildContext context) {
                return const ItemAdder();
              }));
          },
          shape: const CircleBorder(),
          elevation: 6,
          child: const Icon(Icons.add),
        ),
      ),
    ]
    );
  }
}