// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UsersProfile on _users, Store {
  final _$profileModelAtom = Atom(name: '_users.profileModel');

  @override
  ProfileModel get profileModel {
    _$profileModelAtom.reportRead();
    return super.profileModel;
  }

  @override
  set profileModel(ProfileModel value) {
    _$profileModelAtom.reportWrite(value, super.profileModel, () {
      super.profileModel = value;
    });
  }

  final _$isUsersLoadedAtom = Atom(name: '_users.isUsersLoaded');

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

  final _$getProfileAsyncAction = AsyncAction('_users.getProfile');

  @override
  Future<ProfileModel> getProfile(dynamic context, String userId) {
    return _$getProfileAsyncAction.run(() => super.getProfile(context, userId));
  }

  @override
  String toString() {
    return '''
profileModel: ${profileModel},
isUsersLoaded: ${isUsersLoaded}
    ''';
  }
}
