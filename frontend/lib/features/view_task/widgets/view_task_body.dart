import 'package:flutter/material.dart';
import 'package:frontend/features/view_task/widgets/show_task_detail.dart';
import 'package:frontend/features/view_task/widgets/view_task_header.dart';

class ViewTaskBody extends StatelessWidget {
  const ViewTaskBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Column(
      children: <Widget>[
        const ViewTaskHeader(),
        SizedBox(height: height / 12),
        const ShowTaskDetail(),
      ],
    );
  }
}
