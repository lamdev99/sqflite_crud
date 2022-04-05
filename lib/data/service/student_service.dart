import 'package:sqflite/sqflite.dart';
import 'package:sqlite_sample/data/base/data_result.dart';
import 'package:sqlite_sample/data/database/student_database.dart';
import 'package:sqlite_sample/data/model/student_model.dart';

class StudentService {
  Future<DataResult> insertStudent(Student student, String tableName) async {
    try{
      Database db = await StudentDatabase.getInstance();
      int lastInsertedRow = await db.insert(tableName, student.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
      return DataResult.success(lastInsertedRow);
    }catch(ex){
      return DataResult.failure(DatabaseFailure(ex.toString()));
    }
  }

  Future<DataResult> getAllStudent() async{
    try{
      Database db = await StudentDatabase.getInstance();
      final List<Map<String,dynamic>> maps = await db.query("student");
      List<Student> students = maps.map((e) => Student.fromMap(e)).toList();
      return DataResult.success(students);
    }catch(ex){
      return DataResult.failure(DatabaseFailure(ex.toString()));
    }
  }

  Future<DataResult> updateStudent(Student student) async{
    try{
      Database db = await StudentDatabase.getInstance();
      int numberOfChanges = await db.update("student", student.toMap(),where: "id = ?",whereArgs: [student.id]);
      return DataResult.success(numberOfChanges);
    }catch(ex){
      return DataResult.failure(DatabaseFailure(ex.toString()));
    }
  }

  Future<DataResult> deleteStudent(int id) async{
    try{
      Database db = await StudentDatabase.getInstance();
      int numberOfRowEffected = await db.delete("student",where: "id = ?",whereArgs: [id]);
      return DataResult.success(numberOfRowEffected);
    }catch(ex){
      return DataResult.failure(DatabaseFailure(ex.toString()));
    }
  }
}
