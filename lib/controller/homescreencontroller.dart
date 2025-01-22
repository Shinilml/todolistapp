import 'package:cloud_firestore/cloud_firestore.dart';

class HomescreenController {
  static final taskCollection = FirebaseFirestore.instance.collection("task");

  static void deleteData(String id) {
    taskCollection.doc(id).delete();
  }

  static void addData(String todo) {
    final data = {
      "todo": todo,
      "completed": false, // Completed status
    };
    taskCollection.add(data);
  }

  static void updateTaskStatus(String id, bool completed) {
    taskCollection.doc(id).update({
      "completed": completed,
    });
  }

  static void editTask(String id, String newTodo) {
    taskCollection.doc(id).update({
      "todo": newTodo,
    });
  }
}
