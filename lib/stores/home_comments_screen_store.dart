import 'package:flutterapp/models/comment_model.dart';
import 'package:flutterapp/models/like_model.dart';
import 'package:flutterapp/resources/network_services.dart';
import 'package:flutterapp/resources/network_calls_apis.dart';
import 'package:flutterapp/stores/dashboard_main_store.dart';
import 'package:mobx/mobx.dart';
part 'home_comments_screen_store.g.dart';

class HomeCommentScreenStore = _HomeCommentScreenStore
    with _$HomeCommentScreenStore;

abstract class _HomeCommentScreenStore with Store {
  List<ReactionDisposer> _disposers;
  NetworkService networkService = new NetworkService();

  @observable
  PostLikeAndCommentsModel postLikeAndCommentsModel;
  @observable
  SavePostModel savePostModel;

  void setupValidations() {
    _disposers = [];
  }

  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  updateList(index) {
    postLikeAndCommentsModel.data.removeAt(index);
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
        deleteCommentsApi, context, type, postID, refID);
    if (postLikeAndCommentsModel.error == "true") return null;
    return postLikeAndCommentsModel;
  }

  @action
  Future<PostLikeAndCommentsModel> updateCommentForPost(
      context, postID, type, refID, text) async {
    postLikeAndCommentsModel = await networkService.updateCommentsFromPost(
        updateCommentsApi, context, type, postID, refID, text);
    if (postLikeAndCommentsModel.error == "true") return null;
    return postLikeAndCommentsModel;
  }

  @action
  Future<SavePostModel> saveThePost(context, postID, type) async {
    savePostModel =
        await networkService.savePost(saveThePostApi, context, type, postID);
    return savePostModel;
  }
}
