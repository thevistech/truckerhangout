// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_calls_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UsersCallsStore on _DashBoardMainStore, Store {
  final _$iscallsLoadedAtom = Atom(name: '_DashBoardMainStore.iscallsLoaded');

  @override
  bool get iscallsLoaded {
    _$iscallsLoadedAtom.reportRead();
    return super.iscallsLoaded;
  }

  @override
  set iscallsLoaded(bool value) {
    _$iscallsLoadedAtom.reportWrite(value, super.iscallsLoaded, () {
      super.iscallsLoaded = value;
    });
  }

  final _$getCallsAsyncAction = AsyncAction('_DashBoardMainStore.getCalls');

  @override
  Future<UsersCalslModel> getCalls(dynamic context) {
    return _$getCallsAsyncAction.run(() => super.getCalls(context));
  }

  @override
  String toString() {
    return '''
iscallsLoaded: ${iscallsLoaded}
    ''';
  }
}
