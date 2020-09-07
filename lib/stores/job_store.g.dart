// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$JobsStore on _JobsStore, Store {
  final _$itemsAtom = Atom(name: '_JobsStore.items');

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

  final _$jobsModelAtom = Atom(name: '_JobsStore.jobsModel');

  @override
  JobsModel get jobsModel {
    _$jobsModelAtom.reportRead();
    return super.jobsModel;
  }

  @override
  set jobsModel(JobsModel value) {
    _$jobsModelAtom.reportWrite(value, super.jobsModel, () {
      super.jobsModel = value;
    });
  }

  final _$isJobsListLoadedAtom = Atom(name: '_JobsStore.isJobsListLoaded');

  @override
  bool get isJobsListLoaded {
    _$isJobsListLoadedAtom.reportRead();
    return super.isJobsListLoaded;
  }

  @override
  set isJobsListLoaded(bool value) {
    _$isJobsListLoadedAtom.reportWrite(value, super.isJobsListLoaded, () {
      super.isJobsListLoaded = value;
    });
  }

  final _$isAdvertisementsLoadedAtom =
      Atom(name: '_JobsStore.isAdvertisementsLoaded');

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

  final _$advertisementsModelAtom =
      Atom(name: '_JobsStore.advertisementsModel');

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

  final _$getAdvertisementAsyncAction =
      AsyncAction('_JobsStore.getAdvertisement');

  @override
  Future<Advertisements> getAdvertisement(dynamic context) {
    return _$getAdvertisementAsyncAction
        .run(() => super.getAdvertisement(context));
  }

  final _$getJobsListAsyncAction = AsyncAction('_JobsStore.getJobsList');

  @override
  Future<JobsModel> getJobsList(dynamic context, dynamic pagno) {
    return _$getJobsListAsyncAction
        .run(() => super.getJobsList(context, pagno));
  }

  @override
  String toString() {
    return '''
items: ${items},
jobsModel: ${jobsModel},
isJobsListLoaded: ${isJobsListLoaded},
isAdvertisementsLoaded: ${isAdvertisementsLoaded},
advertisementsModel: ${advertisementsModel}
    ''';
  }
}
