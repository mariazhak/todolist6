import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../data/dataClasses.dart';
import 'remove.dart';
import '../../pageRoute/route.dart';

class DetailedContainer extends StatelessWidget {
  Task task;
  double sizeBox = 15;

  DetailedContainer({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.grey, // Border color
            width: 2.0, // Border width
          ),
        ),
        width: MediaQuery.of(context).size.width * 0.7,
        height: MediaQuery.of(context).size.height * 0.5,
        child: ListView(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text(task.name,
                      style: const TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        decoration: TextDecoration.none,
                        fontFamily: 'Roboto',
                      )),
                ),
                const Spacer(flex: 2),
                FloatingActionButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MyPageRoute(builder: (BuildContext context) {
                        return RemoveWidget(
                          task: task,
                        );
                      }));
                    },
                    backgroundColor: Colors.black,
                    child: const Icon(
                      CupertinoIcons.trash,
                      color: Colors.white,
                    )),
              ],
            ),
            SizedBox(height: sizeBox),
            Row(children: [
              Expanded(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: task.category.color,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: Text(task.category.title,
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          decoration: TextDecoration.none,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.normal)),
                ),
              ),
              const Spacer(),
            ]),
            SizedBox(height: sizeBox),
            const Text("Description:",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    decoration: TextDecoration.none,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.normal)),
            SizedBox(height: sizeBox),
            Text(task.description ?? "No description provided",
                style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    decoration: TextDecoration.none,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.normal)),
          ],
        ),
      ),
    );
  }
}
