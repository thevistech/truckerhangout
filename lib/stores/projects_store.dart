import 'package:flutterapp/models/advertisement_model.dart';
import 'package:flutterapp/models/post_model.dart';
import 'package:flutterapp/ui/googleMapClustering/places.dart';
import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../resources/network_services.dart';
import '../resources/network_calls_apis.dart';
import 'package:mobx/mobx.dart';

part 'projects_store.g.dart';

class ProjectStore = _ProjectStore with _$ProjectStore;

abstract class _ProjectStore with Store {
  NetworkService networkService = new NetworkService();

  @observable
  List<ClusterItem<Place>> items;
  @observable
  bool isAdvertisementsLoaded = false;

  @observable
  bool isProjectsPostLoaded = false;

  @observable
  Advertisements advertisementsModel;

  @observable
  PostModel postModel;

  @action
  Future<Advertisements> getAdvertisement(context) async {
    advertisementsModel = await networkService.getAdvertisement(
        advertisementApi, context, "Projects");
    if (advertisementsModel.error == "false") isAdvertisementsLoaded = true;
    return advertisementsModel;
  }

  @action
  Future<PostModel> getProperties(context) async {
    postModel = await networkService.getProperties(projectsApi, context);
    try {
      items = [
        for (int i = 0; i < postModel.data.length; i++)
          if (postModel.data[i].address.length > 0)
            ClusterItem(
                LatLng(double.parse(postModel.data[i].address[0].latitude),
                    double.parse(postModel.data[i].address[0].longitude)),
                item: Place(name: postModel.data[i].address[0].id)),
      ];
    } catch (c) {}
    if (postModel.error == "false") isProjectsPostLoaded = true;
    return postModel;
  }
}
