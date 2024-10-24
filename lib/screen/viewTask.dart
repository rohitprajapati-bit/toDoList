import 'package:flutter/material.dart';

class Viewtask extends StatefulWidget {
  final String title;
  final String description;

  const Viewtask({super.key, required this.title, required this.description});

  @override
  State<Viewtask> createState() => _ViewtaskState();
}

class _ViewtaskState extends State<Viewtask> {
  void deleteData() {
    // setState(() {
    widget.title.replaceAll(widget.title, '');
    widget.title.replaceAll(widget.description, '');
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Card(
            elevation: 3,
            child: ListTile(
              title: Text(
                widget.title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text(
                  widget.description,
                  style: TextStyle(fontSize: 15),
                ),
              ),
              trailing: InkWell(
                  onTap: () {
                    deleteData();
                  },
                  child: Icon(Icons.delete)),
            ),
          )
        ],
      ),
    );
  }
}
