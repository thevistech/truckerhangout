import 'package:flutterapp/models/advertisement_model.dart';
import 'package:flutterapp/models/jobs_model.dart';
import 'package:flutterapp/ui/googleMapClustering/places.dart';
import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../models/notification_model.dart';
import '../resources/network_services.dart';
import '../resources/network_calls_apis.dart';
import 'package:mobx/mobx.dart';
part 'job_store.g.dart';

enum LoadingState { none, loading, error }

class JobsStore = _JobsStore with _$JobsStore;

abstract class _JobsStore with Store {
  NetworkService networkService = new NetworkService();

  @observable
  List<ClusterItem<Place>> items;
  @observable
  JobsModel jobsModel;

  @observable
  bool isJobsListLoaded = false;

  @observable
  bool isAdvertisementsLoaded = false;

  @observable
  Advertisements advertisementsModel;

  @action
  Future<Advertisements> getAdvertisement(context) async {
    advertisementsModel = await networkService.getAdvertisement(
        advertisementApi, context, "Jobs");
    if (advertisementsModel.error == "false") isAdvertisementsLoaded = true;
    return advertisementsModel;
  }

  @action
  Future<JobsModel> getJobsList(context, pagno) async {
    jobsModel = await networkService.getJobData(jobsApiUrl, context, pagno);
    try {
      items = [
        for (int i = 0; i < jobsModel.data.length; i++)
          if (jobsModel.data[i].address.length > 0)
            ClusterItem(
                LatLng(double.parse(jobsModel.data[i].address[0].latitude),
                    double.parse(jobsModel.data[i].address[0].longitude)),
                item: Place(name: jobsModel.data[i].address[0].id)),
      ];
    } catch (c) {}
    if (jobsModel.error == "false") isJobsListLoaded = true;
    return jobsModel;
  }
}
