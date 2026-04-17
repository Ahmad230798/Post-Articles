import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/features/comments/cubit/comment_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timeago/timeago.dart' as timeago;

class CommentCard extends StatelessWidget {
  final int commentId;
  final String? avatarUrl;
  final String name;
  final String text;
  final String createdAt;
  final int likes;
  final bool isLiked;

  const CommentCard({
    super.key,
    this.avatarUrl,
    required this.commentId,
    required this.name,
    required this.text,
    required this.createdAt,
    required this.likes,
    required this.isLiked,
  });

  @override
  Widget build(BuildContext context) {
    String timeAgo = "";
    if (createdAt.isNotEmpty) {
      try {
        final date = DateTime.parse(createdAt);
        timeAgo = timeago.format(date, locale: "en_short");
      } catch (_) {
        timeAgo = createdAt; // fallback
      }
    }

    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 🔵 Avatar
          CircleAvatar(
            radius: 20.r,
            backgroundColor: Colors.grey.shade300,
            backgroundImage: avatarUrl != null && avatarUrl!.isNotEmpty
                ? NetworkImage(avatarUrl!)
                : null,
            child: avatarUrl == null || avatarUrl!.isEmpty
                ? Text(
                    name.isNotEmpty ? name[0].toUpperCase() : "?",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : null,
          ),

          SizedBox(width: 12.w),

          /// 🔵 Comment Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Username + Time
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1A365D),
                      ),
                    ),
                    Text(
                      timeAgo,
                      style: TextStyle(fontSize: 11.sp, color: Colors.grey),
                    ),
                  ],
                ),

                SizedBox(height: 6.h),

                /// Comment Text
                Text(
                  text,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: const Color(0xFF2D3748),
                  ),
                ),

                SizedBox(height: 8.h),

                /// Likes
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.thumb_up,
                        size: 16.sp,
                        color: isLiked
                            ? const Color(0xFF319795)
                            : Colors.grey, // 🔵 أخضر إذا liked، رمادي إذا لا
                      ),
                      onPressed: () {
                        context.read<CommentsCubit>().toggleLike(commentId);
                      },
                    ),
                    Text(
                      "$likes",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: isLiked ? const Color(0xFF319795) : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
