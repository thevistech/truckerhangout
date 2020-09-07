import '../models/notification_model.dart';
import '../resources/network_services.dart';
import '../resources/network_calls_apis.dart';
import 'package:mobx/mobx.dart';

part 'notification_store.g.dart';

enum LoadingState { none, loading, error }

class NotificationStore = _NotificationStore with _$NotificationStore;

abstract class _NotificationStore with Store {
  NetworkService networkService = new NetworkService();

  @observable
  Notification notificationModel;
  @observable
  bool isNotificationListLoaded = false;
  @observable
  bool isNotificationListLoadingMore = false;
  @observable
  int pageNumber = 1;

  @action
  Future<Notification> getNotificationList(context, pageNumber) async {
    notificationModel = await networkService.getNotificationData(
        notificationApi, context, pageNumber);
    return notificationModel;
  }
}
