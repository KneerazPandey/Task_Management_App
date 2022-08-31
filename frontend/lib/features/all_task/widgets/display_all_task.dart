import 'package:flutter/material.dart';
import 'package:frontend/core/constants/app_colors.dart';
import 'package:frontend/core/controllers/task_controller.dart';
import 'package:frontend/core/model/task.dart';
import 'package:frontend/features/edit_task/pages/edit_task_screen.dart';
import 'package:frontend/features/view_task/screens/view_task_screen.dart';
import 'package:frontend/widgets/custom_button.dart';
import 'package:frontend/widgets/task_item_card.dart';
import 'package:get/get.dart';

class DisplayAllTask extends StatefulWidget {
  const DisplayAllTask({Key? key}) : super(key: key);

  @override
  State<DisplayAllTask> createState() => _DisplayAllTaskState();
}

class _DisplayAllTaskState extends State<DisplayAllTask> {
  List<Task> datas = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    await Get.find<TaskController>().getAllTask();
    setState(() {
      datas = Get.find<TaskController>().tasks;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Flexible(
      child: ListView.builder(
        itemCount: datas.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: ObjectKey(index),
            background: buildDismissiblePrimaryBackground(),
            secondaryBackground: buildDismissibleSecondaryBackground(),
            confirmDismiss: (DismissDirection direction) async {
              if (direction == DismissDirection.startToEnd) {
                showModalBottomSheet(
                  barrierColor: Colors.transparent,
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      height: height / 2.5,
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey.withOpacity(0.3),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CustomButton(
                            buttonColor: AppColors.mainColor,
                            text: 'View',
                            textColor: Colors.white,
                            onPressed: () {
                              Navigator.pop(context);
                              Get.to(
                                () => const ViewTaskScreen(),
                                transition: Transition.fade,
                                duration: const Duration(seconds: 1),
                                arguments: datas[index],
                              );
                            },
                          ),
                          const SizedBox(height: 22),
                          CustomButton(
                            buttonColor: AppColors.mainColor,
                            text: 'Edit',
                            textColor: Colors.green,
                            onPressed: () {
                              Navigator.pop(context);
                              Get.to(
                                () => const EditTaskScreen(),
                                transition: Transition.fade,
                                duration: const Duration(seconds: 1),
                                arguments: datas[index],
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
                return false;
              } else {
                await Get.find<TaskController>()
                    .deleteTask(id: datas[index].id);
                return Future.delayed(
                  const Duration(seconds: 1),
                  () => true,
                );
              }
            },
            onDismissed: (DismissDirection direction) {},
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              child: TaskItemCard(
                text: datas[index].taskName,
              ),
            ),
          );
        },
      ),
    );
  }

  Container buildDismissibleSecondaryBackground() {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, top: 10),
      color: Colors.redAccent,
      alignment: Alignment.centerRight,
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Icon(
          Icons.edit,
          color: Colors.white,
          size: 28,
        ),
      ),
    );
  }

  Container buildDismissiblePrimaryBackground() {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, top: 10),
      color: Colors.blueGrey,
      alignment: Alignment.centerLeft,
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Icon(
          Icons.edit,
          color: Colors.white,
          size: 28,
        ),
      ),
    );
  }
}
