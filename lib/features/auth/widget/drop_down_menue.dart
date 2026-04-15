import 'package:flutter/material.dart';
import 'package:flutter_project/core/constants/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DropDownMenue extends StatelessWidget {
  final String value;
  final ValueChanged<String?>? onChanged;
  final Color? dropDownColor;
  final Color? focusColor;
  final BoxBorder? border;
  const DropDownMenue({
    super.key,
    required this.value,
    this.onChanged,
    this.dropDownColor,
    this.focusColor, this.border,
  });

  static const List<String> subjects = [
    'graduate',
    'phd',
    'professor',
    'researcher',
    'undergraduate',
    'other',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46.h,
      decoration: BoxDecoration(
        color: focusColor ?? Colors.white,

        border: border ?? Border.all(width: 1),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: DropdownButton<String>(
        
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        menuMaxHeight: 1.sh,
        borderRadius: BorderRadius.circular(8.r),
        isExpanded: true,
        underline: const SizedBox(),
        icon: const Icon(Icons.keyboard_arrow_down_outlined),
        value: value,
        onChanged: onChanged,
        items: subjects.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item, style: AppTextStyle.font14regulardarkblue),
          );
        }).toList(),
      ),
    );
  }
}
