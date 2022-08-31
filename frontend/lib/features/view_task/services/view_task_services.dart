import 'dart:io';

import 'package:frontend/core/model/task.dart';
import 'package:get/get.dart';

class ViewTaskService extends GetConnect implements GetxService {
  Future<Task?> getSingleTask({
    required int id,
  }) async {
    try {
      var url = "http://10.0.2.2:8000/todo/$id";
      Response response = await get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );
      if (response.statusCode == 200) {
        return Task.fromMap(response.body);
      } else {
        throw const SocketException('Connection Error');
      }
    } on SocketException {
      Get.snackbar(
        "Connection Error",
        "The server is currently offline. Please try later",
      );
    } on FormatException {
      Get.snackbar(
        "Cannot Parse",
        "The content obtain from server cannot be parsed",
      );
    }
    return null;
  }
}
