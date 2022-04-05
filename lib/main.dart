import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sqlite_sample/data/database/student_database.dart';
import 'package:sqlite_sample/data/model/student_model.dart';
import 'package:sqlite_sample/data/service/student_service.dart';
import 'package:sqlite_sample/data/student_repository.dart';
import 'package:sqlite_sample/main_controller.dart';

void main() async {
  /// Avoid errors caused by flutter upgrade
  WidgetsFlutterBinding.ensureInitialized();
  StudentDatabase.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

MainController mainController =
    MainController(StudentRepository(StudentService()));

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    mainController.getAllStudent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Center(
                    child: Text(
                        "${mainController.students[index].name} ${mainController.students[index].id}"));
              },
              itemCount: mainController.students.length,
            ),
          ),
          ElevatedButton.icon(
              onPressed: () {
                setState(
                  () {
                    mainController.insertStudent(Student(
                        id: Random().nextInt(50),
                        name: "Lam Nguyen",
                        grade: 11));
                  },
                );
              },
              icon: const Icon(Icons.add),
              label: const Text("Add")),
        ],
      ),
    );
  }
}
