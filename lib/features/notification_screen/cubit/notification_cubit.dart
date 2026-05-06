import 'package:bloc/bloc.dart';
import 'package:flutter_project/features/notification_screen/cubit/notification_state.dart';
import 'package:flutter_project/features/notification_screen/repository/notification_repo.dart';

class NotificationCubit extends Cubit<NotificationState> {
  final NotificaionRepo repo;
  NotificationCubit({required this.repo}) : super(NotificationInit());
  Future<void> getAllNotifications() async {
    emit(NotificationLoading());
    final response = await repo.getAllNotification();
    response.fold(
      (fail) => emit(NotificationFailed(failure: fail.errorMessage)),
      (response) => emit(NotificationSuccess(notifications: response)),
    );
  }

  Future<void> markAsRead(String id) async {
    final response = await repo.markAsRead(id);

    response.fold((fail) => print(fail.errorMessage), (_) {
      if (state is NotificationSuccess) {
        final current = (state as NotificationSuccess).notifications;

        final updated = current.map((e) {
          if (e.id.toString() == id) {
            return e.copyWith(isRead: true);
          }
          return e;
        }).toList();

        emit(NotificationSuccess(notifications: updated));
      }
    });
  }

  Future<void> markAllAsRead() async {
    final response = await repo.markAllAsRead();

    response.fold((fail) => print(fail.errorMessage), (_) {
      if (state is NotificationSuccess) {
        final current = (state as NotificationSuccess).notifications;

        final updated = current.map((e) {
          return e.copyWith(isRead: true);
        }).toList();
        getAllNotifications();
        emit(NotificationSuccess(notifications: updated));
      }
    });
  }
}
