import 'package:flutter/material.dart';
import 'package:to_do_list/screen/addTaskPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, String>> _todoItems = [];

  void _addTaskToList(Map<String, String> task) {
    setState(() {
      _todoItems.add(task);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
        backgroundColor: Colors.grey.shade200,
        title: const Text('ToDos List'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey.shade200,
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Addtaskpage()),
          );

          if (result != null && result is Map<String, String>) {
            _addTaskToList(result);
          }
        },
        child: const Icon(Icons.add),
      ),
      body: _todoItems.isEmpty
          ? const Center(
              child: Text(
                'No Tasks Added',
                style: TextStyle(fontSize: 20),
              ),
            )
          : ListView.builder(
              itemCount: _todoItems.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 3,
                  child: ListTile(
                    title: Text(
                      _todoItems[index]['title'] ?? '',
                      style: TextStyle(fontSize: 20),
                    ),
                    subtitle: Text(_todoItems[index]['description'] ?? ''),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        setState(() {
                          _todoItems.removeAt(index);
                        });
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}
