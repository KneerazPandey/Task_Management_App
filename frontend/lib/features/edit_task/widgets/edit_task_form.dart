import 'package:flutter/material.dart';
import 'package:frontend/core/constants/app_colors.dart';
import 'package:frontend/core/controllers/task_controller.dart';
import 'package:frontend/core/model/task.dart';
import 'package:frontend/widgets/custom_button.dart';
import 'package:get/get.dart';

class EditTaskForm extends StatefulWidget {
  const EditTaskForm({Key? key}) : super(key: key);

  @override
  State<EditTaskForm> createState() => _EditTaskFormState();
}

class _EditTaskFormState extends State<EditTaskForm> {
  final _editTaskFormKey = GlobalKey<FormState>();
  final TextEditingController _taskNameController = TextEditingController();
  final TextEditingController _taskDetailController = TextEditingController();

  @override
  void dispose() {
    _taskNameController.dispose();
    _taskDetailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    Task task = Get.arguments as Task;
    _taskNameController.text = task.taskName;
    _taskDetailController.text = task.taskDetail;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Form(
        key: _editTaskFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            buildTaskNameTextField(),
            SizedBox(height: height * 0.02),
            buildTaskDetailTextField(),
            SizedBox(height: height * 0.05),
            CustomButton(
              buttonColor: AppColors.mainColor,
              text: 'Edit',
              textColor: Colors.white,
              onPressed: () async {
                if (_editTaskFormKey.currentState!.validate()) {
                  await Get.find<TaskController>().editTask(
                    id: task.id,
                    taskName: _taskNameController.text.trim(),
                    taskDetail: _taskDetailController.text.trim(),
                  );
                  _taskDetailController.text = '';
                  _taskNameController.text = '';
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  TextFormField buildTaskDetailTextField() {
    return TextFormField(
      maxLines: 4,
      controller: _taskDetailController,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.textHolder,
        hintText: 'Task detail',
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.white, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.white, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.red, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.white, width: 1),
        ),
      ),
      validator: (String? value) {
        String data = value ?? '';
        if (data.isEmpty) {
          return 'Please enter task name';
        } else if (data.length <= 4) {
          return 'Task name should be greater then 4 character';
        }
        return null;
      },
    );
  }

  TextFormField buildTaskNameTextField() {
    return TextFormField(
      maxLines: 1,
      controller: _taskNameController,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.textHolder,
        hintText: 'Task name',
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.white, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.white, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.red, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.white, width: 1),
        ),
      ),
      validator: (String? value) {
        String data = value ?? '';
        if (data.isEmpty) {
          return 'Please enter task detail';
        } else if (data.length <= 10) {
          return 'Task detail should be greater then 10 character';
        }
        return null;
      },
    );
  }
}
