
import 'package:flutterapp/models/users_calls_model.dart';
import 'package:flutterapp/resources/network_calls_apis.dart';
import 'package:flutterapp/resources/network_services.dart';
import 'package:mobx/mobx.dart';

part 'user_calls_store.g.dart';

class UsersCallsStore = _DashBoardMainStore with _$UsersCallsStore;

abstract class _DashBoardMainStore with Store {
  List<ReactionDisposer> _disposers;
  NetworkService networkService = new NetworkService();

  UsersCalslModel usersCalslModel;
  @observable
  bool iscallsLoaded = false;




  @action
  Future<UsersCalslModel> getCalls(context) async {
    usersCalslModel = await networkService.getUserCallsData(usersCallsApi, context);
    if (usersCalslModel.error == "false") iscallsLoaded = true;
    return usersCalslModel;
  }

}