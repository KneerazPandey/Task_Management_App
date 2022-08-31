import 'package:flutter/material.dart';
import 'package:frontend/core/constants/app_colors.dart';
import 'package:frontend/core/controllers/task_controller.dart';
import 'package:frontend/widgets/custom_button.dart';
import 'package:get/get.dart';

class AddTaskForm extends StatefulWidget {
  const AddTaskForm({Key? key}) : super(key: key);

  @override
  State<AddTaskForm> createState() => _AddTaskFormState();
}

class _AddTaskFormState extends State<AddTaskForm> {
  final _addTaskFormKey = GlobalKey<FormState>();
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

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Form(
        key: _addTaskFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            buildTaskNameTextField(),
            SizedBox(height: height * 0.02),
            buildTaskDetailTextField(),
            SizedBox(height: height * 0.05),
            CustomButton(
              buttonColor: AppColors.mainColor,
              text: 'Add',
              textColor: Colors.white,
              onPressed: () async {
                if (_addTaskFormKey.currentState!.validate()) {
                  await Get.find<TaskController>().addTask(
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
