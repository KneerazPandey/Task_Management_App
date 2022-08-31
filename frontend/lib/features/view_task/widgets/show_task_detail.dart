import 'package:flutter/material.dart';
import 'package:frontend/core/constants/app_colors.dart';
import 'package:frontend/core/model/task.dart';
import 'package:get/get.dart';

class ShowTaskDetail extends StatefulWidget {
  const ShowTaskDetail({Key? key}) : super(key: key);

  @override
  State<ShowTaskDetail> createState() => _ShowTaskDetailState();
}

class _ShowTaskDetailState extends State<ShowTaskDetail> {
  @override
  Widget build(BuildContext context) {
    Task task = Get.arguments as Task;
    double height = MediaQuery.of(context).size.height;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          buildTaskNameTextField(
            hintText: task.taskName,
          ),
          SizedBox(height: height * 0.02),
          buildTaskDetailTextField(
            hintText: task.taskDetail,
          ),
          SizedBox(height: height * 0.05),
        ],
      ),
    );
  }

  TextField buildTaskDetailTextField({
    required String hintText,
  }) {
    return TextField(
      maxLines: 4,
      readOnly: true,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.textHolder,
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.white, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.white, width: 1),
        ),
      ),
    );
  }

  TextField buildTaskNameTextField({
    required String hintText,
  }) {
    return TextField(
      maxLines: 1,
      readOnly: true,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.textHolder,
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.white, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.white, width: 1),
        ),
      ),
    );
  }
}
