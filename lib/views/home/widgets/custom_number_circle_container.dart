import 'package:flutter/material.dart';
import 'package:todo_exam/core/consts/app_colors.dart';

class CustomNumberCircleContainer extends StatelessWidget {
  const CustomNumberCircleContainer(
      {super.key, required this.isCompleted, required this.currentTodoId});
  final bool isCompleted;
  final String currentTodoId;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isCompleted ? AppColors.generalGreen : AppColors.generalRed,
      ),
      child: Text(
        currentTodoId,
        style: const TextStyle(
            fontWeight: FontWeight.w600, fontSize: 15, color: Colors.white),
      ),
    );
  }
}
