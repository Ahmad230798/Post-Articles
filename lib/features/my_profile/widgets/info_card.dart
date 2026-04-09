import 'package:flutter/material.dart';
import 'package:flutter_project/core/constants/app_font.dart';
import 'package:flutter_project/core/constants/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoCard extends StatelessWidget {
  final String count;
  final String text;
  const InfoCard({super.key, required this.count, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 165.w,
      height: 106,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Color(0xffCBD5E0)),
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(count, style: AppTextStyle.font30boldblack),
            Text(
              text,
              style: AppTextStyle.font12semiboldbluegray.copyWith(
                fontFamily: AppFont.publicSans,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
