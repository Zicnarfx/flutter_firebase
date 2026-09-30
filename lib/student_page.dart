import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StudentPage extends StatefulWidget {
  const StudentPage({super.key});

  @override
  State<StudentPage> createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  final studentNumController = TextEditingController();
  final nameController = TextEditingController();
  final courseController = TextEditingController();

  Future<void> saveTestData() async {
    final studentNum = studentNumController.text.trim();
    final name = nameController.text.trim();
    final course = courseController.text.trim();

    await FirebaseFirestore.instance.collection('students').add({
      'student_no': studentNum,
      'name': name,

      'course': course,
      'createdAt': FieldValue.serverTimestamp(),
    });
    //  Snack Bar
    const snackBar = SnackBar(content: Text('Created Succesfully!'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);

    // clear textfield
    studentNumController.clear();
    nameController.clear();
    courseController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Page'),
        backgroundColor: Colors.amber,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Register Student Information',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 40),

              TextField(
                controller: studentNumController,
                decoration: InputDecoration(
                  label: Text('Student Number'),
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(height: 10),

              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  label: Text('Name'),
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(height: 10),

              TextField(
                controller: courseController,
                decoration: InputDecoration(
                  label: Text('Course'),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 40),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: saveTestData,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    foregroundColor: Colors.white,
                  ),
                  child: Text('Create'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
