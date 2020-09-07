// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forget_password_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ForgetPasswordStore on _ForgetPasswordStore, Store {
  final _$emailAtom = Atom(name: '_ForgetPasswordStore.email');

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

  final _$codeAtom = Atom(name: '_ForgetPasswordStore.code');

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

  final _$numberAtom = Atom(name: '_ForgetPasswordStore.number');

  @override
  String get number {
    _$numberAtom.reportRead();
    return super.number;
  }

  @override
  set number(String value) {
    _$numberAtom.reportWrite(value, super.number, () {
      super.number = value;
    });
  }

  final _$isMobileCodeLoadedAtom =
      Atom(name: '_ForgetPasswordStore.isMobileCodeLoaded');

  @override
  bool get isMobileCodeLoaded {
    _$isMobileCodeLoadedAtom.reportRead();
    return super.isMobileCodeLoaded;
  }

  @override
  set isMobileCodeLoaded(bool value) {
    _$isMobileCodeLoadedAtom.reportWrite(value, super.isMobileCodeLoaded, () {
      super.isMobileCodeLoaded = value;
    });
  }

  final _$countryCodeAndFlagAtom =
      Atom(name: '_ForgetPasswordStore.countryCodeAndFlag');

  @override
  countryModel.Datum get countryCodeAndFlag {
    _$countryCodeAndFlagAtom.reportRead();
    return super.countryCodeAndFlag;
  }

  @override
  set countryCodeAndFlag(countryModel.Datum value) {
    _$countryCodeAndFlagAtom.reportWrite(value, super.countryCodeAndFlag, () {
      super.countryCodeAndFlag = value;
    });
  }

  final _$getCountryCodesAsyncAction =
      AsyncAction('_ForgetPasswordStore.getCountryCodes');

  @override
  Future<countryModel.CountryCodeModel> getCountryCodes(dynamic context) {
    return _$getCountryCodesAsyncAction
        .run(() => super.getCountryCodes(context));
  }

  final _$_ForgetPasswordStoreActionController =
      ActionController(name: '_ForgetPasswordStore');

  @override
  void validateNumber(String value) {
    final _$actionInfo = _$_ForgetPasswordStoreActionController.startAction(
        name: '_ForgetPasswordStore.validateNumber');
    try {
      return super.validateNumber(value);
    } finally {
      _$_ForgetPasswordStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateCode(String value) {
    final _$actionInfo = _$_ForgetPasswordStoreActionController.startAction(
        name: '_ForgetPasswordStore.validateCode');
    try {
      return super.validateCode(value);
    } finally {
      _$_ForgetPasswordStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
code: ${code},
number: ${number},
isMobileCodeLoaded: ${isMobileCodeLoaded},
countryCodeAndFlag: ${countryCodeAndFlag}
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

  final _$numberAtom = Atom(name: '_FormErrorState.number');

  @override
  String get number {
    _$numberAtom.reportRead();
    return super.number;
  }

  @override
  set number(String value) {
    _$numberAtom.reportWrite(value, super.number, () {
      super.number = value;
    });
  }

  @override
  String toString() {
    return '''
code: ${code},
number: ${number},
hasErrors: ${hasErrors}
    ''';
  }
}
