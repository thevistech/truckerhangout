import 'package:flutterapp/models/forget_password.dart';
import 'package:flutterapp/resources/network_services.dart';
import 'package:flutterapp/resources/network_calls_apis.dart';
import 'package:mobx/mobx.dart';

import 'forget_password_store.dart';

part 'send_code_store.g.dart';

class SendCodeStore = _SendCodeStore with _$SendCodeStore;

abstract class _SendCodeStore with Store {
  // store the parent
  NetworkService networkService = new NetworkService();
  Forgetpassword forgetpassword = new Forgetpassword();
  
  @observable
  String mobileNumber = '';
  @observable
  String code = '';

  List<ReactionDisposer> _disposers;
  final FormErrorState error = FormErrorState();

  void setupValidations() {
    _disposers = [
      reaction((_) => mobileNumber, validateMobileNumber),
      reaction((_) => code, validateCode)
    ];
  }

  @action
  void validateMobileNumber(String value) {
    error.mobileNumber = value.isEmpty ? 'Mobile number cannot be empty' : null;
  }

  @action
  void validateCode(String value) {
    error.code = value.length < 6 ? 'Code cant be less than 6' : null;
  }

  Future<Forgetpassword> verifyCode(context) async {
    forgetpassword =
        await networkService.verifyCode(verifyCodeApi, mobileNumber, code, context);
    return forgetpassword;
  }

  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }
}

class FormErrorState = _FormErrorState with _$FormErrorState;

abstract class _FormErrorState with Store {
  @observable
  String mobileNumber;

  @observable
  String code;

  @computed
  bool get hasErrors => mobileNumber != null || code != null;
}
