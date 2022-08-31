import 'package:frontend/core/model/task.dart';
import 'package:frontend/features/add_task/services/add_task_services.dart';
import 'package:frontend/features/all_task/pages/all_task_screen.dart';
import 'package:frontend/features/all_task/services/all_task_services.dart';
import 'package:frontend/features/edit_task/services/edit_task_services.dart';
import 'package:frontend/features/view_task/services/view_task_services.dart';
import 'package:get/get.dart';

class TaskController extends GetxController {
  final AllTaskService _allTaskService = AllTaskService();
  final AddTaskService _addTaskService = AddTaskService();
  final ViewTaskService _viewTaskService = ViewTaskService();
  final EditTaskService _editTaskService = EditTaskService();

  List<Task> _tasks = [];
  List<Task> get tasks => _tasks;

  late Task _task;
  Task get task => _task;

  Future<void> getAllTask() async {
    _tasks = await _allTaskService.getAllTask();
    update();
  }

  Future<void> addTask({
    required String taskName,
    required String taskDetail,
  }) async {
    await _addTaskService.addNewTask(
      taskName: taskName,
      taskDetail: taskDetail,
    );
    Get.snackbar("Sucessfull", "Task added sucessfully");
    Get.to(
      () => const AllTaskScreen(),
      transition: Transition.fade,
      duration: const Duration(seconds: 1),
    );
    update();
  }

  Future<void> getSingleTask({
    required int id,
  }) async {
    _task = await _viewTaskService.getSingleTask(id: id) ??
        const Task(
          id: 0,
          taskName: '',
          taskDetail: '',
          completed: false,
        );
    update();
  }

  Future<void> editTask({
    required int id,
    required String taskName,
    required String taskDetail,
  }) async {
    await _editTaskService.editTask(
      id: id,
      taskName: taskName,
      taskDetail: taskDetail,
    );
    Get.snackbar("Sucessfull", "Task edited sucessfully");
    Get.to(
      () => const AllTaskScreen(),
      transition: Transition.fade,
      duration: const Duration(seconds: 1),
    );
    update();
  }

  Future<void> deleteTask({
    required int id,
  }) async {
    await _allTaskService.deleteTask(id: id);
    update();
  }
}
