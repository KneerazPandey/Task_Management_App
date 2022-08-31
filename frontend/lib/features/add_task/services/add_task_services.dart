import 'dart:convert';

import 'package:frontend/core/model/task.dart';
import 'package:get/get.dart';

class AddTaskService extends GetConnect implements GetxService {
  Future<Task?> addNewTask({
    required String taskName,
    required String taskDetail,
  }) async {
    const String url = 'http://10.0.2.2:8000/task/create/';
    Response response = await post(
      url,
      json.encode({
        'task_name': taskName,
        'task_detail': taskDetail,
      }),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
    );
    if (response.statusCode == 200) {
      return Task.fromMap(json.decode(response.body)['data']);
    }
    return null;
  }
}
