import 'package:sqlite_sample/data/base/data_result.dart';
import 'package:sqlite_sample/data/service/student_service.dart';

import 'model/student_model.dart';

abstract class IStudentRepository{
  Future<DataResult> insertStudent(Student student, String tableName);
  Future<DataResult> getAllStudent();
  Future<DataResult> updateStudent(Student student);
  Future<DataResult> deleteStudent(int id);
}

class StudentRepository implements IStudentRepository{
  final StudentService _studentService;


  StudentRepository(this._studentService);

  @override
  Future<DataResult> insertStudent(Student student, String tableName) {
    return _studentService.insertStudent(student, tableName);
  }

  @override
  Future<DataResult> getAllStudent() {
    return _studentService.getAllStudent();
  }

  @override
  Future<DataResult> updateStudent(Student student) {
    return _studentService.updateStudent(student);
  }

  @override
  Future<DataResult> deleteStudent(int id) {
    return _studentService.deleteStudent(id);
  }

}

