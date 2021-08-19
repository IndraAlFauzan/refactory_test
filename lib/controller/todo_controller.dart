import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:refactory_test/model/todo_model.dart';

class TodoController extends GetxController {
  late TextEditingController title;

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  late CollectionReference collectionReference;

  RxList<Todo> listTodo = RxList<Todo>([]);

  @override
  void onInit() {
    super.onInit();
    title = TextEditingController();
    collectionReference = firebaseFirestore.collection("todo");
    listTodo.bindStream(getAllEmployees());
  }

  Stream<List<Todo>> getAllEmployees() => collectionReference
      .snapshots()
      .map((query) => query.docs.map((item) => Todo.fromMap(item)).toList());

  void saveTodo(String title, bool finish, DateTime time) {
    collectionReference
        .add({'title': title, 'finish': finish, 'time': time}).whenComplete(() {
      //CustomFullScreenDialog.cancelDialog();

      Get.back();
      CustomSnackBar.showSnackBar(
          context: Get.context,
          title: "Employee Added",
          message: "Employee added successfully",
          backgroundColor: Colors.green);
    }).catchError((error) {
      CustomSnackBar.showSnackBar(
          context: Get.context,
          title: "Error",
          message: "Something went wrong",
          backgroundColor: Colors.green);
    });
  }

  void deleteData(String docId) {
    collectionReference.doc(docId).delete().whenComplete(() {
      Get.back();
      CustomSnackBar.showSnackBar(
          context: Get.context,
          title: "Employee Deleted",
          message: "Employee deleted successfully",
          backgroundColor: Colors.green);
    }).catchError((error) {
      CustomSnackBar.showSnackBar(
          context: Get.context,
          title: "Error",
          message: "Something went wrong",
          backgroundColor: Colors.red);
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    title.dispose();
  }
}

class CustomSnackBar {
  static void showSnackBar({
    required BuildContext? context,
    required String title,
    required String message,
    required Color backgroundColor,
  }) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: backgroundColor,
        titleText: Text(
          title,
          style: TextStyle(fontSize: 16),
        ),
        messageText: Text(
          message,
          style: TextStyle(fontSize: 16),
        ),
        colorText: Colors.white,
        borderRadius: 8,
        margin: EdgeInsets.all(16));
  }
}
