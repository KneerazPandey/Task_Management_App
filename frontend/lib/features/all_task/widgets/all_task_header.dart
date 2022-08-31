import 'package:flutter/material.dart';
import 'package:frontend/core/constants/app_colors.dart';
import 'package:get/get.dart';

class AllTaskHeader extends StatelessWidget {
  const AllTaskHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Container(
      width: double.maxFinite,
      height: height / 3.2,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/header1.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(top: 6, left: 8),
        child: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.secondaryColor,
            size: 26,
          ),
        ),
      ),
    );
  }
}
