// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NotificationStore on _NotificationStore, Store {
  final _$notificationModelAtom =
      Atom(name: '_NotificationStore.notificationModel');

  @override
  Notification get notificationModel {
    _$notificationModelAtom.reportRead();
    return super.notificationModel;
  }

  @override
  set notificationModel(Notification value) {
    _$notificationModelAtom.reportWrite(value, super.notificationModel, () {
      super.notificationModel = value;
    });
  }

  final _$isNotificationListLoadedAtom =
      Atom(name: '_NotificationStore.isNotificationListLoaded');

  @override
  bool get isNotificationListLoaded {
    _$isNotificationListLoadedAtom.reportRead();
    return super.isNotificationListLoaded;
  }

  @override
  set isNotificationListLoaded(bool value) {
    _$isNotificationListLoadedAtom
        .reportWrite(value, super.isNotificationListLoaded, () {
      super.isNotificationListLoaded = value;
    });
  }

  final _$isNotificationListLoadingMoreAtom =
      Atom(name: '_NotificationStore.isNotificationListLoadingMore');

  @override
  bool get isNotificationListLoadingMore {
    _$isNotificationListLoadingMoreAtom.reportRead();
    return super.isNotificationListLoadingMore;
  }

  @override
  set isNotificationListLoadingMore(bool value) {
    _$isNotificationListLoadingMoreAtom
        .reportWrite(value, super.isNotificationListLoadingMore, () {
      super.isNotificationListLoadingMore = value;
    });
  }

  final _$pageNumberAtom = Atom(name: '_NotificationStore.pageNumber');

  @override
  int get pageNumber {
    _$pageNumberAtom.reportRead();
    return super.pageNumber;
  }

  @override
  set pageNumber(int value) {
    _$pageNumberAtom.reportWrite(value, super.pageNumber, () {
      super.pageNumber = value;
    });
  }

  final _$getNotificationListAsyncAction =
      AsyncAction('_NotificationStore.getNotificationList');

  @override
  Future<Notification> getNotificationList(
      dynamic context, dynamic pageNumber) {
    return _$getNotificationListAsyncAction
        .run(() => super.getNotificationList(context, pageNumber));
  }

  @override
  String toString() {
    return '''
notificationModel: ${notificationModel},
isNotificationListLoaded: ${isNotificationListLoaded},
isNotificationListLoadingMore: ${isNotificationListLoadingMore},
pageNumber: ${pageNumber}
    ''';
  }
}
