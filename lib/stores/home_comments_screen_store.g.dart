// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_comments_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeCommentScreenStore on _HomeCommentScreenStore, Store {
  final _$postLikeAndCommentsModelAtom =
      Atom(name: '_HomeCommentScreenStore.postLikeAndCommentsModel');

  @override
  PostLikeAndCommentsModel get postLikeAndCommentsModel {
    _$postLikeAndCommentsModelAtom.reportRead();
    return super.postLikeAndCommentsModel;
  }

  @override
  set postLikeAndCommentsModel(PostLikeAndCommentsModel value) {
    _$postLikeAndCommentsModelAtom
        .reportWrite(value, super.postLikeAndCommentsModel, () {
      super.postLikeAndCommentsModel = value;
    });
  }

  final _$savePostModelAtom =
      Atom(name: '_HomeCommentScreenStore.savePostModel');

  @override
  SavePostModel get savePostModel {
    _$savePostModelAtom.reportRead();
    return super.savePostModel;
  }

  @override
  set savePostModel(SavePostModel value) {
    _$savePostModelAtom.reportWrite(value, super.savePostModel, () {
      super.savePostModel = value;
    });
  }

  final _$getListOfLikesForPostAsyncAction =
      AsyncAction('_HomeCommentScreenStore.getListOfLikesForPost');

  @override
  Future<PostLikeAndCommentsModel> getListOfLikesForPost(
      dynamic context, dynamic postID, dynamic type) {
    return _$getListOfLikesForPostAsyncAction
        .run(() => super.getListOfLikesForPost(context, postID, type));
  }

  final _$getListOfCommentsForPostAsyncAction =
      AsyncAction('_HomeCommentScreenStore.getListOfCommentsForPost');

  @override
  Future<PostLikeAndCommentsModel> getListOfCommentsForPost(
      dynamic context, dynamic postID, dynamic type) {
    return _$getListOfCommentsForPostAsyncAction
        .run(() => super.getListOfCommentsForPost(context, postID, type));
  }

  final _$postCommentsForPostAsyncAction =
      AsyncAction('_HomeCommentScreenStore.postCommentsForPost');

  @override
  Future<PostLikeAndCommentsModel> postCommentsForPost(
      dynamic context, dynamic postID, dynamic type, dynamic commentText) {
    return _$postCommentsForPostAsyncAction.run(
        () => super.postCommentsForPost(context, postID, type, commentText));
  }

  final _$deleteCommentFromPostAsyncAction =
      AsyncAction('_HomeCommentScreenStore.deleteCommentFromPost');

  @override
  Future<PostLikeAndCommentsModel> deleteCommentFromPost(
      dynamic context, dynamic postID, dynamic type, dynamic refID) {
    return _$deleteCommentFromPostAsyncAction
        .run(() => super.deleteCommentFromPost(context, postID, type, refID));
  }

  final _$updateCommentForPostAsyncAction =
      AsyncAction('_HomeCommentScreenStore.updateCommentForPost');

  @override
  Future<PostLikeAndCommentsModel> updateCommentForPost(dynamic context,
      dynamic postID, dynamic type, dynamic refID, dynamic text) {
    return _$updateCommentForPostAsyncAction.run(
        () => super.updateCommentForPost(context, postID, type, refID, text));
  }

  final _$saveThePostAsyncAction =
      AsyncAction('_HomeCommentScreenStore.saveThePost');

  @override
  Future<SavePostModel> saveThePost(
      dynamic context, dynamic postID, dynamic type) {
    return _$saveThePostAsyncAction
        .run(() => super.saveThePost(context, postID, type));
  }

  @override
  String toString() {
    return '''
postLikeAndCommentsModel: ${postLikeAndCommentsModel},
savePostModel: ${savePostModel}
    ''';
  }
}
