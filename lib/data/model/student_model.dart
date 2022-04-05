class Student {
  int id;
  String name;
  int grade;

  Student({required this.id, required this.name, required this.grade});

  Map<String, dynamic> toMap() => {'id': id, 'name': name, 'grade': grade};

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(id: map['id'], name: map['name'], grade: map['grade']);
  }


  @override
  String toString() {
    return 'Student{id: $id, name: $name, grade: $grade}';
  }
}
