import 'package:get/get.dart';
import 'package:refactory_test/controller/todo_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TodoController>(
      () => TodoController(),
    );
  }
}