import 'package:flutter/material.dart';

class Addtaskpage extends StatefulWidget {
  const Addtaskpage({super.key});

  @override
  State<Addtaskpage> createState() => _AddtaskpageState();
}

class _AddtaskpageState extends State<Addtaskpage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  void _saveTask() {
    String title = titleController.text;
    String description = descriptionController.text;

    if (title.isNotEmpty && description.isNotEmpty) {
      Navigator.pop(context, {'title': title, 'description': description});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        title: const Text('Add Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                  hintText: 'Enter Task title',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                  hintText: 'Enter Task Description ',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: const Center(
                    child: Text(
                  'Save',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                )),
                width: double.infinity,
                color: Colors.blue,
              ),
              onTap: _saveTask,
            ),
          ],
        ),
      ),
    );
  }
}
