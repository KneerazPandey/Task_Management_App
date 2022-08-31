import 'package:flutter/material.dart';
import 'package:frontend/features/view_task/widgets/view_task_body.dart';

class ViewTaskScreen extends StatelessWidget {
  const ViewTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: ViewTaskBody(),
      ),
    );
  }
}
