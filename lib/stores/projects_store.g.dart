// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projects_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProjectStore on _ProjectStore, Store {
  final _$itemsAtom = Atom(name: '_ProjectStore.items');

  @override
  List<ClusterItem<Place>> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(List<ClusterItem<Place>> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  final _$isAdvertisementsLoadedAtom =
      Atom(name: '_ProjectStore.isAdvertisementsLoaded');

  @override
  bool get isAdvertisementsLoaded {
    _$isAdvertisementsLoadedAtom.reportRead();
    return super.isAdvertisementsLoaded;
  }

  @override
  set isAdvertisementsLoaded(bool value) {
    _$isAdvertisementsLoadedAtom
        .reportWrite(value, super.isAdvertisementsLoaded, () {
      super.isAdvertisementsLoaded = value;
    });
  }

  final _$isProjectsPostLoadedAtom =
      Atom(name: '_ProjectStore.isProjectsPostLoaded');

  @override
  bool get isProjectsPostLoaded {
    _$isProjectsPostLoadedAtom.reportRead();
    return super.isProjectsPostLoaded;
  }

  @override
  set isProjectsPostLoaded(bool value) {
    _$isProjectsPostLoadedAtom.reportWrite(value, super.isProjectsPostLoaded,
        () {
      super.isProjectsPostLoaded = value;
    });
  }

  final _$advertisementsModelAtom =
      Atom(name: '_ProjectStore.advertisementsModel');

  @override
  Advertisements get advertisementsModel {
    _$advertisementsModelAtom.reportRead();
    return super.advertisementsModel;
  }

  @override
  set advertisementsModel(Advertisements value) {
    _$advertisementsModelAtom.reportWrite(value, super.advertisementsModel, () {
      super.advertisementsModel = value;
    });
  }

  final _$postModelAtom = Atom(name: '_ProjectStore.postModel');

  @override
  PostModel get postModel {
    _$postModelAtom.reportRead();
    return super.postModel;
  }

  @override
  set postModel(PostModel value) {
    _$postModelAtom.reportWrite(value, super.postModel, () {
      super.postModel = value;
    });
  }

  final _$getAdvertisementAsyncAction =
      AsyncAction('_ProjectStore.getAdvertisement');

  @override
  Future<Advertisements> getAdvertisement(dynamic context) {
    return _$getAdvertisementAsyncAction
        .run(() => super.getAdvertisement(context));
  }

  final _$getPropertiesAsyncAction = AsyncAction('_ProjectStore.getProperties');

  @override
  Future<PostModel> getProperties(dynamic context) {
    return _$getPropertiesAsyncAction.run(() => super.getProperties(context));
  }

  @override
  String toString() {
    return '''
items: ${items},
isAdvertisementsLoaded: ${isAdvertisementsLoaded},
isProjectsPostLoaded: ${isProjectsPostLoaded},
advertisementsModel: ${advertisementsModel},
postModel: ${postModel}
    ''';
  }
}
