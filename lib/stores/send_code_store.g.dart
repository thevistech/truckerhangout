// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_code_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SendCodeStore on _SendCodeStore, Store {
  final _$mobileNumberAtom = Atom(name: '_SendCodeStore.mobileNumber');

  @override
  String get mobileNumber {
    _$mobileNumberAtom.reportRead();
    return super.mobileNumber;
  }

  @override
  set mobileNumber(String value) {
    _$mobileNumberAtom.reportWrite(value, super.mobileNumber, () {
      super.mobileNumber = value;
    });
  }

  final _$codeAtom = Atom(name: '_SendCodeStore.code');

  @override
  String get code {
    _$codeAtom.reportRead();
    return super.code;
  }

  @override
  set code(String value) {
    _$codeAtom.reportWrite(value, super.code, () {
      super.code = value;
    });
  }

  final _$_SendCodeStoreActionController =
      ActionController(name: '_SendCodeStore');

  @override
  void validateMobileNumber(String value) {
    final _$actionInfo = _$_SendCodeStoreActionController.startAction(
        name: '_SendCodeStore.validateMobileNumber');
    try {
      return super.validateMobileNumber(value);
    } finally {
      _$_SendCodeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateCode(String value) {
    final _$actionInfo = _$_SendCodeStoreActionController.startAction(
        name: '_SendCodeStore.validateCode');
    try {
      return super.validateCode(value);
    } finally {
      _$_SendCodeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
mobileNumber: ${mobileNumber},
code: ${code}
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

  final _$mobileNumberAtom = Atom(name: '_FormErrorState.mobileNumber');

  @override
  String get mobileNumber {
    _$mobileNumberAtom.reportRead();
    return super.mobileNumber;
  }

  @override
  set mobileNumber(String value) {
    _$mobileNumberAtom.reportWrite(value, super.mobileNumber, () {
      super.mobileNumber = value;
    });
  }

  final _$codeAtom = Atom(name: '_FormErrorState.code');

  @override
  String get code {
    _$codeAtom.reportRead();
    return super.code;
  }

  @override
  set code(String value) {
    _$codeAtom.reportWrite(value, super.code, () {
      super.code = value;
    });
  }

  @override
  String toString() {
    return '''
mobileNumber: ${mobileNumber},
code: ${code},
hasErrors: ${hasErrors}
    ''';
  }
}
