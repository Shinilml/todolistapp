import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todolistappexm/controller/homescreencontroller.dart';
import 'package:todolistappexm/utils/colorconstants.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  void _showEditDialog(BuildContext context, String id, String currentTodo) {
    TextEditingController editController =
        TextEditingController(text: currentTodo);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colorconstants.brown,
          title: Text(
            "Edit Task",
            style: TextStyle(color: Colorconstants.white),
          ),
          content: TextField(
            controller: editController,
            style: TextStyle(color: Colorconstants.white),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Enter new task text",
              hintStyle:
                  TextStyle(color: Colorconstants.white.withOpacity(0.6)),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                "Cancel",
                style: TextStyle(color: Colorconstants.white),
              ),
            ),
            TextButton(
              onPressed: () {
                final updatedTodo = editController.text;
                if (updatedTodo.isNotEmpty) {
                  HomescreenController.editTask(id, updatedTodo);
                }
                Navigator.pop(context);
              },
              child: Text(
                "Save",
                style: TextStyle(color: Colorconstants.white),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildTaskList(List<QueryDocumentSnapshot<Map<String, dynamic>>> tasks,
      bool isCompleted) {
    final filteredTasks =
        tasks.where((task) => task['completed'] == isCompleted).toList();

    return ListView.builder(
      itemCount: filteredTasks.length,
      itemBuilder: (context, index) {
        final task = filteredTasks[index];
        return ListTile(
          leading: Checkbox(
            value: task['completed'],
            onChanged: (value) {
              HomescreenController.updateTaskStatus(task.id, value!);
            },
            activeColor: Colorconstants.white,
            checkColor: Colorconstants.brown,
          ),
          title: GestureDetector(
            onTap: () => _showEditDialog(context, task.id, task['todo']),
            child: Text(
              task['todo'],
              style: TextStyle(color: Colorconstants.white),
            ),
          ),
          trailing: InkWell(
            onLongPress: () => HomescreenController.deleteData(task.id),
            child: Icon(Icons.delete, color: Colorconstants.white),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController taskController = TextEditingController();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colorconstants.brown,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colorconstants.yellow,
          child: Icon(Icons.add, color: Colorconstants.brown),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  backgroundColor: Colorconstants.brown,
                  title: Text(
                    "Enter your task",
                    style: TextStyle(color: Colorconstants.white),
                  ),
                  content: TextField(
                    controller: taskController,
                    style: TextStyle(color: Colorconstants.white),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter task",
                      hintStyle: TextStyle(
                          color: Colorconstants.white.withOpacity(0.6)),
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        taskController.clear();
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Cancel",
                        style: TextStyle(color: Colorconstants.white),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        final task = taskController.text;
                        if (task.isNotEmpty) {
                          HomescreenController.addData(task);
                          taskController.clear();
                        }
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Save",
                        style: TextStyle(color: Colorconstants.white),
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
        appBar: AppBar(
          backgroundColor: Colorconstants.brown,
          title: Text("ToDo",
              style: TextStyle(
                  color: Colorconstants.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 25)),
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: Colorconstants.white,
            tabs: [
              Tab(text: "Tasks"),
              Tab(text: "Completed"),
            ],
            labelColor: Colorconstants.white,
          ),
        ),
        body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: HomescreenController.taskCollection.snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            final tasks = snapshot.data!.docs;
            return TabBarView(
              children: [
                _buildTaskList(tasks, false),
                _buildTaskList(tasks, true),
              ],
            );
          },
        ),
      ),
    );
  }
}
