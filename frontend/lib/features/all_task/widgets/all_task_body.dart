import 'package:flutter/material.dart';
import 'package:frontend/features/all_task/widgets/all_task_header.dart';
import 'package:frontend/features/all_task/widgets/all_task_secondary_header.dart';
import 'package:frontend/features/all_task/widgets/display_all_task.dart';

class AllTaskBody extends StatelessWidget {
  const AllTaskBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const <Widget>[
        AllTaskHeader(),
        SizedBox(height: 16),
        AllTaskSecondaryHeader(),
        SizedBox(height: 16),
        DisplayAllTask(),
      ],
    );
  }
}
