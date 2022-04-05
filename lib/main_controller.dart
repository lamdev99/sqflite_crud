import 'dart:developer';

import 'package:sqlite_sample/data/base/data_result.dart';
import 'package:sqlite_sample/data/model/student_model.dart';
import 'package:sqlite_sample/data/student_repository.dart';

class MainController {
  final StudentRepository _studentRepository;
  List<Student> students = List.empty(growable: true);

  MainController(this._studentRepository);

  void insertStudent(Student student) async {
    DataResult dataResult =
        await _studentRepository.insertStudent(student, "student");
    if (dataResult.isSuccess) {
      await getAllStudent();
      log("LamKz Success ${students.length}");
    } else {
      if (dataResult.error is DatabaseFailure) {
        log("Error ${(dataResult.error as DatabaseFailure).errorMessage}");
      }
    }
  }

  Future<void> getAllStudent() async {
    DataResult dataResult = await _studentRepository.getAllStudent();
    if (dataResult.isSuccess) {
      students = dataResult.data;
    } else {
      if (dataResult.error is DatabaseFailure) {
        log("Error ${(dataResult.error as DatabaseFailure).errorMessage}");
        students = List.empty();
      }
    }
  }
}
