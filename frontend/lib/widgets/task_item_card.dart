import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskItemCard extends StatelessWidget {
  final String text;
  final Color? color;

  const TaskItemCard({
    Key? key,
    required this.text,
    this.color = Colors.blueGrey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Container(
      width: double.maxFinite,
      height: height / 13,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFedf0f8),
        borderRadius: BorderRadius.circular(2),
      ),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.poppins(
            fontSize: 18,
            color: color,
          ),
        ),
      ),
    );
  }
}
