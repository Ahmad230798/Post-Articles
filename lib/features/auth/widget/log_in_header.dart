import 'package:flutter/material.dart';
import 'package:flutter_project/core/constants/text_style.dart';

class LogInHeader extends StatelessWidget {
  const LogInHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("ScholarLink", style: AppTextStyle.font18boldlightblue),
    );
  }
}
