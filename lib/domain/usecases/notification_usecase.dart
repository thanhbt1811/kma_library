import 'package:flutter/material.dart';
import 'package:getx_base_code/common/common_export.dart';
import 'package:getx_base_code/common/config/network/session_data.dart';
import 'package:getx_base_code/data/remote/notification_repository.dart';
import 'package:getx_base_code/domain/models/new_model.dart';
import 'package:getx_base_code/domain/models/notification_model.dart';

class NotificationUsecase {
  final NotificationRepository _notificationRepository;

  NotificationUsecase(this._notificationRepository);

  Future<List<NotificationModel>> getNotifications(
      BuildContext context, int page, int size) async {
    final noties = <NotificationModel>[];
    final res = await requestApi(
        () => _notificationRepository.getNotification(
            SessionData.authToken, page, size),
        context);
    if (res.result ?? false) {
      for (final noti in res.data) {
        noties.add(
          NotificationModel.fromJson(noti),
        );
      }
    }
    return noties;
  }

  Future<bool> delete(BuildContext context, String id) async {
    final res = await requestApi(
        () => _notificationRepository.deleteNotification(
            SessionData.authToken, id),
        context);
    return res.result ?? false;
  }

  Future<List<NewModel>> getNews(
      BuildContext context, int page, int size) async {
    final res = await requestApi(
        () => _notificationRepository.getNew(page, size), context);
    final news = <NewModel>[];
    if (res.result ?? false) {
      for (final data in res.data['data']) {
        news.add(
          NewModel.fromJson(data),
        );
      }
    }
    return news;
  }
}
