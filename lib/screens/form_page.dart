import 'package:flutter/material.dart';

import '../models/student.dart';
import '../services/db_helper.dart';
import '../utils/validators.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  final DBHelper _dbHelper = DBHelper();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _classNameController = TextEditingController();
  final TextEditingController _departmentController = TextEditingController();

  String _gender = 'Male';
  bool _isEdit = false;
  int? _studentId;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final Student? student =
        ModalRoute.of(context)?.settings.arguments as Student?;
    if (student != null) {
      _isEdit = true;
      _studentId = student.id;
      _nameController.text = student.name;
      _emailController.text = student.email;
      _phoneController.text = student.phone;
      _classNameController.text = student.className;
      _departmentController.text = student.department;
      _gender = student.gender;
    }
  }

  Future<void> _saveStudent() async {
    if (_formKey.currentState!.validate()) {
      final student = Student(
        id: _studentId,
        name: _nameController.text.trim(),
        email: _emailController.text.trim(),
        phone: _phoneController.text.trim(),
        className: _classNameController.text.trim(),
        department: _departmentController.text.trim(),
        gender: _gender,
        dateRegistered: DateTime.now().toIso8601String(),
        present: false,
      );

      if (_isEdit) {
        await _dbHelper.updateStudent(student);
      } else {
        await _dbHelper.insertStudent(student);
      }

      if (context.mounted) {
        Navigator.pop(context, true);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_isEdit ? 'Edit Student' : 'Add Student')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: Validators.validateRequired,
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: Validators.validateEmail,
              ),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(labelText: 'Phone'),
                keyboardType: TextInputType.phone,
                validator: Validators.validatePhone,
              ),
              TextFormField(
                controller: _classNameController,
                decoration: const InputDecoration(labelText: 'Class'),
                validator: Validators.validateRequired,
              ),
              TextFormField(
                controller: _departmentController,
                decoration: const InputDecoration(labelText: 'Department'),
                validator: Validators.validateRequired,
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                value: _gender,
                decoration: const InputDecoration(labelText: 'Gender'),
                items: ['Male', 'Female', 'Other'].map((gender) {
                  return DropdownMenuItem(value: gender, child: Text(gender));
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _gender = value!;
                  });
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveStudent,
                child: Text(_isEdit ? 'Update' : 'Add'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
