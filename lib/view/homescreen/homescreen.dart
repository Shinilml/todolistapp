import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todolistappexm/controller/homescreencontroller.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController taskController = TextEditingController();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Enter your task"),
                content: TextField(
                  controller: taskController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter task",
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text("Cancel"),
                  ),
                  TextButton(
                    onPressed: () {
                      final task = taskController.text;
                      if (task.isNotEmpty) {
                        HomescreenController.addData(task);
                      }
                      Navigator.pop(context);
                    },
                    child: Text("Save"),
                  ),
                ],
              );
            },
          );
        },
      ),
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text("ToDo"),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: HomescreenController.taskCollection.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          final tasks = snapshot.data!.docs;
          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];
              return ListTile(
                leading: Checkbox(
                  value: false,
                  onChanged: (value) => true,
                ),
                title: Text(task['todo']),
                trailing: InkWell(
                  onLongPress: () => HomescreenController.deleteData(task.id),
                  child: Icon(Icons.delete),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
