import 'dart:convert';
import 'package:flutterapp/models/auth_model.dart';
import 'package:flutterapp/models/brokers_dashboard.dart';
import 'package:flutterapp/models/comment_model.dart';
import 'package:flutterapp/models/developers_model.dart';
import 'package:flutterapp/models/filter_property_model.dart';
import 'package:flutterapp/models/post_model.dart';
import 'package:flutterapp/models/stories_model.dart';
import 'package:flutterapp/models/like_model.dart';
import 'package:flutterapp/models/advertisement_model.dart';
import 'package:flutterapp/models/follow_suggestion_model.dart';
import 'package:flutterapp/models/toggle_follow_unfollow.dart';
import 'package:flutterapp/resources/network_services.dart';
import 'package:flutterapp/resources/network_calls_apis.dart';
import 'package:flutterapp/ui/googleMapClustering/places.dart';
import 'package:flutterapp/utills/config.dart';
import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:flutterapp/models/brokers_dashboard.dart' as brokers;

part 'dashboard_main_store.g.dart';

enum LoadingState { none, loading, error }

class DashBoardMainStore = _DashBoardMainStore with _$DashBoardMainStore;

abstract class _DashBoardMainStore with Store {
  final FormErrorState error = FormErrorState();
  List<ReactionDisposer> _disposers;
  NetworkService networkService = new NetworkService();
  AuthModel authModel = new AuthModel();

  @observable
  List<ClusterItem<Place>> items;
  @observable
  String noOfLikes;
  @observable
  String noOfComments;
  @observable
  bool isFilterListLoaded = false;
  @observable
  bool isBrokerListLoaded = false;
  @observable
  bool isPropertyPostLoaded = false;
  @observable
  bool isStoryPostLoaded = false;
  @observable
  bool isAdvertisementsLoaded = false;
  @observable
  bool isFollowSuggestionLoaded = false;
  @observable
  bool isMapVisible = false;
  @observable
  bool isbrokerMapVisible = false;
  @observable
  String homeTypeParentID = "";
  @observable
  List<bool> propertyChildCategoryIsClicked = [];
  @observable
  bool isMapAndListIconVisible = false;
  @observable
  bool isFilterVisible = false;
  @observable
  bool isChatVisible = false;
  @observable
  bool isSearchBarVisible = false;
  @observable
  double preferredSize = 100;
  @observable
  String titleHeadingForAppBar;
  @observable
  var userLoginAs = UserType.VISITOR;
  @observable
  int categoryID = 0;
  @observable
  String moreFiltercountryName;
  @observable
  String moreFiltercountryID;
  @observable
  String moreFiltercityName;
  @observable
  String moreFiltercityID;
  @observable
  String moreFilterlocationName;
  @observable
  String moreFilterlocationID;
  @observable
  String moreFilterPropertyPurposeType;
  @observable
  String moreFilterAreaUnit;
  @observable
  String moreFilterAreaUnitID;
  @observable
  String moreFilterCurrencyUnit;
  @observable
  String moreFilterCurrencyID;
  @observable
  String moreFilterMinPrice = "0";
  @observable
  String moreFilterMaxPrice = "Any";
  @observable
  String moreFilterMinArea = "0";
  @observable
  String moreFilterMaxArea = "Any";
  @observable
  var moreFilterHideShowAccordingToPropertyType = PropertyType.homes;
  @observable
  Brokers brokersList;
  @observable
  FilterPropertyModel filterPropertyModel;
  @observable
  List<PropertyFeatureAndNearBy> seletedPropertyFeatures;
  @observable
  List<PropertyFeatureAndNearBy> seletedPropertyNearBy;
  @observable
  int propertySubTypeSelected;
  @observable
  PostModel postModel;
  @observable
  StoriesModel storiesModel;
  @observable
  Advertisements advertisementsModel;
  @observable
  FollowSuggestion followSuggestionModel;
  @observable
  ToggleFollowUnFollow toggleFollowUnFollow;
  @observable
  PostLikeAndCommentsModel postLikeAndCommentsModel;
  @observable
  SavePostModel savePostModel;
  @observable
  bool isPostLiked = false;
  @observable
  var filterProperty = mainDashBoardMenu.none;
  @observable
  DeveloperModel developerModel;
  @observable
  bool isDeveloperListLoaded = false;
  @observable
  bool isDeveloperListLoadingMore = false;
  @observable
  int pageNumber = 1;
  @observable
  bool isInternetConnected = true;

  void setupValidations() {
    _disposers = [];
  }

  void updateUI() {
    setValue();
  }

  @action
  setValue() {
    if (isMapVisible)
      isMapVisible = false;
    else
      isMapVisible = true;
  }

  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  @action
  Future<bool> checkIntenetConnection() async {
    isInternetConnected = await networkService.checkIfInternetIsAvailable();
    return isInternetConnected;
  }

  @action
  Future<PostLikeAndCommentsModel> likeThepost(context, type, postID) async {
    postLikeAndCommentsModel =
        await networkService.likeOnPost(likeThePostApi, context, type, postID);
    if (postLikeAndCommentsModel.error == "false")
      isPostLiked = postLikeAndCommentsModel.likeStatus;
    return postLikeAndCommentsModel;
  }

  @action
  Future<FollowSuggestion> getFollowSuggestion(context) async {
    followSuggestionModel = await networkService.getFollowSuggestions(
        followSuggestion, context, "UserToUser");
    if (followSuggestionModel.error == "false") isFollowSuggestionLoaded = true;
    return followSuggestionModel;
  }

  @action
  Future<Advertisements> getAdvertisement(context) async {
    advertisementsModel = await networkService.getAdvertisement(
        advertisementApi, context, "General");
    if (advertisementsModel.error == "false") isAdvertisementsLoaded = true;
    return advertisementsModel;
  }

  @action
  Future<StoriesModel> getStories(context) async {
    storiesModel = await networkService.getStories(storiesApi, context);
    if (storiesModel.error == "false") isStoryPostLoaded = true;
    return storiesModel;
  }

  @action
  Future<PostModel> getProperties(context) async {
    postModel = await networkService.getProperties(propertiesApi, context);
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
    if (postModel.error == "false") isPropertyPostLoaded = true;
    return postModel;
  }

  @action
  Future<Brokers> getBrokers(context) async {
    brokersList = await networkService.getBrokersList(brokersApi, context);
    if (brokersList.error == "false") isBrokerListLoaded = true;
    return brokersList;
  }

  @action
  Future<FilterPropertyModel> getFiltersData(context) async {
    filterPropertyModel = await networkService.getFilters(filtersApi, context);
    if (filterPropertyModel.error == "false") isFilterListLoaded = true;
    return filterPropertyModel;
  }

  @action
  Future<ToggleFollowUnFollow> toggleFollowUser(context, followID) async {
    toggleFollowUnFollow = await networkService.toggleFollowUnFollowUser(
        postFollowUnFollow, context, followID);
    return toggleFollowUnFollow;
  }

  @action
  Future<PostLikeAndCommentsModel> getListOfLikesForPost(
      context, postID, type) async {
    postLikeAndCommentsModel = await networkService.getlikeForPost(
        getAllLikesForThePost, context, type, postID);
    return postLikeAndCommentsModel;
  }

  @action
  Future<PostLikeAndCommentsModel> getListOfCommentsForPost(
      context, postID, type) async {
    postLikeAndCommentsModel = await networkService.getCommentsForPost(
        getAllCommentsForThePost, context, type, postID);
    return postLikeAndCommentsModel;
  }

  @action
  Future<PostLikeAndCommentsModel> postCommentsForPost(
      context, postID, type, commentText) async {
    postLikeAndCommentsModel = await networkService.postCommentsForPost(
        commentOnThePostApi, context, type, postID, commentText);
    return postLikeAndCommentsModel;
  }

  @action
  Future<PostLikeAndCommentsModel> deleteCommentFromPost(
      context, postID, type, refID) async {
    postLikeAndCommentsModel = await networkService.deleteCommentsFromPost(
        commentOnThePostApi, context, type, postID, refID);
    return postLikeAndCommentsModel;
  }

  @action
  Future<SavePostModel> saveThePost(context, postID, type) async {
    savePostModel =
        await networkService.savePost(saveThePostApi, context, type, postID);
    return savePostModel;
  }

/* Get Developers */
  @action
  Future<DeveloperModel> getAllDeveloperData(
      context, pageNumber, search) async {
    developerModel = await networkService.getDeveloperData(
        getAllDevelopers, context, pageNumber, search);
    return developerModel;
  }

  @observable
  LoadingState state = LoadingState.loading;
}

class FormErrorState = _FormErrorState with _$FormErrorState;

abstract class _FormErrorState with Store {
  @computed
  bool get hasErrors => brokers.Datum != null;
}
