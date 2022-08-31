import 'package:frontend/core/model/task.dart';
import 'package:get/get.dart';

class AllTaskService extends GetConnect implements GetxService {
  Future<List<Task>> getAllTask() async {
    const String url = 'http://10.0.2.2:8000/task/view-all/';
    Response response = await get(url);
    List<Task> tasks = [];
    if (response.statusCode == 200) {
      List datas = response.body;
      for (var data in datas) {
        tasks.add(Task.fromMap(data));
      }
      return tasks;
    } else {
      return tasks;
    }
  }

  Future<void> deleteTask({
    required int id,
  }) async {
    var url = 'http://10.0.2.2:8000/task/delete/$id/';
    Response response = await delete(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
    );
    if (response.statusCode == 200) {
      Get.snackbar("Sucessfully", "Task Deleted Sucessfully");
    } else {
      Get.snackbar("Failed", "Unable to delete task");
    }
  }
}
