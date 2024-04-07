import 'package:flutter/material.dart';
import 'models/appModel.dart';
import 'package:provider/provider.dart';
import 'mixins/popMenu.dart';
import 'widgets/bodyWidget.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => AppModel(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'To Do List'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with PopMenu{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(widget.title, style: const TextStyle(color: Colors.white)),
        actions: [
          FloatingActionButton(
            onPressed: () {
              menu(context);
            },
            shape: const CircleBorder(),
            heroTag: 'tasks',
            child: Text(getTasksLength(context).toString()),
          ),
        ],
      ),
      body: const BodyWidget(),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


