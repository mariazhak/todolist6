import 'package:flutter/material.dart';
import '../../data/dataClasses.dart';
import 'package:todolist6/models/appModel.dart';
import 'package:provider/provider.dart';

class ItemAdder extends StatefulWidget {
  const ItemAdder({super.key});

  @override
  State<ItemAdder> createState() => _ItemAdderState();
}

class _ItemAdderState extends State<ItemAdder> {
  double sizeBox = 15;
  late TextEditingController controller;
  late TextEditingController controller2;
  String name = 'Unknown task';
  String description = 'No description provided';
  Category category = Category(title: 'Home', color: Colors.greenAccent);

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    controller2 = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppModel>(builder: (context, model, child) {
      return Container(
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
            const Text('Name:',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  fontFamily: 'Roboto',
                )),
            SizedBox(height: sizeBox),
            Card(
              color: Colors.black87,
              child: TextField(
                cursorColor: Colors.greenAccent,
                style: const TextStyle(color: Colors.white),
                controller: controller,
                onChanged: (String value) {
                  name = controller.text;
                },
              ),
            ),
            SizedBox(height: sizeBox),
            const Text('Category:',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  fontFamily: 'Roboto',
                )),
            Card(
              color: Colors.black87,
              child: DropdownButton(
                  dropdownColor: Colors.grey,
                  items: model.categories.map((Category item) {
                    return DropdownMenuItem(
                        value: item,
                        child: Text(item.title,
                            style: const TextStyle(color: Colors.white)));
                  }).toList(),
                  onChanged: (Category? newCategory) {
                    model.temporaryCategory = newCategory!;
                  },
                  value: model.temporaryCategory),
            ),
            SizedBox(height: sizeBox),
            const Text('Description:',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  fontFamily: 'Roboto',
                )),
            SizedBox(height: sizeBox),
            Card(
              color: Colors.black87,
              child: TextField(
                cursorColor: Colors.greenAccent,
                style: const TextStyle(color: Colors.white),
                controller: controller2,
                onChanged: (String value) {
                  description = controller2.text;
                },
              ),
            ),
            SizedBox(height: sizeBox),
            FloatingActionButton(
              onPressed: () {
                model.addTask(name, description, category);
                Navigator.pop(context);
              },
              heroTag: 'adder',
              child: const Text('Add'),
            ),
          ],
        ),
      );
    });
  }
}
