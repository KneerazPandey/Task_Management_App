import 'package:flutter/material.dart';
import 'package:frontend/features/all_task/widgets/all_task_body.dart';

class AllTaskScreen extends StatelessWidget {
  const AllTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: AllTaskBody(),
      ),
    );
  }
}
