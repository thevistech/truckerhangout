// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_property_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreatePropertyStore on _CreatePropertyStore, Store {
  final _$localeNamesAtom = Atom(name: '_CreatePropertyStore.localeNames');

  @override
  String get localeNames {
    _$localeNamesAtom.reportRead();
    return super.localeNames;
  }

  @override
  set localeNames(String value) {
    _$localeNamesAtom.reportWrite(value, super.localeNames, () {
      super.localeNames = value;
    });
  }

  final _$localeIDAtom = Atom(name: '_CreatePropertyStore.localeID');

  @override
  String get localeID {
    _$localeIDAtom.reportRead();
    return super.localeID;
  }

  @override
  set localeID(String value) {
    _$localeIDAtom.reportWrite(value, super.localeID, () {
      super.localeID = value;
    });
  }

  @override
  String toString() {
    return '''
localeNames: ${localeNames},
localeID: ${localeID}
    ''';
  }
}

mixin _$FormErrorState on _FormErrorState, Store {
  Computed<bool> _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: '_FormErrorState.hasErrors'))
          .value;

  @override
  String toString() {
    return '''
hasErrors: ${hasErrors}
    ''';
  }
}
