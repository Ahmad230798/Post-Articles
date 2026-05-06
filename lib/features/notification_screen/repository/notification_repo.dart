import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_project/core/errors/failur_request.dart';
import 'package:flutter_project/core/services/api/api_link.dart';
import 'package:flutter_project/core/services/api/api_services.dart';
import 'package:flutter_project/features/notification_screen/model/notification_model.dart';

class NotificaionRepo {
  final ApiServices _api = ApiServices();
  Future<Either<Failure, List<NotificationArticleModel>>>
  getAllNotification() async {
    try {
      final response = await _api.getData(url: ApiLink.getAllNotification);
      final notification = NotificationResponseModel.fromJson(
        Map<String, dynamic>.from(response),
      );
      return right(notification.results);
    } on ServerFailure catch (error) {
      return left(error);
    } catch (error) {
      return left(ServerFailure(error.toString()));
    }
  }

  Future<Either<Failure, String>> markAsRead(String id) async {
    try {
      final response = await _api.postData(url: ApiLink.markAsRead(id));
      return right(response['message']);
    } on ServerFailure catch (error) {
      return left(error);
    } catch (error) {
      return left(ServerFailure(error.toString()));
    }
  }

  Future<Either<Failure, String>> markAllAsRead() async {
    try {
      final response = await _api.postData(url: ApiLink.markAllAsRead);
      return right(response['message']);
    } on ServerFailure catch (error) {
      return left(error);
    } catch (error) {
      return left(ServerFailure(error.toString()));
    }
  }
}
