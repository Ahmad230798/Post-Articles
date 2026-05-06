import 'package:equatable/equatable.dart';
import 'package:flutter_project/core/errors/failur_request.dart';
import 'package:flutter_project/features/notification_screen/model/notification_model.dart';

abstract class NotificationState extends Equatable {
  const NotificationState();
  @override
  List<Object?> get props => [];
}

class NotificationInit extends NotificationState {
  const NotificationInit();
}

class NotificationLoading extends NotificationState {
  const NotificationLoading();
}

class NotificationSuccess extends NotificationState {
  final List<NotificationArticleModel> notifications;

  const NotificationSuccess({required this.notifications});
  @override
  List<Object> get props => [notifications];
}

class NotificationFailed extends NotificationState {
  final String failure;
  const NotificationFailed({required this.failure});
  @override
  List<Object> get props => [failure];
}
