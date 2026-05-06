import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/core/constants/text_style.dart';
import 'package:flutter_project/core/widgets/app_top_nav_bar.dart';
import 'package:flutter_project/features/notification_screen/cubit/notification_cubit.dart';
import 'package:flutter_project/features/notification_screen/cubit/notification_state.dart';
import 'package:flutter_project/features/notification_screen/widgets/notifications_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTopNavBar(title: "Notification"),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 32.h),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Notifications",
                        style: AppTextStyle.font36bolddarkblue,
                      ),
                      Spacer(),
                      TextButton(
                        onPressed: () {
                          context.read<NotificationCubit>().markAllAsRead();
                        },
                        child: Text(
                          "Mark all",
                          style: TextStyle(color: AppColor.green),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: DefaultTabController(
                      length: 2,
                      child: Column(
                        children: [
                          const TabBar(
                            dividerHeight: 0,
                            labelColor: Color(0xFF1A365D),
                            unselectedLabelColor: Color(0xFF4A5568),
                            indicatorColor: Color(0xFF319795),
                            indicatorWeight: 2,
                            labelStyle: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1,
                            ),
                            tabs: [
                              Tab(text: "ALL"),
                              Tab(text: "UNREAD"),
                            ],
                          ),
    
                          Expanded(
                            child:
                                BlocBuilder<
                                  NotificationCubit,
                                  NotificationState
                                >(
                                  builder: (context, state) {
                                    final cubit = context
                                        .read<NotificationCubit>();
                                    if (state is NotificationLoading) {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                    if (state is NotificationFailed) {
                                      return Center(
                                        child: Text(state.failure),
                                      );
                                    }
    
                                    if (state is NotificationSuccess) {
                                      final allNotifications =
                                          state.notifications;
                                      final unread = allNotifications
                                          .where(
                                            (item) => item.isLiked == false,
                                          )
                                          .toList();
    
                                      return Column(
                                        children: [
                                          Expanded(
                                            child: TabBarView(
                                              children: [
                                                NotificationList(
                                                  items: allNotifications,
                                                  cubit: cubit,
                                                ),
                                                NotificationList(
                                                  items: unread,
                                                  cubit: cubit,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      );
                                    }
    
                                    return const SizedBox.shrink();
                                  },
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
