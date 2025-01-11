import 'package:cloud_firestore/cloud_firestore.dart';

class HomescreenController {
  static final taskCollection = FirebaseFirestore.instance.collection("task");

  static void deleteData(String id) {
    taskCollection.doc(id).delete();
  }

  static void addData(String todo) {
    final data = {
      "todo": todo,
    };
    taskCollection.add(data);
  }
}
