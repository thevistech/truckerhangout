// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignInStore on _SignInStore, Store {
  Computed<int> _$factsComputed;

  @override
  int get facts => (_$factsComputed ??=
          Computed<int>(() => super.facts, name: '_SignInStore.facts'))
      .value;

  final _$emailAtom = Atom(name: '_SignInStore.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$passwordAtom = Atom(name: '_SignInStore.password');

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

  final _$authUserAtom = Atom(name: '_SignInStore.authUser');

  @override
  List<AuthModel> get authUser {
    _$authUserAtom.reportRead();
    return super.authUser;
  }

  @override
  set authUser(List<AuthModel> value) {
    _$authUserAtom.reportWrite(value, super.authUser, () {
      super.authUser = value;
    });
  }

  final _$stateAtom = Atom(name: '_SignInStore.state');

  @override
  LoadingState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(LoadingState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$_SignInStoreActionController = ActionController(name: '_SignInStore');

  @override
  void validatePassword(String value) {
    final _$actionInfo = _$_SignInStoreActionController.startAction(
        name: '_SignInStore.validatePassword');
    try {
      return super.validatePassword(value);
    } finally {
      _$_SignInStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateEmail(String value) {
    final _$actionInfo = _$_SignInStoreActionController.startAction(
        name: '_SignInStore.validateEmail');
    try {
      return super.validateEmail(value);
    } finally {
      _$_SignInStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool checkIfEmailAndPasswordAreEmpty(String email, String password) {
    final _$actionInfo = _$_SignInStoreActionController.startAction(
        name: '_SignInStore.checkIfEmailAndPasswordAreEmpty');
    try {
      return super.checkIfEmailAndPasswordAreEmpty(email, password);
    } finally {
      _$_SignInStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
password: ${password},
authUser: ${authUser},
state: ${state},
facts: ${facts}
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

  final _$emailAtom = Atom(name: '_FormErrorState.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

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

  @override
  String toString() {
    return '''
email: ${email},
password: ${password},
hasErrors: ${hasErrors}
    ''';
  }
}
