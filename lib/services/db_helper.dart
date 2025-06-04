import 'package:classmanager/models/student.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
class DBHelper {
  static Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await initDB();
    return _db!;
  }

  Future<Database> initDB() async {
    final path = join(await getDatabasesPath(), 'class_manager.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  void _onCreate(Database db, int version) {
    db.execute('''
      CREATE TABLE students (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        email TEXT,
        phone TEXT,
        className TEXT,
        department TEXT,
        gender TEXT,
        dateRegistered TEXT,
        present INTEGER
      )
    ''');
  }

  Future<int> insertStudent(Student student) async {
    final db = await database;
    return await db.insert('students', student.toMap());
  }

  Future<List<Student>> getStudents() async {
    final db = await database;
    final res = await db.query('students');
    return res.map((s) => Student.fromMap(s)).toList();
  }

  Future<int> updateStudent(Student student) async {
    final db = await database;
    return await db.update('students', student.toMap(), where: 'id = ?', whereArgs: [student.id]);
  }

  Future<int> deleteStudent(int id) async {
    final db = await database;
    return await db.delete('students', where: 'id = ?', whereArgs: [id]);
  }
}
