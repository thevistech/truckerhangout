import 'package:flutterapp/models/chat_general_model.dart';
import 'package:flutterapp/models/online_chat_users_model.dart';
import 'package:flutterapp/models/online_persons_chat_model.dart';
import '../resources/network_services.dart';
import '../resources/network_calls_apis.dart';
import 'package:mobx/mobx.dart';
part 'chats_store.g.dart';

enum LoadingState { none, loading, error }

class onlinePersonsChatsStore = _onlinePersonsChatsStore
    with _$onlinePersonsChatsStore;

abstract class _onlinePersonsChatsStore with Store {
  NetworkService networkService = new NetworkService();

  @observable
  OnlinePersonsChat onlinePersonsChatData;
  @observable
  ChatGeneralModel chatGeneralModel;

  @observable
  OnlineUsersChat onlineUsers;

  @observable
  bool ischatLoaded = false;

  @observable
  bool isUsersLoaded = false;
  @observable
  bool isGernalApiLoded = false;
  @observable
  bool isListLoadingMore = false;
  @observable
  int pageNumber = 1;

  @action
  Future<OnlinePersonsChat> getChat(context, pageNumber) async {
    onlinePersonsChatData = await networkService.onlinePersonsForChat(
        onlineChatsPersons, context, pageNumber);
    if (onlinePersonsChatData.error == "false") ischatLoaded = true;
    return onlinePersonsChatData;
  }

  @action
  Future<ChatGeneralModel> getChatGeneralData(context, pageNumber) async {
    chatGeneralModel =
        await networkService.chatGernalDataApi(gernalChat, context, pageNumber);
    if (chatGeneralModel.error == "false") isGernalApiLoded = true;
    return chatGeneralModel;
  }

  @action
  Future<OnlineUsersChat> getOnlineUsers(context) async {
    onlineUsers =
        await networkService.onlineUsersForChat(onlineUsersForChats, context);
    if (onlineUsers.error == "false") isUsersLoaded = true;
    return onlineUsers;
  }
}
