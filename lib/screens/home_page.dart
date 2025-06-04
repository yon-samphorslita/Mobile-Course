import 'package:flutter/material.dart';

import '../models/student.dart';
import '../services/db_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DBHelper _dbHelper = DBHelper();
  List<Student> _students = [];

  @override
  void initState() {
    super.initState();
    _refreshStudentList();
  }

  Future<void> _refreshStudentList() async {
    final data = await _dbHelper.getStudents();
    setState(() {
      _students = data;
    });
  }

  void _deleteStudent(int id) async {
    await _dbHelper.deleteStudent(id);
    _refreshStudentList();
  }

  void _toggleAttendance(Student student) async {
    final updatedStudent = Student(
      id: student.id,
      name: student.name,
      email: student.email,
      phone: student.phone,
      className: student.className,
      department: student.department,
      gender: student.gender,
      dateRegistered: student.dateRegistered,
      present: !student.present,
    );
    await _dbHelper.updateStudent(updatedStudent);
    _refreshStudentList();
  }

  void _navigateToAddEdit({Student? student}) async {
    final result = await Navigator.pushNamed(
      context,
      '/form',
      arguments: student,
    );
    if (result == true) {
      _refreshStudentList();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Student ${student == null ? 'added' : 'updated'}'),
        ),
      );
    }
  }

  String _formatDate(String dateString) {
    final date = DateTime.parse(dateString);
    return "${date.year}-${_twoDigits(date.month)}-${_twoDigits(date.day)}";
  }

  String _twoDigits(int n) => n.toString().padLeft(2, '0');

  @override
  Widget build(BuildContext context) {
    final presentStudents = _students
        .where((student) => student.present)
        .toList();
    final absentStudents = _students
        .where((student) => !student.present)
        .toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Class Manager'), centerTitle: true),
      body: _students.isEmpty
          ? const Center(child: Text('No students found.'))
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSection('Present Students', presentStudents),
                  _buildSection('Absent Students', absentStudents),
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToAddEdit(),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildSection(String title, List<Student> students) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          ...students.map(
            (student) => Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Checkbox(
                  value: student.present,
                  onChanged: (value) {
                    _toggleAttendance(student);
                  },
                ),
                Expanded(
                  child: Card(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    child: ListTile(
                      title: Text(student.name),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${student.department} - ${student.className}'),
                          Text('Email: ${student.email}'),
                          Text(
                            'Registered: ${_formatDate(student.dateRegistered)}',
                          ),
                        ],
                      ),
                      trailing: PopupMenuButton<String>(
                        onSelected: (value) {
                          if (value == 'edit') {
                            _navigateToAddEdit(student: student);
                          } else if (value == 'delete') {
                            _deleteStudent(student.id!);
                          }
                        },
                        itemBuilder: (context) => [
                          const PopupMenuItem(
                            value: 'edit',
                            child: Text('Edit'),
                          ),
                          const PopupMenuItem(
                            value: 'delete',
                            child: Text('Delete'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
