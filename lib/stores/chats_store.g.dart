// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chats_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$onlinePersonsChatsStore on _onlinePersonsChatsStore, Store {
  final _$onlinePersonsChatDataAtom =
      Atom(name: '_onlinePersonsChatsStore.onlinePersonsChatData');

  @override
  OnlinePersonsChat get onlinePersonsChatData {
    _$onlinePersonsChatDataAtom.reportRead();
    return super.onlinePersonsChatData;
  }

  @override
  set onlinePersonsChatData(OnlinePersonsChat value) {
    _$onlinePersonsChatDataAtom.reportWrite(value, super.onlinePersonsChatData,
        () {
      super.onlinePersonsChatData = value;
    });
  }

  final _$chatGeneralModelAtom =
      Atom(name: '_onlinePersonsChatsStore.chatGeneralModel');

  @override
  ChatGeneralModel get chatGeneralModel {
    _$chatGeneralModelAtom.reportRead();
    return super.chatGeneralModel;
  }

  @override
  set chatGeneralModel(ChatGeneralModel value) {
    _$chatGeneralModelAtom.reportWrite(value, super.chatGeneralModel, () {
      super.chatGeneralModel = value;
    });
  }

  final _$onlineUsersAtom = Atom(name: '_onlinePersonsChatsStore.onlineUsers');

  @override
  OnlineUsersChat get onlineUsers {
    _$onlineUsersAtom.reportRead();
    return super.onlineUsers;
  }

  @override
  set onlineUsers(OnlineUsersChat value) {
    _$onlineUsersAtom.reportWrite(value, super.onlineUsers, () {
      super.onlineUsers = value;
    });
  }

  final _$ischatLoadedAtom =
      Atom(name: '_onlinePersonsChatsStore.ischatLoaded');

  @override
  bool get ischatLoaded {
    _$ischatLoadedAtom.reportRead();
    return super.ischatLoaded;
  }

  @override
  set ischatLoaded(bool value) {
    _$ischatLoadedAtom.reportWrite(value, super.ischatLoaded, () {
      super.ischatLoaded = value;
    });
  }

  final _$isUsersLoadedAtom =
      Atom(name: '_onlinePersonsChatsStore.isUsersLoaded');

  @override
  bool get isUsersLoaded {
    _$isUsersLoadedAtom.reportRead();
    return super.isUsersLoaded;
  }

  @override
  set isUsersLoaded(bool value) {
    _$isUsersLoadedAtom.reportWrite(value, super.isUsersLoaded, () {
      super.isUsersLoaded = value;
    });
  }

  final _$isGernalApiLodedAtom =
      Atom(name: '_onlinePersonsChatsStore.isGernalApiLoded');

  @override
  bool get isGernalApiLoded {
    _$isGernalApiLodedAtom.reportRead();
    return super.isGernalApiLoded;
  }

  @override
  set isGernalApiLoded(bool value) {
    _$isGernalApiLodedAtom.reportWrite(value, super.isGernalApiLoded, () {
      super.isGernalApiLoded = value;
    });
  }

  final _$isListLoadingMoreAtom =
      Atom(name: '_onlinePersonsChatsStore.isListLoadingMore');

  @override
  bool get isListLoadingMore {
    _$isListLoadingMoreAtom.reportRead();
    return super.isListLoadingMore;
  }

  @override
  set isListLoadingMore(bool value) {
    _$isListLoadingMoreAtom.reportWrite(value, super.isListLoadingMore, () {
      super.isListLoadingMore = value;
    });
  }

  final _$pageNumberAtom = Atom(name: '_onlinePersonsChatsStore.pageNumber');

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

  final _$getChatAsyncAction = AsyncAction('_onlinePersonsChatsStore.getChat');

  @override
  Future<OnlinePersonsChat> getChat(dynamic context, dynamic pageNumber) {
    return _$getChatAsyncAction.run(() => super.getChat(context, pageNumber));
  }

  final _$getChatGeneralDataAsyncAction =
      AsyncAction('_onlinePersonsChatsStore.getChatGeneralData');

  @override
  Future<ChatGeneralModel> getChatGeneralData(
      dynamic context, dynamic pageNumber) {
    return _$getChatGeneralDataAsyncAction
        .run(() => super.getChatGeneralData(context, pageNumber));
  }

  final _$getOnlineUsersAsyncAction =
      AsyncAction('_onlinePersonsChatsStore.getOnlineUsers');

  @override
  Future<OnlineUsersChat> getOnlineUsers(dynamic context) {
    return _$getOnlineUsersAsyncAction.run(() => super.getOnlineUsers(context));
  }

  @override
  String toString() {
    return '''
onlinePersonsChatData: ${onlinePersonsChatData},
chatGeneralModel: ${chatGeneralModel},
onlineUsers: ${onlineUsers},
ischatLoaded: ${ischatLoaded},
isUsersLoaded: ${isUsersLoaded},
isGernalApiLoded: ${isGernalApiLoded},
isListLoadingMore: ${isListLoadingMore},
pageNumber: ${pageNumber}
    ''';
  }
}
