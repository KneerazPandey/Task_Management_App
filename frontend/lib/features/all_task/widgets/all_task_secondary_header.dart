import 'package:flutter/material.dart';
import 'package:frontend/core/constants/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AllTaskSecondaryHeader extends StatelessWidget {
  const AllTaskSecondaryHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: <Widget>[
          const Icon(
            Icons.home,
            color: AppColors.secondaryColor,
            size: 26,
          ),
          const SizedBox(width: 12),
          Container(
            width: 26,
            height: 26,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              color: Colors.blueGrey.shade900,
            ),
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 20,
            ),
          ),
          Expanded(child: Container()),
          const Icon(
            Icons.calendar_month_sharp,
            color: AppColors.secondaryColor,
          ),
          const SizedBox(width: 10),
          Text(
            '2',
            style: GoogleFonts.poppins(
              color: AppColors.secondaryColor,
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }
}
