import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/features/comments/widgets/comment_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/core/widgets/app_top_nav_bar.dart';
import 'package:flutter_project/features/comments/cubit/comment_cubit.dart';
import 'package:flutter_project/features/comments/cubit/comment_state.dart';
import 'package:flutter_project/features/comments/repo/comments_repo.dart';
import 'package:flutter_project/core/services/api/api_services.dart';

class CommentsScreen extends StatelessWidget {
  final String slug;
  const CommentsScreen({super.key, required this.slug});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          CommentsCubit(CommentsRepo(api: ApiServices()))..fetchComments(slug),
      child: BlocBuilder<CommentsCubit, CommentsState>(
        builder: (context, state) {
          final cubit = context.read<CommentsCubit>();

          return Scaffold(
            backgroundColor: const Color(0xFFF7FAFC),
            body: Column(
              children: [
                /// 🔵 Top Navigation Bar
                const AppTopNavBar(title: "Discussion", showBack: true),

                /// 🔵 Main Content
                Expanded(
                  child: state is CommentsLoading
                      ? const Center(child: CircularProgressIndicator())
                      : state is CommentsFailure
                      ? Center(child: Text(state.error))
                      : ListView.builder(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 16.h,
                          ),
                          itemCount: state is CommentsSuccess
                              ? state.comments.length
                              : 0,
                          itemBuilder: (context, index) {
                            final comment =
                                (state as CommentsSuccess).comments[index];
                            return CommentCard(
                              commentId: comment.id,
                              avatarUrl: null,
                              name: comment.authorName,
                              text: comment.text,
                              createdAt: comment.createdAt,
                              likes: comment.likesCount,
                              isLiked: comment.isLiked,
                            );
                          },
                        ),
                ),

                /// 🔵 Input Bar
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 12.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 6,
                        offset: const Offset(0, -2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: cubit.commentController,
                          decoration: InputDecoration(
                            hintText: "Write a comment...",
                            filled: true,
                            fillColor: AppColor.grey.withOpacity(0.1),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.r),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      ElevatedButton(
                        onPressed: () {
                          cubit.addComment(slug, cubit.commentController.text);
                          cubit.commentController.clear();
                        },
                        child: const Text("Post"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
