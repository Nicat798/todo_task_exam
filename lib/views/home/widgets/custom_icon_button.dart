import 'package:flutter/material.dart';
import 'package:todo_exam/core/consts/app_colors.dart';

class CustomIconButton extends StatelessWidget {
  final Function() onTap;
  final bool isCompleted;

  const CustomIconButton({
    super.key,
    required this.onTap,
    required this.isCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: Icon(
        isCompleted ? Icons.verified : Icons.replay_outlined,
        color: isCompleted ? AppColors.generalGreen : AppColors.generalRed,
      ),
    );
  }
}
