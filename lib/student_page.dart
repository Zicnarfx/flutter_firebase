import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StudentPage extends StatefulWidget {
  
  const StudentPage({super.key});

  @override
  State<StudentPage> createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  Future<void> saveTestData() async {
 await FirebaseFirestore.instance.collection('students').add({
 'name': 'Juan Dela Cruz',
 'course': 'BS Computer Science',
 'createdAt': FieldValue.serverTimestamp(),
 });
}
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}