import 'package:flutter/material.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/core/constants/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {
  final Color? fillColor;
  final Color? focusColor;
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? hintStyle;
  final String hinttText;
  final bool? isObscureText;
  final Widget? suffixIcone;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final int? linesCount;
  final bool? isFilled;
  const AppTextFormField({
    super.key,
    required this.hinttText,
    this.isObscureText,
    this.suffixIcone,
    this.onChanged,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.hintStyle,
    this.controller,
    this.validator,
    this.linesCount,
    this.fillColor,
    this.focusColor,
    this.isFilled,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: (isObscureText ?? false) ? 1 : (linesCount ?? 1),
      onChanged: onChanged,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        filled: isFilled,
        fillColor: fillColor,

        isDense: true,
        contentPadding:
            contentPadding ??
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        focusedBorder:
            focusedBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(color: AppColor.primary, width: 1.3),
              borderRadius: BorderRadius.circular(8.r),
            ),
        enabledBorder:
            enabledBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(color: AppColor.grey, width: 1.3),
              borderRadius: BorderRadius.circular(8.r),
            ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1.3),
          borderRadius: BorderRadius.circular(8.r),
        ),
        hintStyle: hintStyle ?? AppTextStyle.font16regularlightgray,
        hintText: hinttText,
        suffixIcon: suffixIcone,
      ),
      obscureText: isObscureText ?? false,
      style: AppTextStyle.font14regulardarkblue,
    );
  }
}
