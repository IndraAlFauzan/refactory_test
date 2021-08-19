import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {
  String? docId;
  String? title;
  bool? finish;
  DateTime? createdTime;
  Todo({
    this.docId,
    this.title,
    this.finish,
    this.createdTime,
  });

  Todo.fromMap(DocumentSnapshot data) {
    docId = data.id;
    title = data['title'];
    finish = data['finish'];
    createdTime = data['time'];
  }
}
