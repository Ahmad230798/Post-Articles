import 'package:flutter/material.dart';
import 'package:flutter_project/core/constants/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool condition;
  final void Function()? onPressed;
  final String time;

  const NotificationItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.condition,
    this.onPressed,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          width: 1.sw,
          color: condition ? Colors.grey : Colors.white,
          child: ListTile(
            isThreeLine: true,
            title: Row(
              children: [
                Text(
                  title,
                  style: AppTextStyle.font20boldWhite.copyWith(
                    color: Colors.black,
                  ),
                ),
                Spacer(),
                Text(
                  time,
                  style: AppTextStyle.font10boldgray.copyWith(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            subtitle: Text(subtitle, style: AppTextStyle.font14semibolddark),
            trailing: IconButton(
              onPressed: onPressed,
              icon: Icon(
                condition
                    ? Icons.circle_notifications_outlined
                    : Icons.circle_notifications_rounded,
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
