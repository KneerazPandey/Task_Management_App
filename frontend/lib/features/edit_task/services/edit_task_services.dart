import 'dart:convert';
import 'dart:io';

import 'package:frontend/core/model/task.dart';
import 'package:get/get.dart';

class EditTaskService extends GetConnect implements GetxService {
  Future<Task?> editTask({
    required int id,
    required String taskName,
    required String taskDetail,
  }) async {
    try {
      String url = 'http://10.0.2.2:8000/task/update/$id/';
      Response response = await put(
        url,
        json.encode({
          'task_name': taskName,
          'task_detail': taskDetail,
        }),
      );
      if (response.statusCode == 200) {
        return Task.fromMap(response.body);
      }
    } on SocketException {
      Get.snackbar(
        "Connection Failed",
        "Server is currently offline. Please try later.",
      );
    } on FormatException {
      Get.snackbar(
        "Cannot Parse",
        "Cannot properly parsed the data by server. Please pass the correct value",
      );
    }
    return null;
  }
}
