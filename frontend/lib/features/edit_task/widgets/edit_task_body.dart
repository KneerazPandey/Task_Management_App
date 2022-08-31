import 'package:flutter/material.dart';
import 'package:frontend/core/constants/app_colors.dart';
import 'package:frontend/features/edit_task/widgets/edit_task_form.dart';
import 'package:get/get.dart';

class EditTaskBody extends StatelessWidget {
  const EditTaskBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/addtask1.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.secondaryColor,
              size: 28,
            ),
          ),
          const EditTaskForm(),
          SizedBox(height: height / 7)
        ],
      ),
    );
  }
}
