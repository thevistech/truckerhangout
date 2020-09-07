import 'package:flutterapp/models/developers_model.dart';
import '../resources/network_services.dart';
import '../resources/network_calls_apis.dart';
import 'package:mobx/mobx.dart';
part 'create_project_store.g.dart';

enum LoadingState { none, loading, error }

class CreateProjectStore = _CreateProjectStore with _$CreateProjectStore;

abstract class _CreateProjectStore with Store {
  NetworkService networkService = new NetworkService();
/* 
  @observable
  DeveloperModel developerModel;
  @observable
  bool isDeveloperListLoaded = false;
  @observable
  bool isDeveloperListLoadingMore = false;
  @observable
  int pageNumber = 1;

  @action
  Future<DeveloperModel> getAllDeveloperData(
      context, pageNumber, search) async {
    developerModel = await networkService.getDeveloperData(
        notificationApi, context, pageNumber, search);
    return developerModel;
  } */
}
