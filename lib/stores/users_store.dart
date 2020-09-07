import 'package:flutterapp/models/advertisement_model.dart';
import 'package:flutterapp/models/jobs_model.dart';
import 'package:flutterapp/models/online_chat_users_model.dart';
import 'package:flutterapp/models/online_persons_chat_model.dart';
import 'package:flutterapp/models/user_profile_model.dart';

import '../models/notification_model.dart';
import '../resources/network_services.dart';
import '../resources/network_calls_apis.dart';
import 'package:mobx/mobx.dart';

part 'users_store.g.dart';

enum LoadingState { none, loading, error }

class UsersProfile = _users with _$UsersProfile;

abstract class _users with Store {
  NetworkService networkService = new NetworkService();


  @observable
  ProfileModel profileModel;


  @observable
  bool isUsersLoaded = false;



  @action
  Future<ProfileModel> getProfile(context, String userId) async {
    profileModel = await networkService.getUsersProfile(usersProfile,context,userId);
    if (profileModel.error == "false") isUsersLoaded = true;
    return profileModel;
  }

}
