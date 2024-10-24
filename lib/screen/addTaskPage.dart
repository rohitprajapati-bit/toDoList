import 'package:flutter/material.dart';
import 'package:to_do_list/screen/viewTask.dart';

class Addtaskpage extends StatefulWidget {
  const Addtaskpage({super.key});

  @override
  State<Addtaskpage> createState() => _AddtaskpageState();
}

class _AddtaskpageState extends State<Addtaskpage> {
  final List<Map<String, String>> _todoItems = [];
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  void _addTodoTask(String title, String description) {
    if (title.isNotEmpty && description.isNotEmpty) {
      setState(() {
        _todoItems.add({'title ': title, 'description': description});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(),
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
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                  hintText: 'Enter Task Description ',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Center(
                    child: Text(
                  'Save',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                )),
                width: double.infinity,
                color: Colors.blue,
              ),
              onTap: () {
                _addTodoTask(titleController.text, descriptionController.text);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Viewtask(
                            title: titleController.text,
                            description: descriptionController.text)));
              },
            )
          ],
        ),
      ),
    );
  }
}
