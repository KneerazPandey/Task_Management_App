import 'package:flutter/material.dart';
import 'package:frontend/core/constants/app_colors.dart';
import 'package:frontend/features/add_task/pages/add_task_screen.dart';
import 'package:frontend/features/all_task/pages/all_task_screen.dart';
import 'package:frontend/widgets/custom_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/welcome.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Hello',
            style: GoogleFonts.sansita(
              fontSize: 62,
              color: AppColors.mainColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'start your beautiful day',
            style: GoogleFonts.poppins(
              fontSize: 20,
              color: AppColors.mainColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: height / 2.5),
          CustomButton(
            buttonColor: AppColors.mainColor,
            text: 'Add Task',
            textColor: Colors.white,
            onPressed: () {
              Get.to(
                () => const AddTaskScreen(),
                transition: Transition.fade,
                duration: const Duration(seconds: 1),
              );
            },
          ),
          SizedBox(height: height / 22),
          CustomButton(
            buttonColor: Colors.white,
            text: 'View All Task',
            textColor: AppColors.mainColor,
            onPressed: () {
              Get.to(
                () => const AllTaskScreen(),
                transition: Transition.fade,
                duration: const Duration(seconds: 1),
              );
            },
          ),
        ],
      ),
    );
  }
}
