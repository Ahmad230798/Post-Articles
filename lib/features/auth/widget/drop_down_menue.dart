import 'package:flutter/material.dart';
import 'package:flutter_project/core/constants/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DropDownMenue extends StatefulWidget {
  const DropDownMenue({super.key});

  @override
  State<DropDownMenue> createState() => _DropDownMenueState();
}

class _DropDownMenueState extends State<DropDownMenue> {
  String selectedSubject = 'Theoretical Physics';
  final subjects = [
    'Theoretical Physics',
    'Experimental Physics',
    'Quantum Mechanics',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46.h,
      decoration: BoxDecoration(
        border: Border.all(width: 1),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: DropdownButton<String>(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        menuMaxHeight: 1.sh,
        borderRadius: BorderRadius.circular(8.r),
        isExpanded: true,
        underline: SizedBox(),
        icon: Icon(Icons.keyboard_arrow_down_outlined),
        value: selectedSubject,
        onChanged: (String? newValue) {
          setState(() {
            selectedSubject = newValue!;
          });
        },
        items: subjects.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value, style: AppTextStyle.font14regulardarkblue),
          );
        }).toList(),
      ),
    );
  }
}
