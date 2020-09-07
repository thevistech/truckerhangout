// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ResetPasswordStore on _ResetPasswordStore, Store {
  final _$codeAtom = Atom(name: '_ResetPasswordStore.code');

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

  final _$mobileNumberAtom = Atom(name: '_ResetPasswordStore.mobileNumber');

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

  final _$passwordAtom = Atom(name: '_ResetPasswordStore.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$confirmPasswordAtom =
      Atom(name: '_ResetPasswordStore.confirmPassword');

  @override
  String get confirmPassword {
    _$confirmPasswordAtom.reportRead();
    return super.confirmPassword;
  }

  @override
  set confirmPassword(String value) {
    _$confirmPasswordAtom.reportWrite(value, super.confirmPassword, () {
      super.confirmPassword = value;
    });
  }

  final _$_ResetPasswordStoreActionController =
      ActionController(name: '_ResetPasswordStore');

  @override
  void validatePassword(String value) {
    final _$actionInfo = _$_ResetPasswordStoreActionController.startAction(
        name: '_ResetPasswordStore.validatePassword');
    try {
      return super.validatePassword(value);
    } finally {
      _$_ResetPasswordStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateConfirmPassword(String value) {
    final _$actionInfo = _$_ResetPasswordStoreActionController.startAction(
        name: '_ResetPasswordStore.validateConfirmPassword');
    try {
      return super.validateConfirmPassword(value);
    } finally {
      _$_ResetPasswordStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
code: ${code},
mobileNumber: ${mobileNumber},
password: ${password},
confirmPassword: ${confirmPassword}
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

  final _$passwordAtom = Atom(name: '_FormErrorState.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$confirmPasswordAtom = Atom(name: '_FormErrorState.confirmPassword');

  @override
  String get confirmPassword {
    _$confirmPasswordAtom.reportRead();
    return super.confirmPassword;
  }

  @override
  set confirmPassword(String value) {
    _$confirmPasswordAtom.reportWrite(value, super.confirmPassword, () {
      super.confirmPassword = value;
    });
  }

  @override
  String toString() {
    return '''
password: ${password},
confirmPassword: ${confirmPassword},
hasErrors: ${hasErrors}
    ''';
  }
}
