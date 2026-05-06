import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/features/notification_screen/cubit/notification_cubit.dart';
import 'package:flutter_project/features/notification_screen/model/notification_model.dart';
import 'package:flutter_project/features/notification_screen/widgets/notification_item.dart';

class NotificationList extends StatelessWidget {
  final List<NotificationArticleModel> items;
  final NotificationCubit cubit;
  const NotificationList({super.key, required this.items, required this.cubit});

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return Center(child: Text("No Notificatins"));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];

        return NotificationItem(
          title: item.sender.firstName,
          subtitle: item.description,
          condition: item.isLiked,
          time: timeAgo(item.createdAt),
          onPressed: () {
            cubit.markAsRead(item.id.toString());
            item.isLiked = !item.isLiked;
          },
        );
      },
    );
  }
}

String timeAgo(String date) {
  final createdAt = DateTime.parse(date).toLocal();
  final now = DateTime.now();

  final diff = now.difference(createdAt);

  if (diff.inSeconds < 60) {
    return "just now";
  } else if (diff.inMinutes < 60) {
    return "${diff.inMinutes} min ago";
  } else if (diff.inHours < 24) {
    return "${diff.inHours} hours ago";
  } else if (diff.inDays < 7) {
    return "${diff.inDays} days ago";
  } else {
    return "${createdAt.day}/${createdAt.month}/${createdAt.year}";
  }
}
